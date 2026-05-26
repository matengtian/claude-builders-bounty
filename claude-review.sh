#!/bin/bash
# claude-review — CLI wrapper for Claude Code PR review agent
# Usage: ./claude-review.sh https://github.com/owner/repo/pull/123

set -e

PR_URL="${1:?Usage: $0 <pull-request-url>}"
REPO=$(echo "$PR_URL" | sed -E 's|https://github.com/||;s|/pull/.*||')
PR_NUM=$(echo "$PR_URL" | grep -oP '/pull/\K\d+')

echo "Reviewing $REPO PR #$PR_NUM..."

TMPDIR=$(mktemp -d)
DIFF_FILE="$TMPDIR/pr.diff"
REPORT_FILE="$TMPDIR/review.md"

# Fetch PR diff
gh pr diff "$PR_NUM" --repo "$REPO" > "$DIFF_FILE" 2>/dev/null || \
curl -sH "Accept: application/vnd.github.v3.diff" \
  "https://api.github.com/repos/$REPO/pulls/$PR_NUM" > "$DIFF_FILE"

# Run Claude Code review
cat "$DIFF_FILE" | claude --agent review-agent --output "$REPORT_FILE"

cat "$REPORT_FILE"
rm -rf "$TMPDIR"
