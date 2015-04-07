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
    mount -o loop linux.iso /mnt
    tar xf /mnt/VMwareTools-*.tar.gz -C /tmp
    /tmp/vmware-tools-distrib/vmware-install.pl --default
    umount /mnt
    rm -rf /tmp/vmware-tools-distrib
    rm linux.iso
    ;;
esac
