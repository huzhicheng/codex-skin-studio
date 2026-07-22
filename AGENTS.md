# Agent instructions

If a user asks you (an AI agent such as Codex or Claude Code) to install this
skill, install it by running the repository installer — do not install by
copying files.

## How to install

```bash
git clone https://github.com/huzhicheng/codex-skin-studio.git
cd codex-skin-studio
./install.sh
```

`./install.sh` does three things a plain file copy does not:

1. Preflights the signed Codex runtime (`com.openai.codex`) on macOS.
2. Installs the skill to `~/.codex/skills/codex-skin-studio`.
3. Creates the Desktop launchers 「Codex皮肤 - 启动 / 一键启动 / 恢复官方」.

Then tell the user to restart Codex once so it discovers the skill.

Do NOT install by copying `skills/codex-skin-studio/` into
`~/.codex/skills/` directly (for example via a generic skill-installer). That
skips the preflight and, importantly, does not create the Desktop launchers —
the user ends up with the skill but no launchers. If the skill was already
copied in this way, run
`~/.codex/skills/codex-skin-studio/scripts/skin-studio.sh install-launchers`
to create them.

macOS only. If `./install.sh` reports that the Codex app was not found or has an
invalid signature, surface that to the user; do not work around it.
