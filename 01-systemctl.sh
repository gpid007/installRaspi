#!/bin/bash
set -e
if [[ "$USER" != 'root' ]]; then
    echo -e "\n\tPlese run script as root!\n"
    exit 1
fi

# CLEANUP USER CREATION
userdel -r 'pi'

# FAN-CONTROL AND FONTS
mkdir -p /opt/fanctrl/
cp fan_ctrl.py /opt/fanctrl/
cp fanctrl.service /lib/systemd/system/
tar -xvzf fonts-droid.tar.gz -C /usr/share/fonts/truetype/

# MOUSE AND LAYOUT-TOGGLE
sed -i '$s/$/ usbhid.mousepoll=0/' /boot/cmdline.txt
sed -i '$agrp:win_toggle_space=Win+Space' /usr/share/lxpanel/xkeyboardconfig/toggle.cfg

# SET KEYBOARD LAYOUTS
setxkbmap                               \
    -model      'pc105'                 \
    -layout     'us,us'                 \
    -variant    ',intl'                 \
    -option     'grp:win_space_toggle'

# US-DE KEY-MAP #
cat <<EOF
-_ ß?
'" äÄ
;: öÖ
[{ üÜ
EOF

# SYSTEM CONTROL
systemctl enable fanctrl.service
systemctl start fanctrl.service
systemctl disable ssh.service
systemctl disable ntp.service
systemctl disable dphys-swapfile.service
systemctl disable keyboard-setup.service
systemctl disable apt-daily.service
systemctl disable wifi-country.service
systemctl disable hciuart.service
systemctl disable raspi-config.service
systemctl disable avahi-daemon.service
systemctl disable triggerhappy.service
# systemctl disable networking.service
# systemctl disable dhcpcd.service

# MESSAGE
echo -e "\n\tPlease reboot now!"
