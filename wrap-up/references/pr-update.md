# PR Body Format

Match the repo's own PR template when it has one (`.github/pull_request_template.md`, or `.github/PULL_REQUEST_TEMPLATE/`) — read it and fill in its sections rather than imposing the default below. `gh pr create --body` bypasses the template, so following it is on you.

Default when the repo has no template:

```
Fixes #<N>   <!-- only when the branch name starts with "<N>-" and the issue exists & is open; omit the line entirely otherwise -->

## Description
<short prose on what the work does and why — two paragraphs at most>

## Changes
- <one bullet per change>
```

Strip the template's HTML comments from the body you submit — they're authoring guidance, not content.

Do not add "Generated with Claude Code" or any mention of Claude/AI.

Create immediately (no confirmation needed):
```
gh pr create --title "..." --body "$(cat <<'EOF'
...
EOF
)"
```

# Ancestor check (for existing PR)

Determines whether an existing PR belongs to the current branch's history or to a reused branch name:

```bash
git merge-base --is-ancestor <headRefOid> HEAD && echo yes || echo no
```

- `yes` → PR belongs to this branch → update it (step 11)
- `no` → branch name reused, different work → create new PR (step 10)
