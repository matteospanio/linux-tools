#!/usr/bin/env bash

RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
END="\033[0m"
BOLD="\033[1m"

## Print colored log messages
## Usage: color_log color message
## @param color: color to use
## @param message: message to print
function color_log() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${END}"
}

## Print bold message
## Usage: bold message
## @param message: message to print
function bold() {
    local message=$1
    echo -e "${BOLD}${message}${END}"
}

## Print colored log messages
## Usage: log_msg message
## @param message: message to print
function log_msg() {
    local message=$1
    color_log "$BLUE" "$message"
}

## Print colored log messages
## Usage: log_ok message
## @param message: message to print
function log_ok() {
    local message=$1
    color_log "$GREEN" "$message"
}

## Print colored log messages
## Usage: log_err message
## @param message: message to print
function log_err() {
    local message=$1
    color_log "$RED" "$message"
}
