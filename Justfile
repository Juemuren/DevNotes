[default]
default:
    just --list

lint:
    shellcheck scripts/*.sh

check:
    ./scripts/check-alerts.sh
    ./scripts/check-emphasis.sh
    ./scripts/check-links.sh
    ./scripts/check-spaces.sh

count sort="":
    ./scripts/count-words.sh {{sort}}

timeline:
    ./scripts/list-timeline.sh
