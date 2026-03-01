# home.hiraeth

Static landing page for **Hiraeth Archives & Guides** at [home.hiraeth.wiki](https://home.hiraeth.wiki), serving as a central portal to core Hiraeth services and tools.

## What This Project Is

This repository contains a lightweight, no-build static website used as the homepage for the Hiraeth ecosystem. It is intentionally simple: one HTML file with embedded CSS/JavaScript plus static image/favicon assets.

The goal is to provide a single, easy-to-share entry point for players and contributors to reach Hiraeth resources.

## Live Site and Linked Services

- Primary site: [https://home.hiraeth.wiki](https://home.hiraeth.wiki)

Key Archives links in the page:
- [Foundry VTT](https://fvtt.hiraeth.wiki/)
- [Interactive Maps](https://maps.hiraeth.wiki)
- [Miniatures Library](https://minis.hiraeth.wiki)
- [Stat Block Maker](https://stats.hiraeth.wiki/)
- [Gem Standings](https://gems.hiraeth.wiki)
- [The Wiki](https://www.hiraeth.wiki)

Adventurer's Tools links in the page:
- [Character Sheets](https://cloud.jaxsnjohnson.com/s/2Cd8Ez8MNrNzDkT)
- [Gem Standings](https://gems.hiraeth.wiki)
- Useful Videos for New Players (placeholder/TBD, currently `#`)
- [Guide: How to Create a Character](https://www.hiraeth.wiki/books/basic-rules-how-to-make-a-pc)

## Tech Stack and Architecture

- Static HTML page: `index.html`
- Embedded CSS and JavaScript (no separate build artifacts)
- Client-side light/dark theme toggle
- Theme preference persisted in browser `localStorage`
- No framework
- No package manager
- No build pipeline

## Repository Layout

- `index.html`: page structure, styles, and behavior
- `assets/images/*`: card background images
- `assets/favicon/*`: favicon and Apple touch icon files
- `CNAME`: custom domain configuration (`home.hiraeth.wiki`)

## Local Development

Quick check:

```bash
open index.html
```

Recommended (serve locally for browser behavior closer to production):

```bash
python3 -m http.server 8080
```

Then open [http://localhost:8080](http://localhost:8080).

Contributor workflow:
1. Edit copy, links, card markup, styles, or JS behavior in `index.html`.
2. Replace or add imagery under `assets/images/` as needed.
3. Keep favicon assets in `assets/favicon/` aligned with any branding updates.
4. Verify both themes and responsive layout before publishing.

## Content Update Guide

### Update Key Archives Cards

1. In `index.html`, locate the `<section id="key-sites">` block.
2. Add, remove, or edit `<a class="card">` entries.
3. For each card, update:
   - `href` target URL
   - `<h3>` title text
   - `<p>` description text
   - `style="background-image: url('assets/images/...')"` path
4. Confirm links open correctly and images load.

### Update Adventurer's Tools Links

1. In `index.html`, locate `<section id="useful-links">`.
2. Edit or add `<li><a ...>` items.
3. Replace placeholder `href="#"` entries when real content is available.
4. Keep labels concise and user-facing.

### Replace Card Imagery

- Current card images use files named `*-1920x1080.jpg` in `assets/images/`.
- Recommended baseline: 1920x1080 (16:9) to match current presentation.
- Keep filenames and paths consistent with references in `index.html`.
- After replacement, verify text readability over image overlays in both themes.

## Deployment and Hosting

This project is deployed as a static site with a custom domain.

### Hosting Flow

1. Commit and push changes to the repository's default branch.
2. Static hosting provider syncs the latest commit and republishes the site.
3. `CNAME` defines the custom domain as `home.hiraeth.wiki`.

> Note: This repo does not include explicit CI/CD workflow files; deployment details are intentionally host-agnostic.

### Deployment Checklist

1. Confirm all outbound links open and route correctly.
2. Confirm image assets load with no broken paths.
3. Confirm layout on desktop and mobile widths.
4. Confirm theme toggle works and preference persists after reload.
5. Confirm `CNAME` still contains `home.hiraeth.wiki`.
6. Confirm production page reflects the latest commit.

## Known Constraints and Notes

- The site is intentionally simple static HTML/CSS/JS.
- There is a placeholder "Useful Videos for New Players" link (`#`) that should be replaced when content is available.
- Keep asset paths consistent (`assets/images/...`, `assets/favicon/...`) to avoid broken references.

## Public APIs / Interfaces / Types

None. This repository does not expose runtime APIs or schemas, and this documentation does not introduce any.

## License / Ownership

No license file is currently present in this repository. If reuse or external contributions are intended, add an explicit license.
