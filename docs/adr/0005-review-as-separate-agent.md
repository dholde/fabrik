# 0005: Run review as a separate agent started by its status

- Status: accepted
- Date: 2026-11-27

## Context

A ticket's work needs an independent review before a human sees it. Two
designs are common. In addyosmani/factory, the implementing agent spawns a
reviewer subagent and loops with it in one session. Cognition (Devin Review)
and Warp run review as a separate agent. The sources we read agree on one
requirement: the reviewer starts with a clean context, without the writer's
reasoning. Either design meets it.

## Decision

Review is its own step. `status/agent-review` starts a separate review agent
with a fresh context. The agent writes its round into the review file and sets
the next status itself. The implementing agent never spawns or steers the
reviewer.

Rejected: a reviewer subagent inside the implementing session, or a main agent
that runs implement and review subagents in a loop. That design needs fewer
statuses and no handoff, and the implementing agent keeps its context for
fixes. But a skill would chain the steps, against ADR 0004, and the reviewer
would always run in the same tool as the writer.

## Consequences

- The factory definition holds review as its own step. A later editor for
  steps and substeps can move, add or remove it.
- Another tool or model can review the work, for example Codex reviewing code
  that Claude Code wrote.
- The writer cannot filter the reviewer's input or overrule its verdict.
- Each round starts without the earlier rounds' context, so the handoff runs
  through files. Review reads the earlier rounds, checks their open findings
  first and reviews only what changed. The Claude Code team reports this kind
  of re-review cut the mean reviews to pass from 2.08 to 1.32.
- Every step can restart from the files on the ticket branch.
