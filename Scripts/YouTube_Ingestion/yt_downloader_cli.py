"""
yt_downloader_cli.py - High-Fidelity YouTube Media Downloader (CLI Edition)
Location: /home/dev/SE/Notes/00_Meta_&_System/scripts/yt_downloader_cli.py

Features:
  1. Original Format MP4: Downloads highest available video & audio combined without lossy re-encoding.
  2. Zero-Quote Interactive Mode: Type "yt" and paste your link directly without escaping special characters.
  3. Direct CLI Mode: "yt <url>" downloads directly to ~/Music and exits cleanly.
"""

import sys
import os
import shutil
import argparse
from pathlib import Path
import yt_dlp


def get_default_music_dir() -> Path:
    """Returns the default music directory (~/Music), creating it if necessary."""
    music_dir = Path.home() / "Music"
    music_dir.mkdir(parents=True, exist_ok=True)
    return music_dir


def get_node_runtime() -> dict:
    """Finds the available Node.js binary to handle YouTube n-sig / cipher execution."""
    candidates = [
        shutil.which("node"),
        shutil.which("nodejs"),
        str(Path.home() / "SE/Library/.venv/bin/node"),
        str(Path.home() / "SE/Projects/.venv/bin/node"),
        str(Path.home() / "SE/Notes/.venv/bin/node"),
    ]
    for candidate in candidates:
        if candidate and (os.path.exists(candidate) or shutil.which(candidate)):
            return {"node": {"path": candidate}}
    return {}


def download_media(urls: list[str], output_dir: Path = None, format_type: str = "mp3") -> int:
    """Downloads YouTube media in MP3 (audio) or original high-quality MP4 (video) format."""
    if output_dir is None:
        output_dir = get_default_music_dir()
    else:
        output_dir = Path(output_dir).expanduser().resolve()
        output_dir.mkdir(parents=True, exist_ok=True)

    is_mp3 = (format_type.lower() == "mp3")

    print("\n" + "=" * 65)
    if is_mp3:
        print("🎵  \033[1;36mYouTube High-Quality MP3 Downloader\033[0m")
        print(f"📁  Destination: \033[1;33m{output_dir}\033[0m")
        print(f"⚡  Format:      \033[1;32mHigh Quality MP3 (Best Audio Stream + VBR 0)\033[0m")
    else:
        print("🎬  \033[1;36mYouTube Original Format MP4 Downloader\033[0m")
        print(f"📁  Destination: \033[1;33m{output_dir}\033[0m")
        print(f"⚡  Format:      \033[1;32mOriginal Highest Quality MP4 (Native Streams)\033[0m")
    print("=" * 65 + "\n")

    if is_mp3:
        ydl_opts = {
            "format": "bestaudio/best",
            "outtmpl": str(output_dir / "%(title)s.%(ext)s"),
            "noplaylist": True,
            "writethumbnail": False,
            "socket_timeout": 30,
            "retries": 10,
            "fragment_retries": 10,
            "quiet": False,
            "no_warnings": True,
            "postprocessors": [
                {
                    "key": "FFmpegExtractAudio",
                    "preferredcodec": "mp3",
                    "preferredquality": "0",
                },
                {
                    "key": "FFmpegMetadata",
                    "add_metadata": True,
                },
            ],
        }
    else:
        ydl_opts = {
            "format": "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
            "outtmpl": str(output_dir / "%(title)s.%(ext)s"),
            "merge_output_format": "mp4",
            "noplaylist": True,
            "writethumbnail": False,
            "socket_timeout": 30,
            "retries": 10,
            "fragment_retries": 10,
            "quiet": False,
            "no_warnings": True,
            "postprocessors": [
                {
                    "key": "FFmpegMetadata",
                    "add_metadata": True,
                }
            ],
        }

    js_runtime = get_node_runtime()
    if js_runtime:
        ydl_opts["js_runtimes"] = js_runtime

    success_count = 0
    for idx, url in enumerate(urls, start=1):
        url = url.strip()
        if not url:
            continue
        print(f"\033[1;35m[{idx}/{len(urls)}]\033[0m Connecting: \033[4m{url}\033[0m")
        try:
            with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                info = ydl.extract_info(url, download=True)
                title = info.get("title", "Unknown Title")
                acodec = info.get("acodec", "Native")
                
                if is_mp3:
                    out_file = output_dir / f"{title}.mp3"
                    print(f"\n\033[1;32m✅ Successfully Downloaded MP3:\033[0m {title}")
                    print(f"   • File:     \033[1;34m{title}.mp3\033[0m (Audio Stream: {acodec})")
                else:
                    ext = info.get("ext", "mp4")
                    vcodec = info.get("vcodec", "Native")
                    out_file = output_dir / f"{title}.{ext}"
                    print(f"\n\033[1;32m✅ Successfully Downloaded MP4:\033[0m {title}")
                    print(f"   • File:     \033[1;34m{title}.{ext}\033[0m (Video: {vcodec}, Audio: {acodec})")
                
                print(f"   • Saved To: \033[1;33m{out_file}\033[0m\n")
                success_count += 1
        except Exception as e:
            print(f"\n\033[1;31m❌ Error downloading {url}:\033[0m {e}")
            if "403" in str(e) or "Forbidden" in str(e):
                print("   \033[1;33m💡 Tip: Run 'pip install -U yt-dlp' to update decipher keys.\033[0m\n")

    print("=" * 65)
    print(f"🎉  \033[1;32mFinished: {success_count}/{len(urls)} downloaded successfully.\033[0m")
    print("=" * 65 + "\n")
    return 0 if success_count == len(urls) else 1


