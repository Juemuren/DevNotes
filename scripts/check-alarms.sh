#!/bin/bash

set -e

RULES=(
  "\[![A-Za-z]+\][^-+]"
  "\[!(?!(Tip|Note|Warning)\])[A-Za-z]+\]"
)

for pattern in "${RULES[@]}"; do
    echo "[PATTERN]: $pattern"
    if rg -P "$pattern" docs; then
        echo "[ERROR]: $pattern"
        exit 1
    fi
done

exit 0
