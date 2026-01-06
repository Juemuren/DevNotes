#!/bin/sh

git log --format="%cs" --name-only |
awk '
  /^[0-9]{4}-[0-9]{2}-[0-9]{2}/ {date=$1; next}
  NF && !seen[$0]++ {print date, $0}
'
