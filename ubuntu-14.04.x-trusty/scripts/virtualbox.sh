#!/bin/bash -eux

echo " -> download & install virtualbox guest additions"

mkdir /tmp/vbox
VER=$(cat /home/vagrant/.vbox_version)
wget -nc http://download.virtualbox.org/virtualbox/$VER/VBoxGuestAdditions_$VER.iso
mount -o loop VBoxGuestAdditions_$VER.iso /tmp/vbox
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rmdir /tmp/vbox
rm *.iso
