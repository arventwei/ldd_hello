#!/bin/sh
module="hello"
device="hello"

# invoke rmmod with all arguments we got
/sbin/rmmod $module $* || exit 1

# Remove stale nodes

rm -f /dev/${device} /dev/${device}0
# rm -f /dev/${device}priv
# rm -f /dev/${device}pipe /dev/${device}pipe0
# rm -f /dev/${device}single
# rm -f /dev/${device}uid
# rm -f /dev/${device}wuid
