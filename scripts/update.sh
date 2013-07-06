#!/bin/bash -eux

mv /etc/apt/sources.list /etc/apt/sources.list.old

cat > /etc/apt/sources.list << EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt lucid main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt lucid-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt lucid-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt lucid-security main restricted universe multiverse
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
EASYBIB_ZSHRC=https://raw.github.com/gist/4131047/ecd1ae36192276e73c9c2709cb9402a10ba40c29/.zshrc
wget $EASYBIB_ZSHRC -O $VAGRANT_ZSHRC
chown vagrant:vagrant $VAGRANT_ZSHRC
usermod -s /bin/zsh vagrant
