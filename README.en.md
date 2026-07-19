# Codex Skin Studio

[中文](README.md) · [English](README.en.md)

Full-interface, local image- and MP4-driven skins for the macOS Codex desktop app. Skin Studio coordinates the sidebar, title bar, workspace, cards, composer, menus, settings, and dialogs instead of tiling the same wallpaper into separate regions.

![Codex Skin Studio ocean video theme](docs/images/theme-01.webp)

> [!IMPORTANT]
> This is an unofficial project. It currently supports macOS and the signed Codex desktop app with bundle identifier `com.openai.codex`. It never patches the app bundle, `app.asar`, its code signature, or `~/.codex/config.toml`.

## Gallery

The background media keeps its original color treatment. Skin Studio separately derives accessible interface colors, translucency, control shapes, and text contrast.

<table>
  <tr>
    <td width="50%"><img src="docs/images/theme-02.webp" alt="Four cats Open theme"></td>
    <td width="50%"><img src="docs/images/theme-03.webp" alt="Floral restrained theme"></td>
  </tr>
  <tr>
    <td align="center">Open / AI design</td>
    <td align="center">Restrained</td>
  </tr>
  <tr>
    <td><img src="docs/images/theme-04.webp" alt="Valley video theme"></td>
    <td><img src="docs/images/theme-05.webp" alt="Furry character Open theme"></td>
  </tr>
  <tr>
    <td align="center">Local MP4</td>
    <td align="center">Open / AI design</td>
  </tr>
</table>

![Codex Skin Studio manager](docs/images/skin-manager.webp)

The screenshots show real locally saved skins. Their original image and video files are not included in this repository.

## Highlights

- One image or local looping MP4 covers the complete Codex window, with focal point, opacity, content clarity, and blur controls.
- A native-style **Skin** sidebar entry and in-app theme manager.
- Restrained, automatic Open, and Skill-generated AI design modes.
- Accessible UI palettes derived from the media without recoloring, saturating, desaturating, or grading the source image/video.
- Structured **Design UI** generation for media-specific navigation rhythm, landing composition, cards, controls, and stagecraft.
- Saved-theme switching, renaming, deletion, pause, and one-click official restoration.
- Compatibility preflight, bounded rollback, and poster-frame fallback for video failures.

## Install

### Option 1: double-click installer

1. Choose **Code → Download ZIP** on GitHub and extract the complete repository.
2. Right-click `Install Codex Skin Studio.command` and choose **Open**.
3. The installer verifies Codex, installs the Skill to `~/.codex/skills/codex-skin-studio`, and creates Desktop launchers.
4. Restart Codex once so it discovers the new Skill.

The first launch of a downloaded `.command` file may require confirmation from macOS. Use **Open** from the context menu; do not disable system security protections.

### Option 2: Terminal

```bash
git clone https://github.com/huzhicheng/codex-skin-studio.git
cd codex-skin-studio
./install.sh
```

Install and attempt activation immediately:

```bash
./install.sh --activate
```

The installer is safe to rerun for upgrades. Updating the Skill does not remove saved local themes.

### Option 3: ask Codex

Give Codex this repository URL and say:

> Use skill-installer to install the Skill at `skills/codex-skin-studio` from this repository.

After installation and one Codex restart, say:

> Use codex-skin-studio to install the Desktop launchers.

## First run

Ask Codex:

> Use codex-skin-studio to start the skin manager.

Or use the Desktop launchers:

- `Codex Skin Studio.command`: starts on demand and asks before a required restart.
- `Codex Skin Studio - Auto Start.command`: a user-initiated one-click activation handoff.
- `Codex Skin Studio - Restore.command`: removes the skin and restarts Codex normally.

Once active, **Skin** appears in the primary Codex sidebar. Choose an image or MP4, adjust its focal point, switch between Restrained and Open, or click **Design UI** to create a media-specific structured design. Generated designs remain saved with their skins and can be replaced or switched back to the automatic template without deleting them.

