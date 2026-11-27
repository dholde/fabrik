# 0001: Copy skills verbatim, then adapt

- Status: accepted
- Date: 2026-11-26

## Context

Fabrik reuses third-party agent skills. They must work in Claude Code, Codex
and Cursor, can carry security risks, and usually need changes to fit Fabrik.

## Decision

Each skill is security-checked, copied unchanged into `.claude/skills/<name>/`
and `.agents/skills/<name>/`, and committed on its own. A `source.md` records
the source repository, the skill folder pinned to a commit SHA, and a
changelog. Adaptations follow in separate commits, each logged in the
changelog.

## Consequences

- Every change to a third-party skill is visible as a diff against the original.
- Both copies must be kept identical.
- Updating from the source means repeating the process against the new version.
