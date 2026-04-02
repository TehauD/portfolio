# Running this locally with Python

`index.html` is a static file with no server-side code, so technically you
can just double-click it and it'll open in your browser. But opening it via
`file://` disables a few browser features (clipboard access, some font
loading edge cases), so serving it over `http://localhost` is more reliable
— and this is also the setup to use if you plan to extend the site with any
Python-based tooling later (a build/minify step, a link checker, etc.).

Below is a self-contained local setup using a Python virtual environment.

## 1. Prerequisites

- Python 3.9 or later (`python3 --version` to check)

## 2. Create and activate a virtual environment

From inside this package's folder:

**macOS / Linux**
```bash
python3 -m venv venv
source venv/bin/activate
```

**Windows (PowerShell)**
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**Windows (Command Prompt)**
```cmd
python -m venv venv
venv\Scripts\activate.bat
```

Your terminal prompt should now show `(venv)` at the start of the line.

## 3. Install dependencies (optional)

The site itself has no Python dependencies — it's static HTML/CSS/JS. A
`requirements.txt` is included as a placeholder in case you add local
tooling later (e.g. `pillow` for image processing, `htmlmin` for
minification):

```bash
pip install -r requirements.txt
```

If you have nothing to add yet, you can skip this step entirely.

## 4. Serve the site locally

Python's built-in `http.server` module needs no extra packages:

```bash
python3 -m http.server 8080
```

Then open **http://localhost:8080** in your browser. Press `Ctrl+C` in the
terminal to stop the server when you're done.

## 5. Leaving the virtual environment

When you're finished:

```bash
deactivate
```

This returns your terminal to its normal (non-venv) state. The `venv/`
folder can be deleted safely at any time — it's just the isolated Python
environment, not part of the site itself.

## Troubleshooting

| Symptom | Fix |
|---|---|
| `python3: command not found` | Try `python` instead — Windows installs often use that name. |
| Fonts don't load locally | Google Fonts requires an internet connection even when serving locally — the page falls back to system fonts offline. |
| Port 8080 already in use | Pick another port, e.g. `python3 -m http.server 8090`, and adjust the URL accordingly. |
