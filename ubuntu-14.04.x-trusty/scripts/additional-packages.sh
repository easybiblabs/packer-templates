#!/bin/bash -eux

apt-get -y install nfs-common ruby-dev
apt-get -y install htop jwhois multitail apache2-utils strace rsync manpages manpages-dev nscd subversion git-core unzip
apt-get -y install unattended-upgrades
gem install apt-spy2
