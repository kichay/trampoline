#!/bin/bash

[[ ! -d build ]] && echo Please read the manual before use: README.md && exit 1

mkdir -p build/{dev,proc,newroot,var}
cp src/init build/init
(cd build; find *) | cpio -H newc -R 0:0 -D build -o | gzip > initramfs.newc.gz
