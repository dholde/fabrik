# Open

Follow-ups that cannot be done yet. Every deferred item goes here, never only
into a conversation. Remove an item in the change that resolves it.

**Next:** Write the `implement`, `review` and human-review skills for the ticket
flow in `docs/conventions/specs-and-tickets.md`. Check upstream repositories for
skills to copy first (ADR 0001). The `review` skill holds the review agent's
brief: what it checks.

Decide with the factory config:
1. Running ticket creation automatically when a spec reaches `status/approved`,
   and how the breakdown gets approved then (e.g. a `status/human-review-tickets`).
2. Location of tickets that have no spec (bugs, small changes).
3. Moving specs and tickets to GitHub Issues: re-add the tracker path to
   `to-spec` and `to-tickets`, map statuses to `status/` labels, and add an
   `issue` frontmatter field (issue URL) to specs, tickets, plans and review
   files. Status on the ticket branch (ADR 0006) counts toward this if finding
   waiting tickets across branches gets in the way.
4. Testing conventions (test levels, what each covers, rough proportions): for
   Fabrik itself, and how a target repo declares its own so the factory follows
   them.
5. Whether the review agent uses a different model than the implementing agent.
6. Separate Fabrik's own development tooling from what the factory uses in
   target repos: which skills, docs and conventions belong to which.
7. Recording which model the factory ran for each ticket, from the run
   configuration, if model data is ever needed. Commits only name the tool:
   self-reported model names are not reliable.
8. Naming ticket branches so the factory finds a ticket's current status, and
   claiming a ticket so two concurrent runs cannot both work on it.
9. A PR comment such as `@fabrik` that sets the ticket status, so a human does
   not have to commit the status change.
10. An easy way for a human to change a ticket's status outside the
    human-review skill.
11. A later drag-and-drop editor for steps and substeps. The factory definition
    must hold every step and substep as its own item. Whether a step runs as its
    own session or as a subagent of its parent could become a setting of the
    step.

Before the first unattended run:
12. A merge guard for unattended sessions. Options: per-tool rules (Claude Code
    `permissions`, Codex `.codex/rules` with `forbidden`, Cursor
    `beforeShellExecution` hooks, where only `deny` works reliably), or an agent
    token without merge rights. Branch protection stays the hard boundary.
13. A separate GitHub identity (account or App) for agents, so agent and human
    comments have different authors and agent reviews can request changes.

Later improvements:
14. A self-check subagent inside `implement` before the handoff to review, to
    save review rounds.
15. Learning from review files: collect findings that humans overruled or that
    recur, and tune the `review` and `implement` skills from them (as Warp's
    `update-pr-review` does with PR comments).

Revisit:
16. Cursor lists each skill twice because it reads `.agents/skills/` and
    `.claude/skills/`. Drop the `.claude/skills/` copy once Claude Code reads
    `.agents/skills/`.
