# Claude PR Review Agent

A Claude Code sub-agent that reviews GitHub PRs and posts structured Markdown review comments.

## Quick Start

### Option A: CLI

```bash
./claude-review.sh https://github.com/owner/repo/pull/123
```

Requires: `gh` CLI or `curl`, Claude Code with `claude` CLI.

### Option B: GitHub Action

Copy `pr-review.yml` to `.github/workflows/pr-review.yml` in your repo.
Copy `review-agent.md` to `.github/claude-agents/pr-review.md`.

The action triggers on PR open/sync/reopen and posts a structured review comment.

## Agent Setup

Place `review-agent.md` in your Claude Code agents directory:

```
.claude/agents/pr-review.md    # Agent definition
```

Or configure in `.claude/settings.json`:

```json
{
  "agents": {
    "pr-review": {
      "path": ".claude/agents/pr-review.md"
    }
  }
}
```

## Output Format

Every review includes:

- **Summary** — 2-3 sentence overview
- **Changes Overview** — File-by-file summary
- **Identified Risks** — Categorized High/Medium/Low with file:line references
- **Improvement Suggestions** — Actionable, with reasoning
- **Test Coverage Assessment**
- **Confidence Score** — Low / Medium / High with justification

## Tested PRs

### Test 1: [Describe PR]
[Include sample output]
