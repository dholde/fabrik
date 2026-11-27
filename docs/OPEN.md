# Open

Follow-ups that cannot be done yet. Every deferred item goes here, never only
into a conversation. Remove an item in the change that resolves it.

**Next:** Design the factory workflow and config. The items under "Decide with
the factory config" are its agenda.

Decide with the factory config:
1. Running ticket creation automatically when a spec reaches `status/approved`,
   and how the breakdown gets approved then (e.g. a `status/human-review-tickets`).
2. Location of tickets that have no spec (bugs, small changes).
3. Moving specs and tickets to GitHub Issues: re-add the tracker path to
   `to-spec` and `to-tickets`, map statuses to `status/` labels, and add an
   `issue` frontmatter field (issue URL) to specs, tickets and plans.
4. What the review agent checks (its brief). Each status change starts a new
   session, so review already runs in a fresh context.
5. Testing conventions (test levels, what each covers, rough proportions): for
   Fabrik itself, and how a target repo declares its own so the factory follows
   them.
6. Whether the review agent uses a different model than the implementing agent.
7. Separate Fabrik's own development tooling from what the factory uses in
   target repos: which skills, docs and conventions belong to which.
8. Recording which model the factory ran for each ticket, from the run
   configuration, if model data is ever needed. Commits only name the tool:
   self-reported model names are not reliable.

Revisit:
9. Cursor lists each skill twice because it reads `.agents/skills/` and
   `.claude/skills/`. Drop the `.claude/skills/` copy once Claude Code reads
   `.agents/skills/`.
