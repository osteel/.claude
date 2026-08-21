# PR Body Format

**Check for a template first.** Look in `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE.md`, `.github/PULL_REQUEST_TEMPLATE/`, the repo root, and `docs/`. `gh pr create --body` bypasses the template entirely, so nothing applies it for you.

When a template exists, it *is* the format. Fill in its sections, honour any length guidance it gives, and add nothing beyond it — no extra headings, no tables, no "worth knowing" or "out of scope" sections you invented. Detail that doesn't fit belongs in the commit message, an ADR, or a review comment. Strip the template's HTML comments from the body you submit; they're authoring guidance, not content.

When there is no template, you are free to format the body however best suits the change. This is a reasonable default:

```
Fixes #<N>   <!-- only when the branch name starts with "<N>-" and the issue exists & is open; omit the line entirely otherwise -->

## Description
<short prose on what the work does and why — two paragraphs preferred, a third only when the work genuinely needs it>

## Changes
- <one bullet per change>
```

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
