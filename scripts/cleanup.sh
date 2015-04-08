#!/bin/bash
set -ex
yum clean -y all
find /var/log -type f -delete
for netif in $(ls /etc/sysconfig/network-scripts/ifcfg-*); do
  sed -i '/^HWADDR/d' "$netif"
  sed -i '/^UUID/d' "$netif"
done
rm /etc/udev/rules.d/70-persistent-net.rules
