#!/usr/bin/env bash
# Runs every repo check, the same ones CI runs. Run: bash scripts/check-all.sh
set -uo pipefail
cd "$(git rev-parse --show-toplevel)"
fail=0
bash scripts/check-skills.sh || fail=1
bash scripts/check-adrs.sh || fail=1
exit "$fail"
