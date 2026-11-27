# 0004: Split spec and ticket creation

- Status: accepted
- Date: 2026-11-26

## Context

Turning an idea into tickets involves an interview, writing a spec, and slicing
it into tickets. These could run as one combined step.

## Decision

The interview and the spec happen in one session (`grilling`, then
`/to-spec`). Tickets are created separately with `/to-tickets`, in a fresh
session, only after the spec reaches `status/approved`.

## Consequences

- The human gate (spec review) sits between spec and tickets.
- Slicing starts from the approved spec with clean context.
- Tickets can also be created without a spec (bugs, small changes).
- The factory definition, not the skills, chains the steps.
