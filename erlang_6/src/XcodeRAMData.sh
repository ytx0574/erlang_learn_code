#!/bin/bash
RAMDISK=”XcodeBuildData”
SIZE=1024*4         #size in MB for ramdisk.
diskutil erasevolume HFS+ $RAMDISK \
`hdiutil attach -nomount ram://$[SIZE*2048]`
