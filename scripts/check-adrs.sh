#!/usr/bin/env bash
# ADR checks. Run all: bash scripts/check-adrs.sh
# Run one:            bash scripts/check-adrs.sh <check>
set -uo pipefail
cd "$(git rev-parse --show-toplevel)/docs/adr"

adrs() { ls [0-9][0-9][0-9][0-9]-*.md 2>/dev/null; }

# Numbers start at 0001 and have no gaps or duplicates.
check_numbering() {
  local fail=0 expected=1 f num
  for f in $(adrs); do
    num=${f%%-*}
    if [ "$((10#$num))" -ne "$expected" ]; then
      echo "FAIL: $f: expected number $(printf '%04d' "$expected")"; fail=1
    fi
    expected=$((10#$num + 1))
  done
  return "$fail"
}

# Each ADR has '# NNNN: <title>', '- Status:', '- Date:' and the three sections.
check_format() {
  local fail=0 f num s
  for f in $(adrs); do
    num=${f%%-*}
    [[ "$(head -n 1 "$f")" == "# $num: "* ]] || { echo "FAIL: $f: first line must be '# $num: <title>'"; fail=1; }
    grep -q '^- Status: ' "$f" || { echo "FAIL: $f: missing '- Status:' line"; fail=1; }
    grep -q '^- Date: ' "$f" || { echo "FAIL: $f: missing '- Date:' line"; fail=1; }
    for s in Context Decision Consequences; do
      grep -q "^## $s\$" "$f" || { echo "FAIL: $f: missing '## $s' section"; fail=1; }
    done
  done
  return "$fail"
}

# The index lists every ADR with the same title and status, and only existing files.
check_index() {
  local fail=0 f num row title status idx_title idx_status name
  for f in $(adrs); do
    num=${f%%-*}
    row=$(grep -F "]($f)" README.md)
    if [ -z "$row" ]; then echo "FAIL: $f is missing from docs/adr/README.md"; fail=1; continue; fi
    title=$(head -n 1 "$f"); title=${title#"# $num: "}
    status=$(grep -m1 '^- Status: ' "$f" | sed 's/^- Status: //')
    idx_title=$(echo "$row" | awk -F'|' '{gsub(/^ +| +$/, "", $3); print $3}')
    idx_status=$(echo "$row" | awk -F'|' '{gsub(/^ +| +$/, "", $4); print $4}')
    [ "$idx_title" = "$title" ] || { echo "FAIL: $f: index title '$idx_title' differs from '$title'"; fail=1; }
    [ "$idx_status" = "$status" ] || { echo "FAIL: $f: index status '$idx_status' differs from '$status'"; fail=1; }
  done
  for name in $(grep -oE '\]\([0-9]{4}-[^)]+\.md\)' README.md | sed 's/^](//; s/)$//'); do
    [ -f "$name" ] || { echo "FAIL: docs/adr/README.md lists $name, which does not exist"; fail=1; }
  done
  return "$fail"
}

CHECKS=(numbering format index)

run() {
  local fail=0 c
  for c in "$@"; do
    if ! declare -F "check_$c" >/dev/null; then echo "Unknown check: $c (known: ${CHECKS[*]})"; fail=1; continue; fi
    "check_$c" || fail=1
  done
  return "$fail"
}
if [ $# -gt 0 ]; then run "$@"; else run "${CHECKS[@]}" && echo "ADR checks passed."; fi
