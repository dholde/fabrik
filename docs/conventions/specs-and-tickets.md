# Specs, tickets and plans

## Locations

- **Specs:** `docs/specs/<feature-slug>/spec.md`
- **Tickets:** `docs/specs/<feature-slug>/tickets/<NN>-<ticket-slug>.md`, one
  file per ticket, numbered from `01` in dependency order (blockers first).
- **Plans:** `docs/specs/<feature-slug>/plans/<NN>-<ticket-slug>.md`, same
  number and slug as the ticket. The implementing agent writes the plan (files,
  steps, tests) before writing code.

## Frontmatter

Specs, tickets and plans start with YAML frontmatter. Links are relative paths.

- **Spec:** `status`.
- **Ticket:** `status`, `blocked_by` (ticket numbers that gate it, empty list if
  none), `spec` (link to the spec), `plan` (link to the plan, empty until written).
- **Plan:** `ticket` (link back to the ticket).

A ticket is blocked while any ticket in `blocked_by` is not `status/done`.

## Statuses

Every spec and ticket has exactly one `status`, set to one of the values below.

New specs start at `status/human-review-spec`. New tickets start at
`status/agent-implement`: ticket creation is manual, and the human approves the
breakdown inside `to-tickets` before any file is written.

Spec:
- `status/human-review-spec`: Spec written; a human reviews it.
- `status/approved`: Spec accepted; tickets may be cut from it.

Ticket:
- `status/agent-implement`: An agent implements it (also where review sends it back).
- `status/agent-review`: A second agent reviews; passes it on or returns it to `status/agent-implement` with notes.
- `status/human-review-pr`: A human reviews the PR and decides on merge.
- `status/done`: Merged.

Spec or ticket:
- `status/human-answer`: The agent is stuck; its question is in the file, waiting for a human.
- `status/cancelled`: Dropped; no one works on it.

## Escalation

Agents adjust a ticket's plan only within its scope (same acceptance criteria,
fits one session, no new dependency on an unbuilt ticket) and note the change in
the plan. Beyond that scope, they write their findings into the ticket and set
`status/human-answer`; they never re-plan, split tickets or change the spec on
their own. After two review rounds without a pass, a ticket goes to
`status/human-answer`.

## Writing files

Creating a spec or ticket means writing the file. Committing, pushing and PRs
belong to the workflow.
