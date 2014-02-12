#!/bin/bash -eux

apt-get -y install ruby1.9.3 nfs-common
apt-get -y install htop jwhois multitail apache2-utils strace rsync manpages manpages-dev nscd subversion git-core unzip

gem install apt-spy2
