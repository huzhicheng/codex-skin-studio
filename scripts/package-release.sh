#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd -P)"
VERSION="$(/usr/bin/tr -d '[:space:]' < "$REPO_ROOT/VERSION")"
DIST_ROOT="$REPO_ROOT/dist"
STAGING_ROOT="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/codex-skin-studio-release.XXXXXX")"

cleanup() {
  /bin/rm -rf "$STAGING_ROOT"
}
trap cleanup EXIT

[ -n "$VERSION" ] || { printf 'VERSION is empty.\n' >&2; exit 1; }
/bin/mkdir -p "$DIST_ROOT"
/bin/rm -f \
  "$DIST_ROOT/codex-skin-studio-v$VERSION.zip" \
  "$DIST_ROOT/codex-skin-studio-v$VERSION.skill"

/usr/bin/ditto "$REPO_ROOT" "$STAGING_ROOT/codex-skin-studio"
/bin/rm -rf \
  "$STAGING_ROOT/codex-skin-studio/.git" \
  "$STAGING_ROOT/codex-skin-studio/dist"
/usr/bin/find "$STAGING_ROOT/codex-skin-studio" \( -name '.DS_Store' -o -name '__MACOSX' \) -prune -exec /bin/rm -rf {} +

(
  cd "$STAGING_ROOT"
  /usr/bin/zip -qryX "$DIST_ROOT/codex-skin-studio-v$VERSION.zip" codex-skin-studio
)
(
  cd "$STAGING_ROOT/codex-skin-studio/skills"
  /usr/bin/zip -qryX "$DIST_ROOT/codex-skin-studio-v$VERSION.skill" codex-skin-studio
)

(
  cd "$DIST_ROOT"
  /usr/bin/shasum -a 256 \
    "codex-skin-studio-v$VERSION.zip" \
    "codex-skin-studio-v$VERSION.skill" \
    > SHA256SUMS
)

printf 'Release artifacts created in %s\n' "$DIST_ROOT"
/bin/ls -lh "$DIST_ROOT"
