#!/usr/bin/env bash

source color_log.sh
source utils.sh

function test_exit_code() {
    if [ $? -eq 0 ]
    then
        log_ok "[+] OK"
    else
        log_err "[-] Error"
    fi
}

if command_exists apt
then
    log_msg "[+] Cleaning apt unused packages"
    sudo apt autoremove -y

    test_exit_code
fi

# verify flatpak is installed
if command_exists flatpak
then
    log_msg "[+] Cleaning flatpak environments"
    flatpak uninstall --unused -y

    test_exit_code
fi

# verify conda is installed
if command_exists conda
then
    log_msg "[+] Cleaning conda cache"
    conda clean -a -y

    test_exit_code
fi

# verify pip is installed

if command_exists pip
then
    log_msg "[+] Cleaning pip cache"
    pip cache purge

    test_exit_code
fi

# verify poetry is installed
if command_exists poetry
then
    log_msg "[+] Cleaning poetry cache"
    poetry cache clear . --all

    test_exit_code
fi

if command_exists yarn
then
    log_msg "[+] Cleaning yarn cache"
    yarn cache clean

    test_exit_code
fi
