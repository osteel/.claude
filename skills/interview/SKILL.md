---
name: interview
description: Interviews the user to refine ideas into a clear product or technical spec. Use when the user wants to brainstorm, scope, or plan a feature or app.
disable-model-invocation: true
---

# Interview

`$ARGUMENTS`

## Phase 1: Context gathering

Before asking questions, explore relevant parts of the codebase to understand:
- Related existing features, models, and patterns
- Relevant domain concepts from docs/

## Phase 2: Determine mode

Ask the user:

**What kind of spec are we building?**
- **Product** - What should this do? Who is it for? Features, UX, scope.
- **Technical** - How should this be built? Architecture, patterns, tradeoffs.

## Phase 3: Interview

Use `AskUserQuestion` to ask 1-2 questions at a time. Start from first principles. Challenge assumptions and probe for hidden complexity.

### Product mode questions
- **Clarifying**: "Who specifically is this for?" / "What's the trigger for using this?"
- **Challenging**: "Why wouldn't they just use X?" / "What if this feature didn't exist?"
- **Scope-probing**: "Is that essential or nice-to-have?" / "What's the smallest useful version?"
- **Grounding**: "Walk me through a real use case" / "What does success look like?"

### Technical mode questions
- **Clarifying**: "What are the inputs/outputs?" / "What's the expected scale?"
- **Challenging**: "Why not use X pattern instead?" / "What breaks if Y fails?"
- **Tradeoff-probing**: "Optimize for speed, simplicity, or flexibility?" / "What can we defer?"
- **Constraint-finding**: "What must this integrate with?" / "What's off-limits?"

### Also cover (as relevant)
- Happy path and variations
- Edge cases and error handling
- Integration with existing features
- Data model implications
- UI/UX flow and states
- Constraints and non-negotiables

### Convergence

Stop interviewing when:
- Answers become consistent and confident
- You can predict their answers to follow-up questions
- The core idea is clear and scope is bounded

## Phase 4: Write the spec

### Product spec
- **Problem statement** (1-2 sentences)
- **Target user**
- **Core features** (what it does)
- **Anti-features** (what was explicitly ruled out)
- **Open questions** (if any)

### Technical spec
- **Goal** (what we're building)
- **Constraints** (integrations, scale, must-haves)
- **Approach** (architecture, key patterns)
- **Non-goals** (explicitly ruled out approaches)
- **TODOs** (specific tasks)
- **Open questions** (if any)

## Tone

Curious but efficient. Challenge weak assumptions directly. Don't ask obvious questions.
