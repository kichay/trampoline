# Trampoline
Simple linux initramfs generator

### Generate:
- ./trampoline.gen < /etc/modules > /boot/initramfs.newc

### Depenences:
- /bin/busybox (static linked)
- CONFIG_DEVTMPFS=y (kernel config)

### Cmdargs:
- root - UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | /dev/sdxy (required)
- root_mount_timeout - fractional | N (optional, default 15)
- root_mount_tick -  fractional | N (optional, default 0.5)
- root_init - string (optional, default /bin/init)
- ro - ro|"" (optional, default "")
