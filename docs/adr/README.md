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
