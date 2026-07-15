---
name: gh-cli-workflows
description: standard github workflows using the gh cli. use when working with pull requests, issues, branches, reviews, or repository metadata from a local checkout where gh auth is already configured. prefer gh commands over raw github api calls, curl, or web scraping.
---

# GitHub CLI Workflows

## Overview

Use the GitHub CLI for all GitHub operations. Assume authentication is handled through local `gh` login.

## Hard rules

- Use `gh` for GitHub operations.
- Do not use raw `curl` calls to the GitHub API.
- Do not use web scraping for GitHub operations.
- Prefer concise commands and inspect local repo context before asking questions.

## Default workflow

1. Inspect the current repository context.
2. Use `gh` commands for the requested operation.
3. Prefer minimal changes and clear confirmation.
4. Report what changed and any next relevant command.

## Common patterns

### Repository context

```bash
git remote -v
git branch --show-current
gh repo view
```

### Pull requests

```bash
gh pr status
gh pr view <number>
gh pr create --fill
gh pr checkout <number>
gh pr merge <number>
```

### Issues

```bash
gh issue view <number>
gh issue list
gh issue comment <number> --body "..."
```

### Reviews

```bash
gh pr review <number> --approve
gh pr review <number> --comment --body "..."
gh pr review <number> --request-changes --body "..."
```

## Response pattern

- State the repo or PR/issue context used.
- State the exact `gh` action taken or recommended.
- Keep output focused on what changed, what is blocked, and what command matters next.
