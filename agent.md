# Claude Code PR Review Agent

## Usage

```bash
claude "Review PR: https://github.com/owner/repo/pull/123"
```

Or as a GitHub Action workflow.

## Output Format

Structured Markdown review with:
- Summary (2-3 sentences)
- Identified risks (list)
- Improvement suggestions (list)
- Confidence score: Low / Medium / High

## Setup

1. Place this file at `.claude/agents/pr-review.md`
2. Or reference in `.claude/settings.json`
