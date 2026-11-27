# 0007: Keep review findings in a review file

- Status: accepted
- Date: 2026-11-27

## Context

Each review round starts a new session (ADR 0005), so the next session must
find the earlier findings, and rounds must be countable. GitHub PR reviews are
the obvious place, but agents push and comment with the human's account:
GitHub rejects "request changes" on your own PR, and agent and human comments
have the same author. Warp also reports that agent review comments on the PR
are noise for the human reviewer. addyosmani/factory keeps the findings of
rejected rounds only in session memory, so they are lost after the session.

## Decision

Every review round, agent or human, is written into one review file per ticket,
committed on the ticket branch. PR comments only announce a handoff and link to
the review file. Human review runs through a dedicated skill that writes the
human round into the same file.

Rejected: findings as PR review comments, and findings kept only in session
memory.

## Consequences

- After the merge, the repo holds every finding of the ticket and what happened
  to it. This is the evidence for tuning the review and implement skills later.
- The record does not depend on who wrote a comment, so no separate agent
  identity is needed for now.
- Comments a human leaves directly on GitHub must be copied into the review
  file by the next session that reads it.
- The human sees the review file in the PR diff and the handoff comment on the
  PR, but no line-by-line agent comments.
