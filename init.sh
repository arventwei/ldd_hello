#!/bin/sh 
module="hello" 
device="hello" 
mode="664" 
# invoke insmod with all arguments we got 
# and use a pathname, as newer modutils don't look in . by default 
/sbin/insmod ./$module.ko $* || exit 1 
# remove stale nodes 
rm -f /dev/${device}0
major=$(awk "\$2==\"$module\" {print \$1}" /proc/devices)
echo $major
mknod /dev/${device}0 c $major 0 
# mknod /dev/${device}1 c $major 1 
# mknod /dev/${device}2 c $major 2 
# mknod /dev/${device}3 c $major 3 
# give appropriate group/permissions, and change the group. 
# Not all distributions have staff, some have "wheel" instead. 

# Group: since distributions do it differently, look for wheel or use staff
if grep -q '^staff:' /etc/group; then
    group="staff"
else
    group="wheel"
fi
chgrp $group /dev/${device}0
chmod $mode /dev/${device}0