def main():
    prog_name = Path(sys.argv[0]).stem
    default_format = "mp4" if "yt4" in prog_name else "mp3"

    parser = argparse.ArgumentParser(
        description=f"yt - High-Speed Pure YouTube Media Downloader (Invoked as {prog_name})",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  yt https://youtu.be/xyz          (Download MP3 audio to ~/Music)\n"
            "  yt4 https://youtu.be/xyz         (Download MP4 video to ~/Music)\n"
            "  yt                               (Interactive prompt for MP3)\n"
            "  yt4                              (Interactive prompt for MP4)\n"
            "  yt <url> --format mp4            (Explicit format override)\n"
            "  yt <url> --dir ~/Downloads       (Custom destination directory)"
        )
    )
    parser.add_argument("urls", nargs="*", help="YouTube video URLs to download")
    parser.add_argument("--dir", "-d", type=str, default=None, help="Custom download directory (default: ~/Music)")
    parser.add_argument(
        "--format", "-f",
        choices=["mp3", "mp4"],
        default=default_format,
        help=f"Output format: mp3 (audio) or mp4 (video) (default: {default_format})"
    )
    parser.add_argument(
        "--mp3",
        action="store_const",
        dest="format",
        const="mp3",
        help="Download as high-quality MP3 audio"
    )
    parser.add_argument(
        "--mp4",
        action="store_const",
        dest="format",
        const="mp4",
        help="Download as original high-quality MP4 video"
    )

    args = parser.parse_args()

    if not args.urls:
        mode_label = "MP3 Audio" if args.format == "mp3" else "MP4 Video"
        icon_label = "🎵" if args.format == "mp3" else "🎬"
        print(f"\n\033[1;36m{icon_label} YouTube Downloader [{mode_label}] (Interactive Mode)\033[0m")
        print("💡 \033[90mTip: You can paste any link here without using quotes.\033[0m")
        try:
            raw_url = input("\n🔗 Paste YouTube URL: ").strip()
        except (KeyboardInterrupt, EOFError):
            print("\n\033[1;33mCancelled by user.\033[0m")
            sys.exit(0)

        if not raw_url:
            print("\033[1;31mNo URL provided. Exiting.\033[0m")
            sys.exit(1)
        args.urls = [raw_url]

    sys.exit(download_media(urls=args.urls, output_dir=args.dir, format_type=args.format))


if __name__ == "__main__":
    main()
