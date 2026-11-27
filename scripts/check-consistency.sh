#!/usr/bin/env bash
# Repo consistency checks. Runs in CI and locally: bash scripts/check-consistency.sh
set -uo pipefail
cd "$(git rev-parse --show-toplevel)"
fail=0

# 1. .claude/skills/ must be an exact copy of .agents/skills/ (see manage-skills).
if ! diff -r .agents/skills .claude/skills; then
  echo "FAIL: .claude/skills/ differs from .agents/skills/. Refresh the copy (see the manage-skills skill)."
  fail=1
fi

# 2. The ADR index must list every ADR file, and every listed ADR must exist.
for f in docs/adr/[0-9][0-9][0-9][0-9]-*.md; do
  name=$(basename "$f")
  grep -q "($name)" docs/adr/README.md || { echo "FAIL: $name is missing from docs/adr/README.md"; fail=1; }
done
for name in $(grep -oE '\([0-9]{4}-[^)]+\.md\)' docs/adr/README.md | tr -d '()'); do
  [ -f "docs/adr/$name" ] || { echo "FAIL: docs/adr/README.md lists $name, which does not exist"; fail=1; }
done

# 3. Adapted skills must use Fabrik's statuses, not the upstream ready-for-agent label.
if grep -rn 'ready-for-agent' .agents/skills --include=SKILL.md; then
  echo "FAIL: ready-for-agent found in a skill. Use the statuses from the specs and tickets conventions."
  fail=1
fi

[ "$fail" -eq 0 ] && echo "All consistency checks passed."
exit "$fail"
