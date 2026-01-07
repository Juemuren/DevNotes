#!/bin/bash

MARKS="(strong|em|code|del)"
TAGS="<$MARKS>.*</$MARKS>"
CHARS="[^\s\p{P}\p{S}]"
PATTERN="$CHARS$TAGS|$TAGS$CHARS"

fd -e md --search-path docs -x sh -c "
  if pandoc '{}' -t html --mathjax | rg --color=always '$PATTERN'; then
    echo '[ERROR] {}'
  fi
"
