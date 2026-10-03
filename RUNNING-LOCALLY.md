# Running the Portfolio Locally

This portfolio is a static site built with HTML, CSS, and JavaScript.

You can open `index.html` directly in a browser. For more consistent testing, serve the repository through `localhost`. This avoids common `file://` restrictions and better matches a hosted environment.

## Quick Start

From the repository root, run:

```bash
python -m http.server 8000
```

Then open:

```text
http://localhost:8000
```

Press `Ctrl+C` in the terminal to stop the server.

## Prerequisite

Confirm that Python is available:

```bash
python --version
```

Some macOS and Linux environments use `python3` instead:

```bash
python3 --version
```

If `python3` is the available command, start the server with:

```bash
python3 -m http.server 8000
```

## Optional Virtual Environment

A virtual environment is not required to run the portfolio. The site has no Python runtime dependencies.

Create a virtual environment only if you plan to add local development tools such as:

- Link validation
- HTML or CSS optimization
- Image processing
- Accessibility checks
- Build or deployment automation

Create the environment:

```bash
python -m venv .venv
```

### Activate on Windows PowerShell

```powershell
.\.venv\Scripts\Activate.ps1
```

### Activate on Windows Command Prompt

```cmd
.venv\Scripts\activate.bat
```

### Activate on macOS or Linux

```bash
source .venv/bin/activate
```

Deactivate the environment when finished:

```bash
deactivate
```

The `.venv/` directory is local development state and should not be committed. Add it to `.gitignore`:

```gitignore
.venv/
```

## Dependencies

No dependency installation is required for the current site.

Do not add an empty or placeholder `requirements.txt`. Add one only when the repository introduces Python-based tooling that requires external packages.

## Using Another Port

If port `8000` is already in use, select another port:

```bash
python -m http.server 8080
```

Then open:

```text
http://localhost:8080
```

## Verify the Site

After the local server starts, verify the following:

- The homepage loads without console errors
- Navigation links move to the expected sections
- Light and dark themes work
- External links open correctly
- The layout remains readable at desktop, tablet, and mobile widths
- Web fonts load when an internet connection is available
- System font fallbacks remain readable when offline

## Troubleshooting

### Python command not found

Try the alternate executable name:

```bash
python3 --version
```

On Windows, Python may also be available through the launcher:

```powershell
py -m http.server 8000
```

### Port already in use

Choose another port:

```bash
python -m http.server 8081
```

### Fonts look different offline

The portfolio requests web fonts from Google Fonts. Without an internet connection, the browser uses the configured system font fallbacks.

### PowerShell blocks virtual-environment activation

A virtual environment is optional. You can still serve the site without activating one:

```powershell
python -m http.server 8000
```

### Changes do not appear

Refresh the browser. If the browser continues to show older content, perform a hard refresh or disable the browser cache while developer tools are open.

## Project Philosophy

The local workflow is intentionally simple:

- No application framework
- No build command
- No package installation
- No server-side runtime
- No required virtual environment

The repository keeps tooling lightweight so attention stays on the portfolio’s ideas, systems, research interests, and opportunities for thoughtful connection.
