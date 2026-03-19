---
name: wrap-up
description: Wraps up completed work – updates PLAN.md if present, updates AI guidelines and ADR docs where applicable, commits everything, then opens or updates a GitHub PR. Guards against working on main.
user-invocable: true
disable-model-invocation: true
---

Follow these steps in order. Do not skip steps.

## 1. Check the current branch

Run `git branch --show-current`.

If the branch is `main` or `master`, stop and tell the user they're on the main branch. Suggest a sensible branch name based on recent changes or the current task, and offer to create the branch before continuing.

## 2. Check for PLAN.md

Use the Glob tool to check if `PLAN.md` exists in the working directory (it could be in subfolders).

If found:
- Read it
- Run `git diff HEAD` and `git status --short` to understand what changed
- Determine which phases or tasks should be marked completed and what (if anything) needs updating
- Present your proposed changes to the user and wait for approval before editing PLAN.md
- Apply approved changes to PLAN.md before continuing

## 3. Update AI guidelines (Laravel projects only)

Check if an `.ai/guidelines/` directory exists in the project root. If it does not exist, skip this step silently.

If it exists, examine the uncommitted diff (`git diff HEAD`) for any non-obvious project-specific decisions that future agents would not infer from standard Laravel patterns or existing guidelines. If you find anything worth recording, invoke the `laravel-guidelines` skill. If nothing qualifies, skip silently.

## 4. Create an ADR (if applicable)

Check if a directory for ADRs exists in the project (look for `docs/decisions/`, `docs/adr/`, or similar). If no such directory exists, skip this step silently.

If it exists, examine the uncommitted diff (`git diff HEAD`) for architectural or significant design decisions that warrant an ADR. If you identify one, invoke the `adr` skill. If nothing warrants an ADR, skip silently.

## 5. Commit uncommitted changes (if any)

Run `git status --short` (never `-uall`).

If there are staged or unstaged changes (including any PLAN.md or ADR files from the steps above):
- Run `git diff HEAD` to understand what changed
- Stage relevant files by name (never `git add -A` or `git add .`)
- Write a clear commit message and commit immediately (no confirmation needed)
- Commit using the project's default git config (no co-author lines, no Claude attribution)

## 6. Push the branch

Check if the branch has a remote tracking branch and is ahead. Push with `-u origin <branch>` if needed.

## 7. Check for an existing PR

Run `gh pr view --json number,title,url 2>/dev/null`.

Branch on the result:
- **No PR exists** → go to step 8
- **PR exists** → go to step 9

## 8. Create the PR

Gather context:
- `git log main...HEAD --oneline` — all commits on this branch
- `git diff main...HEAD` — full diff

Write a PR title (under 70 chars) and body using this format:

```
## Summary
- <bullet points covering what changed and why>

## Test plan
- <bulleted checklist of what to verify>
```

Do not add "Generated with Claude Code" or any mention of Claude/AI in the PR description. Create with:

```
gh pr create --title "..." --body "$(cat <<'EOF'
...
EOF
)"
```

Then print the PR URL.

## 9. Update the existing PR

Gather context:
- `git log main...HEAD --oneline`
- `git diff main...HEAD`
- Current PR body: `gh pr view --json body -q .body`

Rewrite the PR description to reflect the current state of the branch (same format as step 7). Update with:

```
gh pr edit --body "$(cat <<'EOF'
...
EOF
)"
```

Then print the PR URL.
