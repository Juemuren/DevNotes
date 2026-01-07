[default]
default:
    just --list

lint:
    shellcheck scripts/*.sh

check:
    ./scripts/check-alerts.sh
    ./scripts/check-spaces.sh
    ./scripts/check-links.sh

count sort="":
    ./scripts/count-words.sh {{sort}}

timeline:
    ./scripts/list-timeline.sh
