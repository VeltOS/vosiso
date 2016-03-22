#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

# Create live user
groupadd -r autologin
useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel,autologin" -s /bin/bash veltlive
echo "veltlive ALL=(ALL:ALL) ALL" >> /etc/sudoers
#

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target

systemctl enable wicd
systemctl enable lightdm

glib-compile-schemas /usr/share/glib-2.0/schemas/

# Don't want this stuff cluttering the Launcher
rm /usr/share/applications/bssh.desktop
rm /usr/share/applications/bvnc.desktop
rm /usr/share/applications/avahi-discover.desktop
rm /usr/share/applications/qv4l2.desktop
rm /usr/share/applications/gcm-viewer.desktop
rm /usr/share/applications/nm-connection-editor.desktop
rm /usr/share/applications/zenmap.desktop
rm /usr/share/applications/zenmap-root.desktop
rm /usr/share/applications/elinks.desktop

