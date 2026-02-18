#!/bin/bash
# UserPromptSubmit hook: suggest optimization if 8+ tool calls in the session.
# Skips exploratory prompts.

input=$(cat)
transcript_path=$(echo "$input" | jq -r '.transcript_path // empty')

# Count tool_use entries in transcript JSONL
tool_count=0
if [ -n "$transcript_path" ] && [ -f "$transcript_path" ]; then
  tool_count=$(jq -s '[.[] | select(.role == "assistant") | .content // [] | .[] | select(.type == "tool_use")] | length' "$transcript_path")
fi

# Skip if under threshold
if [ "$tool_count" -lt 8 ]; then
  exit 0
fi

# Detect exploratory prompts - skip hints for these
user_prompt=$(echo "$input" | jq -r '.prompt // empty')
if echo "$user_prompt" | grep -qiE '^\s*(what|how|why|where|which|explain|show me|tell me|find|search|look|explore|investigate|understand|check|review|read)\b'; then
  exit 0
fi

# Pick a random hint
hints=(
  "If a multi-step pattern repeats, extract it into a reusable skill (skills/<name>/SKILL.md) so future runs need one command instead of many."
  "If you solved a non-obvious problem, save the key insight to memory (MEMORY.md or a topic file) so you skip the rediscovery next time."
  "If independent tool calls ran sequentially, batch them in parallel to cut round-trips in half."
  "If you re-read the same files across tasks, note the key paths/patterns in memory so future sessions start with context."
  "If a workflow required manual confirmation at every step, consider whether CLAUDE.md allowlists or hook scripts could streamline it."
)

index=$((RANDOM % ${#hints[@]}))
echo "${hints[$index]}"
