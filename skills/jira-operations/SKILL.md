---
name: jira-operations
description: handle jira ticket lookup, creation, status changes, comments, and field updates with the atlassian mcp. use when the user mentions a ticket, task, bug, issue, story, jira id, or backlog item, especially for svm or program. apply martin's ticket hygiene when creating or rewriting ticket descriptions and acceptance criteria.
---

# Jira Operations

Use the Atlassian MCP for all Jira operations. Do not use browser scraping or ad hoc API calls.

## Defaults

- Treat any reference to `ticket`, `task`, `bug`, `issue`, an ID like `ABC-123`, or a standalone number as a Jira ticket reference.
- Default project: `SVM`.
- If the user mentions `XING backlog`, use project `PROGRAM`.
- If the ticket number is bare like `1234`, resolve it as `SVM-1234` unless the context clearly points to `PROGRAM`.

## Core workflow

1. Fetch the current ticket state and summary with Atlassian MCP.
2. Propose the smallest useful change.
3. Apply the update through Atlassian MCP.
4. Confirm the resulting status or stored content after the change.

## Ticket hygiene for created or rewritten tasks and bugs

Use the structure in `references/ticket-template.md`.

### Notes

- Add `### Notes` only when extra context is genuinely needed.
- Omit the section entirely when the summary and acceptance criteria are enough.
- Keep it short and factual.

### Acceptance Criteria

- Always include `### Acceptance Criteria` for every created task or bug.
- Use concise bullet points.
- Describe the definition of done, not the implementation plan.
- Avoid words like `investigate`, `implement`, `refactor`, `use`, or other step-oriented phrasing inside the criteria.
- Prefer observable outcomes such as user-visible behavior, state changes, validation, or measurable completion.

## Creation and rewrite pattern

When creating or cleaning up a task or bug description, format it like this:

### Notes
Optional context paragraph or bullets.

### Acceptance Criteria
- Criterion 1
- Criterion 2
- Criterion 3

If there is no useful context, return only:

### Acceptance Criteria
- Criterion 1
- Criterion 2

## Quality bar for acceptance criteria

Strong criteria:
- are testable
- are concise
- avoid implementation details
- define completion clearly

Weak criteria:
- describe how to code the change
- mention tools, files, or components unless that is itself part of the done state
- bundle multiple outcomes into one vague bullet

## Status and comment updates

When transitioning a ticket or adding a comment:
- keep comments compact
- summarize decision, blocker, or result
- avoid repeating the whole ticket unless the user asks

## Failure handling

If Atlassian MCP returns `unauthorized` or another auth failure:
1. Retry the same operation once.
2. If it fails again, stop and report which action failed so the user can fix Atlassian MCP auth or config.
