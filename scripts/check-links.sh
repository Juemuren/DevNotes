#!/bin/bash

LINKS="\[[^]]+\]\([^)]+\)"
CHARS="[^\s\p{P}\p{S}]"
PATTERN="$CHARS$LINKS|$LINKS$CHARS"

mapfile -t FILES < <(rg "$PATTERN" --files-with-matches)

# auto-correct
sd "($CHARS)($LINKS)" "\$1 \$2" "${FILES[@]}"
sd "($LINKS)($CHARS)" "\$1 \$2" "${FILES[@]}"
