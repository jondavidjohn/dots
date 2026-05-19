#!/bin/bash
set -euo pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

ALFRED_DIR="$HOME/Library/Application Support/Alfred"
PREFS_FILE="$ALFRED_DIR/prefs.json"

mkdir -p "$ALFRED_DIR"

if [ ! -f "$PREFS_FILE" ]; then
  echo '{}' > "$PREFS_FILE"
fi

jq --arg current "$HOME/.config/alfred/Alfred.alfredpreferences" \
   '. + {current: $current, syncfolders: {"5": "~/.config/alfred"}}' \
   "$PREFS_FILE" > "$PREFS_FILE.tmp"

mv "$PREFS_FILE.tmp" "$PREFS_FILE"
