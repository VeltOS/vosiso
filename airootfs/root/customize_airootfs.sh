#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Compile GTK schemas
glib-compile-schemas /usr/share/glib-2.0/schemas/

# Default stuff
usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

# Create live user
groupadd -r autologin
useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel,autologin" -s /bin/bash veltlive
echo "veltlive ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Default stuff
sed -i 's/#\(PermitRootLogin \)no/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target

