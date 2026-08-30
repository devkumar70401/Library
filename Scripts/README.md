# 🛠️ Library Automation Scripts & Tools

Centralized automation suite for coursework ingestion, media downloads, format conversions, and AI model weight retrieval.

---

## 📂 Catalog of Tools

### 1. 📺 YouTube & Media Ingestion (`YouTube_Ingestion/`)
* **[`yt_downloader_cli.py`](yt_downloader_cli.py)**:
  * High-speed CLI downloader for lecture videos, audio tracks, and playlists via `yt-dlp`.
  * **Usage:**
    ```bash
    python3 yt_downloader_cli.py "https://youtube.com/watch?v=..."
    ```
* **[`yt_downloader_gui.py`](yt_downloader_gui.py)**:
  * Tkinter/GUI interface for interactive video/audio stream selection and batch downloading.

### 3. 📝 Document & Notebook Converters (`Notebook_Converters/`)
* **[`ipynb_to_md.py`](ipynb_to_md.py)**:
  * Converts Jupyter Notebooks (`.ipynb`) into clean, GitHub-flavored Markdown (`.md`) while preserving LaTeX math equations and code blocks.
  * **Usage:**
    ```bash
    python3 ipynb_to_md.py path/to/notebook.ipynb -o output.md
    ```
