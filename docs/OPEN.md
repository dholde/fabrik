# Open

Follow-ups that cannot be done yet. Every deferred item goes here, never only
into a conversation. Remove an item in the change that resolves it.

Decide with the factory config:
- Separate Fabrik's own development tooling from what the factory uses in
  target repos: which skills, docs and conventions belong to which.
- Recording which model the factory ran for each ticket, from the run
  configuration, if model data is ever needed. Commits only name the tool:
  self-reported model names are not reliable.

Revisit:
- Cursor lists each skill twice because it reads `.agents/skills/` and
  `.claude/skills/`. Drop the `.claude/skills/` copy once Claude Code reads
  `.agents/skills/`.
