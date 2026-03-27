#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dir in "$SCRIPT_DIR"/*/; do
    name="$(basename "$dir")"

    for target in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
        [ -d "$(dirname "$target")" ] || continue
        mkdir -p "$target"
        link="$target/$name"
        if [ ! -e "$link" ] && [ ! -L "$link" ]; then
            ln -s "$dir" "$link"
            echo "created $link"
        fi
    done
done
