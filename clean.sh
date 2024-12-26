#!/usr/bin/env bash

function print_green() {
    echo -e "\033[32m$1\033[0m"
}

function print_red() {
    echo -e "\033[31m$1\033[0m"
}

function print_blue() {
    echo -e "\033[34m$1\033[0m"
}

# verify x is installed
function command_exists() {
    command -v "$1" &> /dev/null
}

if command_exists apt
then
    print_blue "[+] Cleaning apt unused packages"
    sudo apt autoremove -y

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi

# verify flatpak is installed
if command_exists flatpak
then
    print_blue "[+] Cleaning flatpak environments"
    flatpak uninstall --unused -y

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi

# verify conda is installed
if command_exists conda
then
    print_blue "[+] Cleaning conda cache"
    conda clean -a -y

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi

# verify pip is installed

if command_exists pip
then
    print_blue "[+] Cleaning pip cache"
    pip cache purge

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi

# verify poetry is installed
if command_exists poetry
then
    print_blue "[+] Cleaning poetry cache"
    poetry cache clear . --all

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi

if command_exists yarn
then
    print_blue "[+] Cleaning yarn cache"
    yarn cache clean

    if [ $? -eq 0 ]
    then
        print_green "[+] OK"
    else
        print_red "[-] Error"
    fi
fi
