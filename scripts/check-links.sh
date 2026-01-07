#!/bin/bash

LINKS="\[[^]]+\]\([^)]+\)"
CHARS="[^\s\p{P}\p{S}]"
PATTERN="$CHARS$LINKS|$LINKS$CHARS"

rg "$PATTERN" docs

# auto-correct
fd -e md --search-path docs \
  -x sd "($CHARS)($LINKS)" "\$1 \$2" "{}" \;\
  -x sd "($LINKS)($CHARS)" "\$1 \$2" "{}"
