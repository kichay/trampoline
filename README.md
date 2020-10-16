# Trampoline
Simple linux initramfs

### Build:
- Make build directory
- Put busybox binary to build/bin/busybox
- Put linux modules to build/lib/modules/$(uname -a)/...
- Create build/etc/modules-load.d configuration directory with files
- ./build.sh

### Build depenences:
- busybox
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
