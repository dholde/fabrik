# Source

- Repository: https://github.com/mattpocock/skills
- Skill folder: https://github.com/mattpocock/skills/tree/6f7f7831a625f040a8e06a0e7954826b87ce775a/skills/engineering/to-tickets

## Changelog

- Write one file per ticket to the location in `AGENTS.md` instead of publishing to a tracker; never commit, push or open a PR.
- Move `status` and `blocked_by` into YAML frontmatter and add `spec` and `plan` links, as defined in `AGENTS.md`; use the starting status from there instead of `ready-for-agent`.
- Remove the GitHub/tracker path and the issue template; read only spec paths as input.
- Point to `AGENTS.md` for locations instead of `/setup-matt-pocock-skills`.
- Forbid modifying the spec instead of a parent issue.
- Refer to the specs and tickets conventions through the `AGENTS.md` map, after those conventions moved out of `AGENTS.md`.