## Manager vs. Skill

The in-app manager handles frequent visual actions: importing media, switching skins, adjusting strength, deleting themes, and restoring appearance.

The `codex-skin-studio` Skill handles installation, compatibility diagnostics, safe activation and recovery, plus the reasoning step that analyzes the current media and produces a constrained structured UI design. It is not merely a fixed template recolor.

## Interface modes

- **Restrained** keeps native Codex control proportions and applies coordinated surfaces and theme colors.
- **Open** uses an automatic expressive template for the landing page, navigation states, buttons, cards, and composer.
- **AI design** applies the independent structured design generated for the current media.
- **Generation boldness** controls the next Design UI request (Subtle, Wild, or Crazy) without changing the source image colors.

## Commands

```bash
SKILL_ROOT="${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio"

/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" doctor
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" install-launchers
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" start
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" status
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" restore
/bin/bash "$SKILL_ROOT/scripts/skin-studio.sh" restore --restart
```

## Restore and uninstall

Live restore without restarting Codex:

```bash
/bin/bash "${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio/scripts/skin-studio.sh" restore
```

Full restore and normal restart:

```bash
/bin/bash "${CODEX_HOME:-$HOME/.codex}/skills/codex-skin-studio/scripts/skin-studio.sh" restore --restart
```

Remove the Skill and launchers while preserving local themes:

```bash
./uninstall.sh
```

Remove local themes and logs as well:

```bash
./uninstall.sh --restart --purge-data
```

## Troubleshooting

### The Skin entry does not appear

Restart Codex once after installation, then use `Codex Skin Studio - Auto Start.command`, or run `doctor` followed by `start`. A failed compatibility check rolls back the visual layer and keeps Codex available; it does not enter an automatic restart loop.

### A Codex update breaks the layout

Run `doctor` and `status`. Skin Studio fails closed when shell markers no longer match. Use `restore` to keep working with the official interface, then update Skin Studio.

### The image does not fill the window, or the subject is too large

The canvas uses full-window `cover`, so it does not shrink to create empty borders. Use the focal-point control to protect the subject; large media/window aspect-ratio differences necessarily crop the outer edges.

### MP4 playback fails

Playback and decode errors stay inside the visual layer. The locally extracted poster frame remains visible and the error never restarts Codex.

### Contrast changes after switching ChatGPT/Codex workspaces

Since v0.16.3, Skin Studio reconciles active skin tokens across workspace changes and independently protects sidebar labels, icons, and the active Send/Stop action.

## Privacy and security

- Imported images and MP4 files remain local by default.
- Only an explicit **Design UI** click sends the active still image or the locally extracted poster frame to one ephemeral Codex design request. The MP4 itself is never exported.
- Generated output must pass the bundled versioned structured schema. Arbitrary CSS, HTML, JavaScript, URLs, remote fonts, and shell commands are rejected.
- The debugging endpoint binds to loopback, and renderer targets must pass `app://` plus Codex-shell verification.
- Skin mode uses an isolated Chromium profile and does not copy Cookies, Local Storage, Preferences, or session files from the official profile.
- Activation is a single bounded attempt. A failed preflight rolls back the skin, stops the watcher, and leaves Codex running without retries.

See the [security policy](SECURITY.md) and [runtime security model](skills/codex-skin-studio/references/security.md).

## Development and packaging

```bash
./tests/test-install.sh
./scripts/package-release.sh
./tests/test-release.sh
```

Release artifacts are written to `dist/`: a complete repository ZIP and a standalone `.skill` package. Read [CONTRIBUTING.md](CONTRIBUTING.md) before contributing. Runtime changes should also pass live `doctor`, `verify-theme`, `verify-ui`, and full-restore checks on macOS.

## License

[MIT License](LICENSE). This project is not affiliated with or endorsed by OpenAI. Media visible in screenshots is not included in the software distribution.
