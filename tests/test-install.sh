#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd -P)"
DEVELOPER_HOME="$HOME"
SANDBOX="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/codex-skin-studio-test.XXXXXX")"
TEST_HOME="$SANDBOX/home"
TEST_CODEX_HOME="$TEST_HOME/.codex"
TARGET="$TEST_CODEX_HOME/skills/codex-skin-studio"

cleanup() {
  /bin/rm -rf "$SANDBOX"
}
trap cleanup EXIT

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

/bin/mkdir -p "$TEST_HOME"

HOME="$TEST_HOME" CODEX_HOME="$TEST_CODEX_HOME" \
  /bin/bash "$REPO_ROOT/install.sh"

[ -f "$TARGET/SKILL.md" ] || fail "SKILL.md was not installed"
[ -x "$TARGET/scripts/skin-studio.sh" ] || fail "skin-studio.sh is not executable"
[ -x "$TARGET/scripts/auto-start.command" ] || fail "auto-start.command is not executable"
[ -x "$TARGET/scripts/uninstall.sh" ] || fail "uninstall.sh is not executable"
[ -f "$TEST_HOME/Desktop/Codex Skin Studio.command" ] || fail "prompt launcher is missing"
[ -f "$TEST_HOME/Desktop/Codex Skin Studio - Auto Start.command" ] || fail "automatic launcher is missing"
[ -f "$TEST_HOME/Desktop/Codex Skin Studio - Restore.command" ] || fail "restore launcher is missing"

if [ -n "$DEVELOPER_HOME" ] && /usr/bin/grep -R -n -F "$DEVELOPER_HOME" "$TARGET" >/dev/null 2>&1; then
  fail "installed files contain a developer home path"
fi

/bin/bash -n "$REPO_ROOT/install.sh"
/bin/bash -n "$REPO_ROOT/uninstall.sh"
/bin/bash -n "$TARGET/scripts/skin-studio.sh"
/bin/bash -n "$TARGET/scripts/auto-start.command"
/bin/bash -n "$TARGET/scripts/uninstall.sh"
/usr/bin/env node --check "$TARGET/scripts/studio-controller.mjs"
/usr/bin/env node --check "$TARGET/assets/skin-manager.js"

# GitHub's direct-download Skill installer does not preserve executable bits.
# Every agent-facing entry must still work when invoked through /bin/bash, and
# the generated Desktop launchers must do the same.
/bin/chmod 644 \
  "$TARGET/scripts/skin-studio.sh" \
  "$TARGET/scripts/auto-start.command" \
  "$TARGET/scripts/uninstall.sh"
HOME="$TEST_HOME" CODEX_HOME="$TEST_CODEX_HOME" \
  /bin/bash "$TARGET/scripts/skin-studio.sh" doctor >/dev/null
HOME="$TEST_HOME" CODEX_HOME="$TEST_CODEX_HOME" \
  /bin/bash "$TARGET/scripts/skin-studio.sh" install-launchers >/dev/null
/usr/bin/grep -q 'exec /bin/bash' "$TEST_HOME/Desktop/Codex Skin Studio.command" \
  || fail "download-mode launcher does not invoke bash explicitly"
/usr/bin/grep -q 'exec /bin/bash' "$TEST_HOME/Desktop/Codex Skin Studio - Auto Start.command" \
  || fail "download-mode automatic launcher does not invoke bash explicitly"

# A second install is an in-place upgrade and must leave a complete Skill.
HOME="$TEST_HOME" CODEX_HOME="$TEST_CODEX_HOME" \
  /bin/bash "$REPO_ROOT/install.sh" --no-launchers
[ -f "$TARGET/references/structured-theme.schema.json" ] || fail "upgrade lost the design schema"

HOME="$TEST_HOME" CODEX_HOME="$TEST_CODEX_HOME" \
  /bin/bash "$TARGET/scripts/uninstall.sh" --help >/dev/null

printf 'PASS: clean install, GitHub download-mode permissions, launchers, path portability, syntax, and repeatable upgrade.\n'
