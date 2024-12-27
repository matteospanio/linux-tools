#!/usr/bin/env bash
# Path: src/update.sh
# Update all installed packages
# Usage: ./update.sh
# Description: This script will update all installed packages on the system
#   including apt, yum, pacman, flatpak, snap, pipx, and poetry
# Author: Matteo Spanio

source color_log.sh
source utils.sh

## Update all installed packages
function update() {
    if [ -f /etc/debian_version ]
    then
        log_msg "[+] Updating apt"
        sudo apt update && sudo apt upgrade -y
    fi

    if [ -f /etc/redhat-release ]
    then
        log_msg "[+] Updating dnf"
        sudo yum update -y
    fi

    if [ -f /etc/arch-release ]
    then
        log_msg "[+] Updating pacman"
        sudo pacman -Syu
    fi

    if command_exists flatpak
    then
        log_msg "[+] Updating flatpak"
        flatpak update -y
    fi

    if command_exists snap
    then
        log_msg "[+] Updating snap"
        sudo snap refresh
    fi

    if command_exists pipx
    then
        log_msg "[+] Updating pipx"
        pipx upgrade-all
    fi

    if command_exists poetry
    then
        log_msg "[+] Updating poetry"
        poetry self update
    fi
}

update