# Contributing

Contributions are welcome, especially compatibility fixes for new Codex releases, selector hardening, accessibility improvements, and reproducible visual bugs.

Before opening a pull request:

1. Keep the official Codex bundle and user configuration untouched.
2. Preserve loopback-only CDP, verified `app://` targets, bounded timeouts, and fail-closed rollback.
3. Do not add remote dependencies, telemetry, arbitrary generated CSS/script, or automatic restart loops.
4. Run `./tests/test-install.sh`.
5. Run the live `doctor`, `verify-theme`, `verify-ui`, and full restore checks on macOS when the change touches runtime behavior.
6. Explain which Codex version and layout were tested. Remove personal paths and media from logs and screenshots.

Visual changes should include before/after screenshots that use redistributable media. Security-sensitive changes should update both `SECURITY.md` and the bundled runtime security reference.
