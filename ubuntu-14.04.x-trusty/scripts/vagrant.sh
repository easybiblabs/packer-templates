#!/bin/bash -eux

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=adm' /etc/sudoers
sed -i -e 's/%adm ALL=(ALL) ALL/%adm ALL=NOPASSWD:ALL/g' /etc/sudoers
