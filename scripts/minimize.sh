#!/bin/bash -eux
exit 0

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
