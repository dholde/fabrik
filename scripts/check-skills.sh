#!/usr/bin/env bash
# Skill checks. Run all: bash scripts/check-skills.sh
# Run one:              bash scripts/check-skills.sh <check>
set -uo pipefail
cd "$(git rev-parse --show-toplevel)"

# .claude/skills/ must be an exact copy of .agents/skills/ (see the manage-skills skill).
check_copy() {
  diff -r .agents/skills .claude/skills && return 0
  echo "FAIL: .claude/skills/ differs from .agents/skills/. Refresh the copy (see the manage-skills skill)."
  return 1
}

CHECKS=(copy)

run() {
  local fail=0 c
  for c in "$@"; do
    if ! declare -F "check_$c" >/dev/null; then echo "Unknown check: $c (known: ${CHECKS[*]})"; fail=1; continue; fi
    "check_$c" || fail=1
  done
  return "$fail"
}
if [ $# -gt 0 ]; then run "$@"; else run "${CHECKS[@]}" && echo "Skill checks passed."; fi
