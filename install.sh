#!/bin/bash
# Install destructive command guard hook
# Usage: bash install.sh

set -e
HOOK_DIR="$HOME/.claude/hooks"
mkdir -p "$HOOK_DIR"
cp pre-tool-use "$HOOK_DIR/pre-tool-use"
chmod +x "$HOOK_DIR/pre-tool-use"
echo "Hook installed to $HOOK_DIR/pre-tool-use"
echo "Blocked commands will be logged to $HOOK_DIR/blocked.log"
