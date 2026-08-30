#!/usr/bin/env bash
# ================================================================================
# AGY FULL DISCOVERY & ARCHIVE SCRIPT
# Finds every agy/Antigravity-related artifact on the machine (workspace config,
# global config, conversation history, caches, editor storage, shell hooks),
# COPIES all of it (originals untouched) into one staging folder, then compresses
# that folder into SE/archives/. Deletion is a separate, later, manual step —
# see the printed summary at the end for exactly what that would involve.
# ================================================================================

set -uo pipefail   # NOTE: deliberately not -e — a missing candidate path must
                    # not abort the whole run; every check below handles absence.

TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
SE_ROOT="${SE_ROOT:-$HOME/SE}"                      # adjust if your SE folder differs
STAGE_DIR="/tmp/agy_archive_staging_${TIMESTAMP}"
ARCHIVE_DEST_DIR="${SE_ROOT}/archives"
ARCHIVE_NAME="agy_full_archive_${TIMESTAMP}.zip"
MANIFEST="${STAGE_DIR}/MANIFEST.txt"

mkdir -p "$STAGE_DIR" "$ARCHIVE_DEST_DIR"
touch "$MANIFEST"

echo "== AGY Full Discovery & Archive =="
echo "Staging area : $STAGE_DIR"
echo "Final archive: ${ARCHIVE_DEST_DIR}/${ARCHIVE_NAME}"
echo ""

log() { echo "$1" | tee -a "$MANIFEST" ; }

# --------------------------------------------------------------------------
# Helper: copy a path (file or dir) into the staging area, preserving its
# full original path structure so nothing is ambiguous later, and logging
# what was found (size, type) into the manifest.
# --------------------------------------------------------------------------
collect() {
    local src="$1"
    local category="$2"
    if [ -e "$src" ]; then
        local dest="${STAGE_DIR}${src}"       # mirror full original path
        mkdir -p "$(dirname "$dest")"
        cp -a "$src" "$dest" 2>>"${STAGE_DIR}/copy_errors.log"
        local size
        size=$(du -sh "$src" 2>/dev/null | cut -f1)
        log "[FOUND:${category}] $src  (size: ${size:-unknown})"
    else
        log "[absent:${category}] $src"
    fi
}

log "AGY Full Archive Manifest — generated ${TIMESTAMP}"
log "======================================================"

# --------------------------------------------------------------------------
# 1. WORKSPACE-LEVEL CONFIG (project-specific)
# --------------------------------------------------------------------------
log ""
log "--- 1. Workspace-level (${SE_ROOT}) ---"
collect "${SE_ROOT}/GEMINI.md"              "workspace_config"
collect "${SE_ROOT}/AGENTS.md"              "workspace_config"
collect "${SE_ROOT}/.agents"                "workspace_config"
collect "${SE_ROOT}/.memory"                "workspace_memory"
collect "${SE_ROOT}/vault"                  "workspace_memory"

# --------------------------------------------------------------------------
# 2. GLOBAL MACHINE CONFIG
# --------------------------------------------------------------------------
log ""
log "--- 2. Global config (~/.gemini/config) ---"
collect "$HOME/.gemini/config"              "global_config"

# --------------------------------------------------------------------------
# 3. RUNTIME / APP STATE / CONVERSATION HISTORY / CACHE
# --------------------------------------------------------------------------
log ""
log "--- 3. Runtime, conversation history, cache ---"
collect "$HOME/.gemini/antigravity-cli"     "runtime_and_history"
collect "$HOME/.cache/antigravity"          "cache"
collect "$HOME/.cache/gemini"               "cache"
collect "$HOME/.local/share/antigravity"    "app_data"
collect "$HOME/.local/state/antigravity"    "app_state"
collect "$HOME/.config/antigravity"         "app_config"

# --------------------------------------------------------------------------
# 4. VS CODE INTEGRATION (extension storage, if Antigravity runs as an
#    extension/integration inside VS Code's integrated terminal usage)
# --------------------------------------------------------------------------
log ""
log "--- 4. VS Code integration storage ---"
if [ -d "$HOME/.config/Code/User/globalStorage" ]; then
    find "$HOME/.config/Code/User/globalStorage" -maxdepth 1 -iname "*antigrav*" -o -iname "*gemini*" 2>/dev/null | \
    while read -r p; do collect "$p" "vscode_global_storage"; done
