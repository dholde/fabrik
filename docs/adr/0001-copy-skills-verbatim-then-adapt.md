# 0001: Copy skills verbatim, then adapt

- Status: accepted
- Date: 2026-11-26

## Context

Fabrik reuses third-party agent skills. They must work in Claude Code, Codex
and Cursor, can carry security risks, and usually need changes to fit Fabrik.

## Decision

Each skill is security-checked, copied unchanged into `.agents/skills/<name>/`,
and committed on its own. That folder is the only place skills are edited.
Claude Code reads only `.claude/skills/`, so it gets a committed copy of each
skill, made on the maintainer's machine. It is a copy, not a symlink, because
Fabrik will be open source and symlinks break on Windows without extra setup.
A `source.md` records
the source repository, the skill folder pinned to a commit SHA, and a
changelog. Adaptations follow in separate commits, each logged in the
changelog.

## Consequences

- Every change to a third-party skill can be compared with the original: in
  the pull request through the separate verbatim commit, and afterwards through
  the source version pinned in `source.md`. `main` only takes squash merges.
- `.claude/skills/` must be re-copied after every change to a skill.
- Everyone who pulls gets the same files on every OS; nothing runs after a pull.
- Cursor reads both folders and lists each skill twice.
- Updating from the source means repeating the process against the new version.
