#!/bin/bash

set -e

LETTERS="[A-Za-z]+"
ALERTS="(Tip|Note|Warning)"

RULES=(
  "\[!$LETTERS\][^-+]"
  "\[!$LETTERS\][-+]$"
  "\[!(?!$ALERTS\])$LETTERS\]"
)

for pattern in "${RULES[@]}"; do
  if rg -P --crlf "$pattern" docs; then
    echo "[ERROR] $pattern"
    exit 1
  fi
done

exit 0
