# Ticket Hygiene Template

Use this structure whenever creating or substantially rewriting a Jira task or bug.

## Required Structure

### Notes
Optional. Add only when extra context is needed to understand the work, constraints, links, scope boundaries, or background. Skip it when the summary and acceptance criteria are enough.

### Acceptance Criteria
Required. Always include this section.
- Use concise bullet points.
- Describe only the definition of done.
- Do not describe implementation steps or technical approach.
- Make each bullet testable and unambiguous.

## Example

### Notes
Investigate whether the issue affects only imported leads or all profile edits.

### Acceptance Criteria
- Saving a profile without changing any fields does not create a duplicate update event.
- Updating a profile creates exactly one update event.
- Existing downstream consumers continue to receive the same payload shape.
