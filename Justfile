[default]
default:
    just --list

lint:
    shellcheck scripts/*.sh

check:
    ./scripts/check-alerts.sh
    ./scripts/check-spaces.sh

count:
    ./scripts/count-words.sh

timeline:
    ./scripts/list-timeline.sh
