#!/bin/bash -eux

mv /etc/apt/sources.list /etc/apt/sources.list.old

echo " -> set mirrors.ubuntu.com"

cat > /etc/apt/sources.list << EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOF

echo " -> update sources"
apt-get update

echo " -> upgrade software & system"

apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoclean

echo " -> ensure the correct kernel headers are installed"

apt-get -y install linux-headers-$(uname -r)

apt-get -y clean

echo " -> setup zsh - the best shell ever"

VAGRANT_ZSHRC=/home/vagrant/.zshrc
EASYBIB_ZSHRC=https://gist.github.com/till/f683a2237571936c2df2/raw/201a181e0fe647d3922246758e7c07d96f59f6cc/.zshrc
wget $EASYBIB_ZSHRC -O $VAGRANT_ZSHRC
chown vagrant:vagrant $VAGRANT_ZSHRC
usermod -s /bin/zsh vagrant

echo " -> install required software"

apt-get -y install nfs-common ruby-dev
apt-get -y install htop jwhois multitail apache2-utils strace rsync manpages manpages-dev nscd subversion git-core unzip
apt-get -y install unattended-upgrades
gem install apt-spy2

echo " -> remove old software"

apt-get -y autoremove
apt-get -y clean
