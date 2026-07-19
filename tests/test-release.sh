#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd -P)"
VERSION="$(/usr/bin/tr -d '[:space:]' < "$REPO_ROOT/VERSION")"
ARCHIVE="$REPO_ROOT/dist/codex-skin-studio-v$VERSION.zip"
SKILL_ARCHIVE="$REPO_ROOT/dist/codex-skin-studio-v$VERSION.skill"
SANDBOX="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/codex-skin-studio-release-test.XXXXXX")"
TEST_HOME="$SANDBOX/home"
SKILL_LIST="$SANDBOX/skill-files.txt"

cleanup() {
  /bin/rm -rf "$SANDBOX"
}
trap cleanup EXIT

[ -f "$ARCHIVE" ] || { printf 'Build the release first: ./scripts/package-release.sh\n' >&2; exit 1; }
[ -f "$SKILL_ARCHIVE" ] || { printf 'Missing .skill artifact.\n' >&2; exit 1; }

if /usr/bin/unzip -Z1 "$ARCHIVE" | /usr/bin/grep -E '(__MACOSX|\.DS_Store|/dist/)' >/dev/null; then
  printf 'Release archive contains packaging metadata.\n' >&2
  exit 1
fi

/usr/bin/unzip -q "$ARCHIVE" -d "$SANDBOX/source"
/bin/mkdir -p "$TEST_HOME"
HOME="$TEST_HOME" CODEX_HOME="$TEST_HOME/.codex" \
  /bin/bash "$SANDBOX/source/codex-skin-studio/install.sh" --no-launchers

[ -f "$TEST_HOME/.codex/skills/codex-skin-studio/SKILL.md" ] \
  || { printf 'Packaged repository did not install the Skill.\n' >&2; exit 1; }

/usr/bin/unzip -Z1 "$SKILL_ARCHIVE" > "$SKILL_LIST"
/usr/bin/grep -Fxq 'codex-skin-studio/SKILL.md' "$SKILL_LIST" \
  || { printf '.skill package has the wrong root layout.\n' >&2; exit 1; }

printf 'PASS: release ZIP installs from an extracted copy and the .skill layout is valid.\n'
