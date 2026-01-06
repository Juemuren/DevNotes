#!/bin/bash

set -e

MARKS="(strong|em|code|del)"
TAGS="<$MARKS>.*?</$MARKS>"
CHARS="[^\s\p{P}\p{S}]"
PATTERN="$CHARS$TAGS|$TAGS$CHARS"

FILES=(
  $(fd -e md --search-path docs)
)

for file in "${FILES[@]}"; do
  if pandoc "$file" -t html --mathjax | rg "$PATTERN"; then
    echo "[ERROR] $file"
    exit 1
  fi
done

exit 0
