#!/bin/bash

build=$(mktemp -d)
bin=$(dirname $0)/bin
src=$(dirname $0)/src
etc=$(dirname $0)/etc
lib=$(dirname $0)/lib
boot=$(dirname $0)

mkdir -p $build $build/{dev,proc,newroot,var,lib/modules}
cp $src/init $build/
cp -ar $bin $build/
cp -ar $etc $build/
cp -ar $lib $build/
(cd $build; find *) | cpio -H newc -R 0:0 -D $build -o | gzip > $boot/initramfs.newc.gz

rm -rf $build
