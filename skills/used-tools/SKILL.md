---
name: used-tools
description: List all MCP tools and Claude skills that were used in the last user prompt
disable-model-invocation: true
---

# Used tools

List all MCP tools and Claude skills that were used in the last user prompt.

Present them in a clear, organized format:

## MCP Tools

- List each MCP tool that was called (e.g., mcp__laravel-boost__database-schema, mcp__codex__codex)
- Include the parameters used if relevant
- Separately here, list MCP servers that exist in this project but were NOT used

## Skills

- List any skills that were invoked using the Skill tool
- Separately here, list skills that exist in this project but were NOT used

If no tools, agents, or skills were used in the last prompt, state that clearly.