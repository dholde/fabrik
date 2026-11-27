# Architecture Decision Records

One file per decision: `<NNNN>-<slug>.md`, numbered from `0001`.

- Write one only for decisions that are hard to reverse, cross-cutting, or
  likely to be questioned later. Feature-level decisions belong in the spec.
- An ADR records the decision and its reasons. Exact conventions (paths,
  formats, names) live only in the files the `AGENTS.md` map names.
- An ADR may be edited until it is merged into `main`. After that, never
  rewrite it: only its status may change, to point at the ADR that supersedes
  it.
- Add every ADR to the index below.

| ADR | Title | Status |
|-----|-------|--------|
| [0001](0001-copy-skills-verbatim-then-adapt.md) | Copy skills verbatim, then adapt | accepted |
| [0002](0002-store-status-in-repo-files.md) | Store spec and ticket status in repo files | accepted |
| [0003](0003-status-naming.md) | Name statuses `status/<actor>-<action>` | accepted |
| [0004](0004-split-spec-and-ticket-creation.md) | Split spec and ticket creation | accepted |
