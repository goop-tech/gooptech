#!/bin/bash
set -euo pipefail

STATUS_FILE="/var/www/gooptech.nya.pub/status.html"
mkdir -p "$(dirname "$STATUS_FILE")"

LOG_FILE="/home/flwrstems/frankiestatuserr.log"
mkdir -p "$(dirname "$LOG_FILE")"


{
    #echo -e '\e[0;31m' # red color
    echo -e '\e[0;91m'
    echo -e '░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░'
    echo -e '░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░       '
    echo -e '░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░       '
    echo -e '░▒▓██████▓▒░ ░▒▓███████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓██████▓▒░  '
    echo -e '░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░       '
    echo -e '░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░       '
    echo -e '░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░'
    echo -e "\nfrankie's status\nGenerated on: $(date)"
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
    echo -e '\n=== top ==='
    top -b -n1 
} | aha -b -t 'status' > "$STATUS_FILE" 2> "$LOG_FILE"
