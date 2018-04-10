#!/usr/bin/env bash
# expected parameters:
#   -s : Suspends the system after locking its screen

tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
i3lock -u -i "$tmpbg"
rm $tmpbg

if [[ $1 == '-s' ]]; then
  systemctl suspend
fi
