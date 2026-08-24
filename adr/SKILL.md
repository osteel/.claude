---
name: adr
description: Create architectural decision records in MADR format. Use when the user wants to document a technical decision, record an architecture choice, or create an ADR. Also invoke proactively after completing a significant architectural or design decision, even if the user hasn't explicitly asked for an ADR. For non-obvious project conventions (naming, patterns, framework quirks), use a project guidelines skill if one exists — ADRs are for decisions with context, alternatives, and rationale; guidelines are for terse conventions future agents need to follow.
effort: medium
---

# Create an ADR

## Steps

1. **Auto-detect numbering**: Scan `docs/decisions/` for existing ADR files matching `NNNN-*.md`. Use the next sequential number. If the directory doesn't exist, start at `0001`.

2. **Gather context**: Gather context from the current conversation first. Only ask if the decision and considered options aren't already clear.

3. **Review existing ADRs**: Read all existing ADR files and check whether any are related to this new decision:
   - **Superseded**: an existing ADR that this decision fully replaces (e.g. the new decision reverses or obsoletes the old one). Note the ADR number and title — the new ADR will supersede it, and the old one will need its status updated.
   - **Extended**: an existing ADR this decision builds on or narrows without replacing it entirely. Note it for the "Related" field.
   - **Conflicting**: an existing ADR that appears to contradict this decision. Flag it to the user before drafting.

   If no existing ADRs are related, proceed without comment.

4. **Draft the ADR**: Write the full ADR content using the template below and present it to the user as a markdown code block. Populate "Supersedes" and "Related" fields if applicable. Do NOT create any file yet.

5. **Wait for approval**: Ask the user to review the draft and confirm or request changes before proceeding. If any existing ADRs will be superseded or updated, list them explicitly so the user knows what else will change. Do not create or edit any file until the user explicitly approves.

6. **Create the file** at `docs/decisions/NNNN-kebab-case-title.md` only after approval, incorporating any requested changes. Create the directory if it doesn't exist.

7. **Update superseded and amended ADRs**: For each ADR this decision supersedes, edit it to set `Status: superseded` and fill in `Superseded by: NNNN - Title`. For each ADR this decision *amends* — changes part of, without replacing — add `Amended by: NNNN - Title` to it and `Amends: NNNN - Title` to the new one. Keeping the chain accurate is what makes the decision graph navigable: a stale status misleads future readers into thinking a replaced decision is still live.

   **Every contradiction needs a forward pointer.** If this ADR changes a config value, a component order, a model choice or a named mechanism that an earlier ADR states, the earlier ADR must gain a pointer to this one — even when the relationship is too small for `Amends`, in which case `Related` will do. Without it the old ADR keeps asserting the old value in the present tense and nothing warns the reader. This is the single most common way a decision record goes quietly wrong.

8. **Update the index**: If `docs/decisions/README.md` exists, read it first and append the new ADR in the same style as existing entries.

## How much code to name

An ADR records *why*, and its references should be at the altitude that survives a refactor. Name three kinds of thing:

- **The subject of the decision** — the class, enum or interface the decision is about. If renaming it would make the ADR meaningless, it belongs. A rename *should* force a re-read.
- **Durable anchors** — database columns, config keys, routes, package names, and a vendor's own vocabulary (their event names, their API fields). These outlive class refactors and are usually the right thing to pin a decision to.
- **The one mechanism the decision turns on**, where there is one — a single interface swap, a single guard.

Keep out the implementation detail that will rot without changing the decision: helper methods, call sites, collaborators mentioned only to illustrate, string literals, SQL fragments, config tables transcribed from source, vendor internals, test class names, and version pins. Also keep out anything ephemeral by nature — model SKUs, scenario or fixture ids, dated measurements.

**If a conventions or guidelines page already documents the mechanics, cite it by path instead of restating it.** The prose there is maintained; a copy inside an ADR is not, and the copy is the one that silently falls behind.

A useful test: *if this symbol were renamed tomorrow, would the decision change?* If not, it is illustration, and the ADR is stronger without it.

## Template

```markdown
# NNNN - Title

- **Status**: proposed
- **Supersedes**: <!-- NNNN - Title, only if this ADR replaces a previous one -->
- **Superseded by**: <!-- NNNN - Title, only if this ADR is later replaced -->
- **Amends**: <!-- NNNN - Title, only if this ADR changes part of a previous one without replacing it -->
- **Amended by**: <!-- NNNN - Title, only if part of this ADR is later changed by another -->
- **Related**: <!-- NNNN - Title, only if this ADR extends or relates to another -->
- **Date**: YYYY-MM-DD

## Context and Problem Statement

[2-3 sentences describing the problem or question driving this decision.]

## Considered Options

1. [Option A]
2. [Option B]
3. [Option C]

## Decision Outcome

Chosen option: "[Option X]", because [1-2 sentence justification].

### Positive Consequences

- [benefit 1]
- [benefit 2]

### Negative Consequences

- [tradeoff 1]
- [tradeoff 2]

## Pros and Cons of the Options

### Option A

- Good, because [argument]
- Bad, because [argument]

### Option B

- Good, because [argument]
- Bad, because [argument]

### Option C

- Good, because [argument]
- Bad, because [argument]
```

## Anti-patterns

- Don't fill in sections with vague filler. If something is unknown, mark it as "TBD" or omit the section.
- Don't create ADRs for trivial choices that don't warrant documentation.
- Don't use status values other than: proposed, accepted, deprecated, superseded.
- When marking an ADR as superseded, always fill in "Superseded by" with the number and title of the replacing ADR.
- Don't leave superseded ADRs stale — always update the old ADR's status and "Superseded by" field in the same step as creating the new one.
- Don't mark an ADR as "Related" just because it touches the same area — only use it when there's a meaningful dependency or extension relationship.
