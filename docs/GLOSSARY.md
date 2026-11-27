# Glossary

Domain terms for Fabrik. Use them in specs, tickets and code. Locations and conventions:
see the map in [AGENTS.md](../AGENTS.md).

- **Software factory**: A system that automates the development lifecycle, with human gates at key points.
- **Human gate**: A step that waits for a human decision before work continues (e.g. spec review, PR review).
- **Spec**: A description of a feature (problem, solution, user stories, decisions).
- **Ticket**: One tracer-bullet slice of work, small enough for a single agent session.
- **Plan**: How an agent will implement one ticket (files, steps, tests), written before coding.
- **Status**: The one `status/…` value on a spec or ticket that says who acts next and what they do.
- **Blocked by** (`blocked_by`): The tickets that must be `status/done` before a ticket can start.
- **Skill**: A reusable instruction set for agents.
- **ADR**: An Architecture Decision Record, which captures one significant decision and its reasons.
