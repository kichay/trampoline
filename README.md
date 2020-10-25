# Trampoline
Simple linux initramfs generator

### Generate:
- ./trampoline.gen < /etc/modules > /boot/initramfs.newc

### Depenences:
- /bin/busybox (static linked)
- CONFIG_DEVTMPFS=y (kernel config)

### Cmdargs:
- root - device taken to busybox mount command param at mounting root (required)
- root_mount_timeout - root mount timeout interval (optional, default 15)
- root_mount_tick - root mount tick interval (optional, default 0.5)
- root_init - init on root (optional, default /bin/init)
- ro - adds read-only mount option to busybox mount command (optional)
