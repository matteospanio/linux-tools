#!/usr/bin/env bash

RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
END="\033[0m"
BOLD="\033[1m"

function color_log() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${END}"
}

function bold() {
    local message=$1
    echo -e "${BOLD}${message}${END}"
}

function log_msg() {
    local message=$1
    color_log "$BLUE" "$message"
}

function log_ok() {
    local message=$1
    color_log "$GREEN" "$message"
}

function log_err() {
    local message=$1
    color_log "$RED" "$message"
}
