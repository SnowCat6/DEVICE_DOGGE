#!/bin/sh
echo lz4k > /sys/block/zram0/comp_algorithm
# ZRAM swap - by default
echo 0 > /sys/block/zram0/disksize
/system/bin/mkswap /dev/block/zram0
/system/bin/swapon /dev/block/zram0
# Set swappiness
echo 150 > /proc/sys/vm/swappiness
