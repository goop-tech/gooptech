#!/bin/bash
set -euo pipefail

STATUS_FILE="/var/www/gooptech.nya.pub/dewdropstatus.html"
mkdir -p "$(dirname "$STATUS_FILE")"

LOG_FILE="/home/flwrstems/dewdropstatus.log"
mkdir -p "$(dirname "$LOG_FILE")"


{ 
    echo -e '\e[0;36m' #cyan
    echo -e ' ┓      ┓      '
    echo -e '┏┫┏┓┓┏┏┏┫┏┓┏┓┏┓'
    echo -e '┗┻┗ ┗┻┛┗┻┛ ┗┛┣┛'
    echo -e '             ┛ '

    echo -e "\ndewdrop <3\nGenerated on: $(date)"
    echo -e '\e[0m' # reset

    echo -e '\n=== uname -a ==='
    uname -a | fold
    echo -e '\n=== uptime ==='
    uptime
    echo -e '\n=== hyfetch ==='
    unbuffer hyfetch
    echo -e '\n=== vmstat ==='
    vmstat
    echo -e '\n=== iostat -xz ld0 ==='
    iostat -xz ld0
    echo -e '\n=== df -h / ==='
    df -h /
} | aha -b -t 'status' > "$STATUS_FILE" 2> "$LOG_FILE"
