#!/bin/bash

unbuffer hyfetch | aha -n > hyfetch.html
uptime           | aha -n > uptime.html
uname -a         | aha -n > uname.html
vmstat           | aha -n > vmstat.html
iostat -xz ld0   | aha -n > iostat.html
df -h /          | aha -n > df.html
lsblk -e7        | aha -n > lsblk.html # see https://askubuntu.com/a/1142405
top -b -n1       | aha -n > top.html