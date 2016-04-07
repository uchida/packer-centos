#!/bin/bash
set -ex
useradd vagrant -g wheel -s /bin/bash
echo "vagrant" | passwd --stdin vagrant
cat <<EOF > /etc/sudoers.d/vagrant
vagrant ALL=(ALL) NOPASSWD: ALL
Defaults:vagrant !requiretty
EOF
chmod 0440 /etc/sudoers.d/vagrant

mkdir -pm 700 ~vagrant/.ssh
curl -fsSL 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -o ~vagrant/.ssh/authorized_keys
chmod 0600 ~vagrant/.ssh/authorized_keys
chown -R vagrant:wheel ~vagrant

passwd -l root
