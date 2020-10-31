#!/bin/bash
set -e
if [[ "$USER" == 'root' ]]; then
    echo -e "\n\tPlease run script as non-root!"
    exit 1
fi

# PRE-START APPLICATIONS
copyq &

# MAKE CONFIG DIRECTORIES
sed -i -e "\$aalias ll='ls -ahl'" $HOME/.bashrc
mkdir -p $HOME/.config/openbox/

# COPY CONFIG FILES
cp copyq-commands.ini $HOME/.config/copyq/
cp copyq.conf $HOME/.config/copyq/
cp desktop.conf $HOME/.config/lxsession/LXDE-pi/
cp lxde-pi-rc.xml $HOME/.config/openbox/
cp lxterminal.conf $HOME/.config/lxterminal/
cp panel $HOME/.config/lxpanel/LXDE-pi/panels/
cp pcmanfm.conf $HOME/.config/pcmanfm/LXDE-pi/
cp tmux.conf $HOME/.tmux.conf
cp vimrc $HOME/.vimrc
cp xbindkeysrc $HOME/.xbindkeysrc

# POST-START APPLICATIONS
openbox-lxde --restart
xbindkeys
# rc_gui
# pipanel
# obconf
# obmenu

# MESSAGE
echo -e "\n\tPlease reboot now!"
