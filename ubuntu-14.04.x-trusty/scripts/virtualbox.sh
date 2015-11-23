#!/bin/bash -eux

#we have to reboot here, so the re-build of the virtualbox additions links against the new kernel/headers
reboot

#make sure we wait for the reboot, otherwise we will run in ugly race conditions
sleep 999999

mkdir /tmp/vbox
VER=$(cat /home/vagrant/.vbox_version)
wget -nc http://download.virtualbox.org/virtualbox/$VER/VBoxGuestAdditions_$VER.iso
mount -o loop VBoxGuestAdditions_$VER.iso /tmp/vbox
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rmdir /tmp/vbox
rm *.iso
