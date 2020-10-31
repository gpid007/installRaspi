#!/bin/bash
set -e
if [[ "$USER" != 'root' ]]; then
    echo -e "\n\tPlease run script as root!\n"
    exit 1
fi

# GLOBALS
newUserName='greg'
tempDir="$HOME/tempDir"
debList='
    http://ftp.br.debian.org/debian/pool/main/e/ecryptfs-utils/ecryptfs-utils_111-4_arm64.deb
    http://ftp.br.debian.org/debian/pool/main/e/ecryptfs-utils/libecryptfs1_111-4_arm64.deb
'

# DOWNLOAD ECRYPTFS
mkdir -p $tempDir
cd $tempDir
for item in debList; do
    curl -O $item
done

# INSTALL ECRYPTFS
apt-get install -y ./*
modprobe ecryptfs
cd $HOME
rm -rf $tempDir

# CREATE NEW USER
sed -i "\$a$newUserName ALL=(ALL:ALL) ALL" /etc/sudoers
adduser $newUserName
ecryptfs-migrate-home -u $newUserName
rm -rf /home/$newUserName.*

# LOGOUT
echo -e "\n\tLogin as: $newUserName\n"
sleep 3
pkill x
