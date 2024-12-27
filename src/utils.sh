#!/usr/bin/env bash

# verify x is installed
function command_exists() {
    command -v "$1" &> /dev/null
}
