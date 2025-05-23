#!/bin/bash
set -euo pipefail

REMOTE_PATH="/var/www/gooptech.nya.pub/dewdropstatus.html"
mkdir -p "$(dirname "$REMOTE_PATH")"

REMOTE_LOG="/home/flwrstems/dewdropstatus.log"
mkdir -p "$(dirname "$REMOTE_LOG")"

LOCAL_PATH="/home/flwrstems/dewdropstatus.html"
mkdir -p "$(dirname "$LOCAL_PATH")"

LOCAL_LOG="/home/flwrstems/dewdropstatus.log"
mkdir -p "$(dirname "$LOCAL_LOG")"

FRANKIE_USER="flwrstems"
FRANKIE_HOST="173.88.84.88"


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
} | aha -b -t 'dewdropstatus' > "$LOCAL_PATH" 2> "$LOCAL_LOG"

scp "$LOCAL_PATH" "$FRANKIE_USER@$FRANKIE_HOST:$REMOTE_PATH"
