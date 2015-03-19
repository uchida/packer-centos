# packer-centos

packer template to build CentOS images

## Building Images

To build images, simply run:

```
$ git clone https://github.com/uchida/packer-centos
$ cd packer-centos
$ packer build template.json
```

If you want to build only virtualbox, vmware or qemu.

```
$ packer build -only=virtualbox-iso template.json
$ packer build -only=vmware-iso template.json
$ packer build -only=qemu template.json
```

When building qemu images, note that your `qemu_binary` path is correct.
