# Open

Follow-ups that cannot be done yet. Every deferred item goes here, never only
into a conversation. Remove an item in the change that resolves it.

Decide with the factory config:
- Running ticket creation automatically when a spec reaches `status/approved`,
  and how the breakdown gets approved then (e.g. a `status/human-review-tickets`).
- Location of tickets that have no spec (bugs, small changes).
- Moving specs and tickets to GitHub Issues: re-add the tracker path to
  `to-spec` and `to-tickets`, map statuses to `status/` labels, and add an
  `issue` frontmatter field (issue URL) to specs, tickets and plans.
- What the review agent checks (its brief). Each status change starts a new
  session, so review already runs in a fresh context.
- Testing conventions (test levels, what each covers, rough proportions): for
  Fabrik itself, and how a target repo declares its own so the factory follows
  them.
- Whether the review agent uses a different model than the implementing agent.
- Separate Fabrik's own development tooling from what the factory uses in
  target repos: which skills, docs and conventions belong to which.
- Recording which model the factory ran for each ticket, from the run
  configuration, if model data is ever needed. Commits only name the tool:
  self-reported model names are not reliable.

Revisit:
- Cursor lists each skill twice because it reads `.agents/skills/` and
  `.claude/skills/`. Drop the `.claude/skills/` copy once Claude Code reads
  `.agents/skills/`.
