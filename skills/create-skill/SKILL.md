---
name: create-skill
description: Create a new skill
disable-model-invocation: true
---

# Create a new skill

## Overview

This skill is designed to efficiently create Claude Code skills. It provides all necessary documentation and knowledge for AI agents to create high-quality Claude Code skills.

## Steps

### 1. Learn Skill Patterns

Read the following resources before writing the skill:

- Core concepts and architecture: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview.md
- Implementation patterns: https://code.claude.com/docs/en/skills.md
- Guidelines and pitfalls: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices.md

### 2. Clarify the Goal

Ask the user:

- What specific task should Claude be able to do?
- Think about what Claude does NOT already know that this skill needs to provide. Show it as a suggestion to the user.
- Are there examples that should be included as reference material? You can search online or ask for the user input.
- Also ask if the skill should be user-invocable, and if model invocation should be disabled.

### 3. Propose Name and Description

Based on what the user described, SUGGEST:

- A skill name (the essence of what it does, extremely succinct, lowercase with hyphens)
- A description for discovery (see guidance below)

**Writing the description:**
The description is the primary trigger mechanism — Claude Code uses it to decide when to activate a skill from potentially 100+ installed skills. It must be lean and precise.

Distill the essential purpose. Don't echo the user's phrasing — capture the *gist* of what the skill is and when it should fire. Lead with what the skill does (third person), then include trigger context.

Evaluate the description through each lens:
- Gist: Does it capture what the skill IS, or is it echoing what the user said?
- Name + description as a pair: Read them together. Does the description add signal beyond the name, or just restate it?
- False positives: Could common words cause this to activate on unrelated tasks?
- False negatives: Would someone who needs this skill use words not in the description?
- Overfocus: Does mentioning a specific example make the skill seem narrower than it is?
- Human scan: If a user sees this in a list of 50 skills, can they instantly tell what it does?
- Every word earns its place: Read each word — if you remove it, does the description get worse? If not, remove it.

Present both the name and description for user approval before proceeding.

### 4. Design Structure

**Skill anatomy:**
```
skill-name/
├── SKILL.md (required)
├── scripts/      - Executable code for deterministic operations
├── references/   - Detailed docs, examples, loaded as needed
└── assets/       - Templates, images used in output
```

Decide scope:
- **Single file**: Simple guidance, under 500 lines
- **Multi-file**: Complex domain with reference materials or scripts

**Do NOT include:** README.md, CHANGELOG.md, INSTALLATION_GUIDE.md, or other auxiliary documentation.

### 5. Write SKILL.md

**Frontmatter:**
```yaml
---
name: skill-name
description: [What it does]. Use when [trigger context]. (drop the second part if it's redundant with the first)
user-invocable: [true] or [false] based on what the user said
disable-model-invocation: [true] or [false] based on what the user said
---
```

**Body:**
- Concise instructions. Assume Claude is smart, but help guide and focus it by providing good order and progressive disclosure.
- Use principles + anti-examples, not good examples to copy (avoids collapsing solution space)
- Avoid markdown tables - use lists or prose instead (tables require rendering to read easily)
- Don't do question-based formatting ("Need X? Do Y")
- Try to avoid leading language ("When you want to...", "If you need...")
- Don't add hand-holding phrasing in attempt to provide hand-holding guidance.

### 6. Add Supporting Files (if multi-file)

**References:** Detailed docs, loaded only when needed. Keep SKILL.md lean.

**Examples in references:** When including examples, add framing:
> "These illustrate the principle. Consider what fits your context."

**Scripts:** For operations that need deterministic reliability.

**One level deep means link chains, not folders.** SKILL.md should link directly to content files - avoid SKILL.md → index.md → actual-content.md chains. Organizing references into subfolders (`references/architecture/`, `references/building/`) is fine as long as SKILL.md links directly to each file.

### 7. Review Against Best Practices

Re-read https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices.md and https://code.claude.com/docs/en/skills.md (troubleshooting section). Compare to what you created:

- Does the description include clear trigger words?
- Is the body concise? Remove anything Claude already knows.
- Are references one level deep?
- Any anti-patterns present?

Suggest improvements before proceeding.

### 10. Install Skill

Create the skill inside the current folder's `.claude` folder.

Then ask user: **Global skill or project skill?**

**If project skill**, say: "Skill installed. Restart Claude to use it!"

**If global skill**, say: "Run the following command: `mv .claude/skills/[skill-name] ~.claude/skills/`, then restart Claude to use your new skill!"