fi
if [ -d "$HOME/.config/Code/User/workspaceStorage" ]; then
    # workspaceStorage entries are hashed folders; grep their internal
    # workspace.json for a reference to this SE folder, then collect matches.
    grep -rl "SE" "$HOME/.config/Code/User/workspaceStorage" --include="workspace.json" 2>/dev/null | \
    while read -r wsjson; do
        wsdir="$(dirname "$wsjson")"
        collect "$wsdir" "vscode_workspace_storage"
    done
fi

# --------------------------------------------------------------------------
# 5. BROAD SWEEP — catch anything not in the known paths above.
#    Scoped to $HOME only (never system-wide "/") for safety and speed.
#    Explicitly excludes node_modules, .git, venv, __pycache__ so this
#    doesn't pull unrelated project noise into the archive.
# --------------------------------------------------------------------------
log ""
log "--- 5. Broad sweep of \$HOME for anything else matching 'gemini' or 'antigrav' ---"
find "$HOME" \
    \( -iname "*antigrav*" -o -iname "*gemini*" \) \
    -not -path "*/node_modules/*" \
    -not -path "*/.git/*" \
    -not -path "*/venv/*" \
    -not -path "*/__pycache__/*" \
    -not -path "${STAGE_DIR}*" \
    2>/dev/null | while read -r p; do
        # skip anything already explicitly collected above to avoid duplicate copies
        already_dest="${STAGE_DIR}${p}"
        if [ ! -e "$already_dest" ]; then
            collect "$p" "broad_sweep_extra"
        fi
    done

# --------------------------------------------------------------------------
# 6. SHELL PROFILE REFERENCES — search only, never move the whole rc file
#    (moving ~/.bashrc etc. would break your entire shell). Just report
#    matching lines so you can manually remove them if desired.
# --------------------------------------------------------------------------
log ""
log "--- 6. Shell profile references (reported only, files NOT moved) ---"
for rcfile in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.bash_profile"; do
    if [ -f "$rcfile" ]; then
        matches=$(grep -in "gemini\|antigrav\|agy" "$rcfile" 2>/dev/null)
        if [ -n "$matches" ]; then
            log "[shell_reference] $rcfile contains:"
            echo "$matches" | while read -r line; do log "    $line"; done
        fi
    fi
done

# --------------------------------------------------------------------------
# 7. SCHEDULED TASKS / BACKGROUND SERVICES — search only, report only.
# --------------------------------------------------------------------------
log ""
log "--- 7. Scheduled tasks / user services (reported only) ---"
if command -v crontab >/dev/null 2>&1; then
    cronmatches=$(crontab -l 2>/dev/null | grep -in "gemini\|antigrav\|agy")
    [ -n "$cronmatches" ] && log "[cron] $cronmatches"
fi
if command -v systemctl >/dev/null 2>&1; then
    svcmatches=$(systemctl --user list-units --all 2>/dev/null | grep -in "gemini\|antigrav\|agy")
    [ -n "$svcmatches" ] && log "[systemd_user] $svcmatches"
fi

# --------------------------------------------------------------------------
# FINALIZE: compress the staging folder into SE/archives/
# --------------------------------------------------------------------------
log ""
log "--- Finalizing archive ---"
cd "$(dirname "$STAGE_DIR")" || exit 1
zip -r -q "${ARCHIVE_DEST_DIR}/${ARCHIVE_NAME}" "$(basename "$STAGE_DIR")"
ARCHIVE_SIZE=$(du -sh "${ARCHIVE_DEST_DIR}/${ARCHIVE_NAME}" 2>/dev/null | cut -f1)

echo ""
echo "=========================================================="
echo " DONE — nothing was deleted from its original location."
echo " Archive created: ${ARCHIVE_DEST_DIR}/${ARCHIVE_NAME}  (${ARCHIVE_SIZE})"
echo " Full manifest also included inside the archive as MANIFEST.txt"
echo "=========================================================="
echo ""
echo "NEXT STEP (manual, separate, NOT run by this script):"
echo "  Once you've opened the archive and confirmed everything you"
echo "  expected is inside it, THEN you may choose to delete the"
echo "  originals listed as [FOUND:...] in the manifest above."
echo "  Do this only after verifying the archive, one path at a time:"
echo "    rm -rf <path>"
echo "  This script intentionally does not do this for you."
