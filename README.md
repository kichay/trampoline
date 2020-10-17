# Trampoline
Simple linux initramfs

### Build:
- Make build, build/etc/modules-load.d, build/lib/modules directories
- Put linux modules to build/lib/modules/$(uname -a)/...
- Prepare build/etc/modules-load.d/... configurations
- ./build.sh

### Build depenences:
- busybox (static linked)
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
