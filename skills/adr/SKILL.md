---
name: adr
description: Create architectural decision records in MADR format. Use when the user wants to document a technical decision, record an architecture choice, or create an ADR.
---

# Create an ADR

## Steps

1. **Auto-detect numbering**: Scan `docs/decisions/` for existing ADR files matching `NNNN-*.md`. Use the next sequential number. If the directory doesn't exist, start at `0001`.

2. **Gather context**: If not provided, ask:
   - What decision needs to be made?
   - What options were considered?

3. **Create the file** at `docs/decisions/NNNN-kebab-case-title.md` using the template below.

4. **Update the index**: If `docs/decisions/README.md` exists, append the new ADR to it.

## Template

```markdown
# NNNN - Title

- **Status**: proposed
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
