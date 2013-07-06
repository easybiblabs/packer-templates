#!/bin/bash -eux

# Cause Chef 11 breaks it all!
CHEF_DEB=chef_10.24.0-1.ubuntu.10.04_amd64.deb

wget -O "/tmp/${CHEF_DEB}" "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/${CHEF_DEB}"
dpkg -i "/tmp/${CHEF_DEB}"
