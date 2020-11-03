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

# INSTALL OH-MY-BASH
ohMyBashUrl='https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh'
ps1Sub='PS1="${bold_cyan}\\u ${white}${AWS_PROFILE} ${bold_cyan}\\W $(scm_prompt_char_info)${ret_status}${normal}\\$ "'
bash -c "$(curl -fsSL $ohMyBashUrl)"
# sed -e '/PS1/ s/^#*/#/' -i $HOME/.oh-my-bash/themes/font/font.theme.sh
sed -i "s/^[^#]*PS1/# &/" $HOME/.oh-my-bash/themes/font/font.theme.sh
sed -i "/#.*PS1/a \ \ \ \ ${ps1Sub}" $HOME/.oh-my-bash/themes/font/font.theme.sh
sed -i "s/alias gcm='git checkout master'/alias gcm='git commit -m'/" $HOME/.oh-my-bash/plugins/git/git.plugin.sh

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

