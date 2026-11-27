# AGENTS.md

Guidance for AI coding agents working in this repository. This file holds only
always-on rules and a map. Read the file the map names before working in that
area.

## What Fabrik is

Fabrik is a **software factory**: it automates the software development lifecycle
while keeping humans in control through explicit **human gates**. The factory is
defined **declaratively**: You describe *what* the factory is (its stages,
agents, and gates), and Fabrik runs it.

## Core principles

- **Automate the lifecycle.** Planning, implementation, review, testing and
  release should be steps the factory can run without manual glue.
- **Humans hold the gates.** Any step that is hard to reverse or outward-facing
  (merging, releasing, deploying, publishing) passes through a human gate.
  Never design or implement a path that bypasses a gate.
- **Declarative over imperative.** Prefer describing the factory in definitions
  over encoding behaviour in ad-hoc scripts. If behaviour can be expressed in
  the declarative definition, put it there.

## Project status

No stack, build system or test suite yet. When you introduce one, add the
commands to build, test and lint here.

Before committing, run `bash scripts/check-all.sh`. CI runs the same checks on
every pull request.

## Always-on rules

- **One fact, one place.** Each fact lives in the file the map names for it.
  Other files link there instead of copying values. Never state in one file
  what another file contains. Exception: ADRs record the state at the time of
  the decision.
- **Change a decision everywhere.** Before changing a convention, search the
  repo for its key terms and update or remove every statement that depends on
  it, in the same change. What cannot be done now goes into `docs/OPEN.md`.
- **Manage skills with `manage-skills`.** When adding or updating skills,
  always use the `manage-skills` skill.
- **Write without AI slop.** Whenever you write (chat replies, docs, specs,
  tickets, ADRs, commit messages, PR descriptions), follow the `no-ai-slop` skill.
- Keep changes small and focused; one concern per change.
- Do not commit secrets (`.env`, keys, `.claude/settings.local.json`).
- When you add a doc or change how the project is structured, update the map
  below and `README.md`.

## Map

| Topic | File | Read when |
|---|---|---|
| Domain terms | `docs/GLOSSARY.md` | writing docs or code |
| Decisions (ADRs) | `docs/adr/README.md` | writing an ADR or questioning a convention |
| Open decisions and follow-ups | `docs/OPEN.md` | deferring something, or picking up open work |
