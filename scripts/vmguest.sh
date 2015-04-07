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
    rpm --import http://ftp.tsukuba.wide.ad.jp/Linux/fedora/epel/RPM-GPG-KEY-EPEL-6
    rpm -ivh http://ftp.tsukuba.wide.ad.jp/Linux/fedora/epel/epel-release-latest-6.noarch.rpm
    yum install -y open-vm-tools
    ;;
esac
