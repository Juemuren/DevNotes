[default]
default:
    just --list

lint-sh:
    shellcheck scripts/*.sh

check-docs:
    ./scripts/check-alarms.sh