#!/bin/bash

base=$(dirname $0)
build=$base/build
src=$base/src

mkdir -p $build $build/{bin,dev,proc,newroot,var,etc/modules-load.d,lib/modules}
cp $src/init $build/
cp /bin/busybox $build/bin/
(cd $build; find *) | cpio -H newc -R 0:0 -D $build -o | gzip > $base/initramfs.newc.gz
