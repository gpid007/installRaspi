#!/bin/bash
set -e
if [[ "$USER" != 'root' ]]; then
    echo -e "\n\tPlease run script as root!\n"
    exit 1
fi

# GLOBALS
installList='
    calibre
    copyq
    firefox-esr
    fonts-cantarell
    fonts-opendyslexic
    obconf
    obmenu
    prelink
    tmux
    vim
    xautomation
    xbindkeys
    xdotool
'

# INSTALLATION
apt-get update -y
apt-get install -y $installList
apt-get upgrade -y
apt-get autoclean -y
apt-get autoremove -y

# ADD ALIAS
sed -i -e "\$aalias ll='ls -ahl'" $HOME/.bashrc

# MESSAGE
echo -e "\n\tDone."
