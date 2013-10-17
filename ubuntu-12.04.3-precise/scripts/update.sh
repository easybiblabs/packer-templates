#!/bin/bash -eux

mv /etc/apt/sources.list /etc/apt/sources.list.old

cat > /etc/apt/sources.list << EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse
EOF

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoclean

# ensure the correct kernel headers are installed
apt-get -y install linux-headers-$(uname -r)

apt-get -y clean

# setup zsh - the best shell ever
VAGRANT_ZSHRC=/home/vagrant/.zshrc
EASYBIB_ZSHRC=https://gist.github.com/till/f683a2237571936c2df2/raw/201a181e0fe647d3922246758e7c07d96f59f6cc/.zshrc
wget $EASYBIB_ZSHRC -O $VAGRANT_ZSHRC
chown vagrant:vagrant $VAGRANT_ZSHRC
usermod -s /bin/zsh vagrant

#we have to reboot here, so the re-build of the virtualbox additions links against the new kernel/headers
reboot

#make sure we wait for the reboot, otherwise we will run in ugly race conditions
sleep 999999 