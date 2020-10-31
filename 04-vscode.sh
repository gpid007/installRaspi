#!/bin/bash
set -e
if [[ "$USER" == 'root' ]]; then
    echo -e "\n\tPlease run script as non-root!\n"
    exit 1
fi

# GLOBALS
vsCodeDir="$HOME/.config/Code - OSS (headmelted)/User"
gpgUrl='https://packagecloud.io/headmelted/codebuilds/gpgkey'
vsCodeUrl='https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh'
extensionFile='extensionList'

# DOWNLOAD AND INSTALL
curl -L $gpgUrl | sudo apt-key add -
which code-oss || curl -L $vsCodeUrl | sudo bash

# CONFIGURE VSC
mkdir -p "$vsCodeDir"
cp -t "$vsCodeDir" keybindings.json settings.json
sudo chmod 777 "$vsCodeDir"/*json
while read line; do
    code-oss --install-extension $line &
done< <(cat "$extensionFile")
wait

# MESSAGE
echo -e "\n\tDone."
