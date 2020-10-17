# Trampoline
Simple linux initramfs

### Build:
- Put static linked busybox binary to bin/busybox
- Prepare etc/modules config
- Put linux modules to lib/modules/$(uname -a)/...
- ./build.sh

### Build depenences:
- bash
- cpio
- gzip

### Kernel dependences:
- CONFIG_DEVTMPFS_MOUNT=y (required)

### Cmdargs:
- root - UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | /dev/sdxy (required)
- root_mount_timeout - fractional | N (optional, default 15)
- root_mount_tick -  fractional | N (optional, default 0.5)
- root_init - string (optional, default /bin/init)
- ro - ro|'' (optional, default '')
