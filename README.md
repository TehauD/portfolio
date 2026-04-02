# Tehau DeBarthe — Portfolio Site

A single-file, self-contained marketing/portfolio page for Tehau DeBarthe —
Enterprise AI Architect & Machine Learning Engineer.

**Live preview:** https://claude.ai/artifact/Kohwr2sVVFmpL6VhhvyX1H

---

## What's in this package

```
.
├── index.html              The full site — one file, no build step
├── README.md                This file
└── RUNNING-LOCALLY.md        How to preview it on your own machine
```

## Design concept

The visual language is drafting/blueprint-inspired — a grid-line hero that
draws itself in on load, monospace annotations used as real section
indices (not decoration), and a CAD-style title bar in the nav. It's meant
to read as "systems architecture," not a generic template.

- **Zero dependencies** beyond Google Fonts (Fraunces, Inter, IBM Plex Mono),
  loaded via `<link>` tags in `<head>`.
- **Light and dark themes** are both built in. It follows the visitor's OS
  preference by default; the "MODE" button in the top-right cycles
  System → Light → Dark.
- **No JavaScript framework, no build tool.** Everything — HTML, CSS, and
  the small amount of JS for the theme toggle and the hero grid animation —
  lives in `index.html`.
- **Content sources:** the copy is pulled directly from the LinkedIn About
  section and live GitHub repositories at the time this was built. If either
  changes, update the corresponding section in `index.html` directly — there's
  no CMS or data file to keep in sync.

## Deploying

This is a static file, so it will run anywhere that serves static HTML:

- **GitHub Pages** — commit `index.html` to a repo (e.g. a repo named
  `<username>.github.io`, or any repo with Pages enabled on a branch), and it
  will be served at that URL with no configuration.
- **Netlify / Vercel / Cloudflare Pages** — drag-and-drop the file, or connect
  the repo; no build command is needed.
- **Any static host or web server** — Nginx, Apache, S3 + CloudFront, etc.

## Customizing

Everything lives in `index.html`, organized top to bottom in the same order
it renders:

| Section | What to edit |
|---|---|
| `<style>` block, `:root` | Color tokens (light theme) and the `dark` overrides just below it |
| `.hero` | Headline, byline, and the two primary call-to-action buttons |
| `#focus` | The focus-area grid items |
| `#systems` | Project panels — name, description, tags, and repo link, one `.system` block each |
| `#initiatives` | The "recent initiatives" log rows |
| `#experience` | The timeline — one `.tl-item` per role |
| `#education` | Degrees and certifications |
| `#connect` | Closing statement and contact links |

To add or remove a project panel, copy an existing `.system` block inside
`#systems` and edit its contents — no other file needs to change.

## Known gaps

- The `RESONANCE-MK-II` GitHub project isn't represented yet — add a
  `.system` panel for it once its description is finalized.
- The experience section is intentionally condensed for a marketing page
  rather than a full resume; expand individual `.tl-item` blocks if you want
  more detail.
