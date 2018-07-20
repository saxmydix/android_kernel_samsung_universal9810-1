#!/system/bin/sh
#
# Created by @djb77. Code snippets from @Tkkg1994, and @Morogoku
#

# Set Variables
BB="/sbin/busybox"
RESETPROP="/sbin/magisk resetprop -v -n"

# Mount
$BB mount -t rootfs -o remount,rw rootfs
$BB mount -o remount,rw /system
$BB mount -o remount,rw /data
$BB mount -o remount,rw /

# Set KNOX to 0x0 on running /system
$RESETPROP ro.boot.warranty_bit "0"
$RESETPROP ro.warranty_bit "0"

# Fix Safetynet flags
$RESETPROP ro.build.fingerprint "samsung/star2ltexx/star2lte:8.0.0/R16NW/G965FXXU2BRG6:user/release-keys"

# Fix Samsung Related Flags
$RESETPROP ro.fmp_config "1"
$RESETPROP ro.boot.fmp_config "1"

# SELinux (0 / 640 = Permissive, 1 / 644 = Enforcing)
echo "0" > /sys/fs/selinux/enforce
chmod 640 /sys/fs/selinux/enforce

# Unmount
$BB mount -t rootfs -o remount,ro rootfs;
$BB mount -o remount,ro /system;
$BB mount -o remount,rw /data;
$BB mount -o remount,ro /;

