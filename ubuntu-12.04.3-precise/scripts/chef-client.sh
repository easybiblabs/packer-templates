#!/bin/bash -eux

#CHEF_DEB=chef_10.24.0-1.ubuntu.10.04_amd64.deb
CHEF_DEB=chef_11.4.4-2.ubuntu.11.04_amd64.deb
TARGET="/tmp/${CHEF_DEB}"

wget -nc -O "${TARGET}" "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/${CHEF_DEB}"
dpkg -i "${TARGET}"
rm -f "${TARGET}"
