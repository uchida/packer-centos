#!/bin/bash
set -ex
case "$PACKER_BUILDER_TYPE" in
  virtualbox-iso)
    mount -o loop VBoxGuestAdditions.iso /mnt
    yum install -y gcc make gcc-c++ perl bzip2 "kernel-devel-$(uname -r)"
    sh /mnt/VBoxLinuxAdditions.run || :
    umount /mnt
    rm -rf VBoxGuestAdditions.iso
    ;;
  vmware-iso)
    yum install -y open-vm-tools
    ;;
esac
