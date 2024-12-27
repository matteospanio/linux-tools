#!/usr/bin/env bash

source color_log.sh
source utils.sh

# test if this is a debian based system
if [ -f /etc/debian_version ]
then
    log_msg "[+] Updating apt"
    sudo apt update && sudo apt upgrade -y
fi


# test if flatpak is installed
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
