# Agent Prompt Template

Every agent prompt follows this structure:

```
ROLE: [one-line role]
CONTEXT: [project stack, task, constraints]
TASK: [specific deliverable]
RULES: [execution constraints from CLAUDE.md]
```

Keep prompts short. Each agent gets its own context window — it doesn't inherit conversation history.