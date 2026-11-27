# 0006: Commit ticket status on the ticket branch

- Status: accepted
- Date: 2026-11-27

## Context

ADR 0002 keeps status in the ticket file. Each ticket now has its own branch
and draft PR, so every status change is a commit, and that commit has to land
somewhere. `main` only takes squash merges, and merging is a human gate.

## Decision

Status changes are committed on the ticket branch, together with the code. The
squash merge brings the final status to `main`.

Rejected: committing status to `main` while the code stays on the branch. Agents
would push to `main` and pass the merge gate. Also rejected: moving status to
GitHub Issues now. That reverses ADR 0002 before the ticket flow has run once.

## Consequences

- Agents never push to `main`.
- While a ticket is in the flow, `main` shows its old status. The factory reads
  the current status from the ticket branch.
- Finding the tickets that wait for a human means reading branches, not only
  `main`. Draft and ready PRs on GitHub show part of it. If this gets in the
  way, it counts toward moving status to GitHub Issues (see `docs/OPEN.md`).
