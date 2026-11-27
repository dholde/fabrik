# 0002: Store spec and ticket status in repo files

- Status: accepted
- Date: 2026-11-26

## Context

Fabrik defines the factory declaratively and keeps humans in control. Specs and
tickets need a status that says who acts next. That state could live in an
external tracker (GitHub Issues, Linear) or in the repository.

## Decision

Specs and tickets are Markdown files in the repository. Each file stores its
status, its dependencies on other tickets and its links to related files in
YAML frontmatter, because they are structured data that the factory reads and changes, not prose. GitHub Issues may be adopted later.

## Consequences

- State is versioned and reviewed in PRs together with the factory definition.
- No external service is needed to start.
- Tools and checks read this data with a YAML parser instead of matching text.
- Moving to GitHub Issues later requires mapping statuses to labels and close
  reasons.
