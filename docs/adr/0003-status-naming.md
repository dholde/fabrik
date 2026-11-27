# 0003: Name statuses `status/<actor>-<action>`

- Status: accepted
- Date: 2026-11-26

## Context

A single `ready-for-agent` hides who acts next and what they do. Statuses
should also carry over unchanged to GitHub labels later.

## Decision

Statuses use the `status/` prefix with hyphens, naming actor and action:
`status/human-review-spec`, `status/agent-implement`, etc. The full list is in
`docs/conventions/specs-and-tickets.md`.

Rejected: `agent:implement` (no family prefix, so it mixes with future `kind/`
or `area/` labels) and `status/human:review-spec` (colons need quoting in
GitHub search and are invalid in git branch names).

## Consequences

- Lifecycle labels sort together and are clearly one-at-a-time.
- On GitHub, `status/done` and `status/cancelled` become close reasons and
  `status/human-review-pr` is shown by the linked PR; the rest become labels.
