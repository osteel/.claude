---
name: laravel-guidelines
description: Manages project-specific AI guidelines in `.ai/guidelines/` for Laravel projects. Use when the user wants to record, update, or remove a non-obvious project convention, architectural decision, or tricky detail that agents wouldn't infer from standard Laravel patterns or CLAUDE.md. Also activates automatically after completing a Laravel implementation task to capture any non-obvious decisions made.
user-invocable: true
disable-model-invocation: false
---

# Laravel Guidelines Manager

After completing a Laravel implementation task, or when explicitly asked, review whether any non-obvious decisions were made that future agents would not easily infer.

## What belongs in guidelines

Only record details that are **all three** of:
- Project-specific (not standard Laravel convention)
- Not already covered in the project's `CLAUDE.md`
- Something an agent would only discover through deep codebase analysis — not something guessable

Examples of what qualifies:
- Non-standard file locations that deviate from Laravel convention
- Invariants enforced at an unusual layer (e.g. business logic intentionally on a model)
- Tricky sequencing rules in jobs, observers, or event listeners
- Constraints that must never be violated and aren't obvious from the code structure

Examples of what does NOT qualify:
- Standard Eloquent patterns, relationship types, casting
- Anything already in `CLAUDE.md` or inferable from directory structure
- Implementation details that are self-documenting in the code

## Process

1. Check whether `.ai/guidelines/` exists in the project root. If not, and guidelines are warranted, create it.
2. Read all existing `.md` files in `.ai/guidelines/`.
3. Decide: does the new information belong in an existing file, warrant a new file, or require removing/amending a stale entry?
4. Make the minimum necessary change — add, amend, or delete. Do not rewrite files wholesale.
5. Keep every entry as short as possible. One line per rule where possible.
6. Remind the user to run `php artisan boost:install` to apply the updated guidelines. Do not run it yourself.

## File organisation

Group guidelines by concern (e.g. `scheduler.md`, `notifications.md`, `auth.md`). A single `conventions.md` is fine for small projects. Never create a file just to have one — only create when there is content that genuinely belongs there.
