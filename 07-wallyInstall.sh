#!/bin/bash
set -e
if [[ "$USER" == 'root' ]]; then
    echo -e "\n\tPlease run script as non-root!\n"
    exit 1
fi

# INSTALL PACKAGES
packageList='
    gtk+3.0
    libwebkit2gtk-4.0
    libusb-dev
'
sudo apt-get install -y $packageList

# WALLY UDEV RULE
cat <<EOF | sudo tee /etc/udev/rules.d/50-wally.rules
# Teensy rules for the Ergodox EZ
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

# STM32 rules for the Moonlander and Planck EZ
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", \
    MODE:="0666", \
    SYMLINK+="stm32_dfu"
EOF

# ADD USER TO PLUGDEV GROUP
sudo groupadd plugdev
sudo usermod -aG plugdev $USER

# MESSAGE
echo -e "\n\tDone."
