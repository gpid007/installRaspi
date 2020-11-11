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
    libusb-1.0
'
sudo apt-get install -y $packageList

# DOWNLOAD AND INSTALL GO-LANG
curl https://dl.google.com/go/go1.13.7.linux-armv6l.tar.gz -O go.tar.gz
sudo tar -C /usr/local -xzf go.tar.gz

# SET PATHS
cat <<\EOF >>$HOME/.bashrc
export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin
export CC=aarch64-linux-gnu-gcc
export GOARCH=arm64
export GOOS=linux
export CGO_ENABLED=1
EOF
. $HOME/.bashrc

# BUILD WALLY
go get -u github.com/zsa/wally-cli
ls -ahl $HOME/go/bin/linux_arm64/


# # WALLY UDEV RULE
# cat <<EOF | sudo tee /etc/udev/rules.d/50-wally.rules
# # Teensy rules for the Ergodox EZ
# ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
# ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
# KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

# # STM32 rules for the Moonlander and Planck EZ
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", \
#     MODE:="0666", \
#     SYMLINK+="stm32_dfu"
# EOF

# # ADD USER TO PLUGDEV GROUP
# sudo groupadd plugdev
# sudo usermod -aG plugdev $USER

# # MESSAGE
# echo -e "\n\tDone."

