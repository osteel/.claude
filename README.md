# Skills

Personal agent skills for Claude Code and Codex.

Each subfolder is a skill that can be loaded by the respective agent harness.

## Installing

Clone the repository in `~/.agents/skills`:

```sh
git clone git@github.com:osteel/agent-skills.git ~/.agents/skills
```

## Syncing

`sync.sh` symlinks every skill folder into `~/.claude/skills/` and `~/.codex/skills/`. Run it after adding a new skill:

```sh
./sync.sh
```

Existing symlinks are skipped.
