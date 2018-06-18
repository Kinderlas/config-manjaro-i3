#!/bin/sh
while true; do
  arr=(`find /opt/wallpaper -type f \( -name '*.jpg' -o -name '*.png' \)|shuf -n2`)
  bg0=${arr[0]}
  bg1=${arr[1]}
  #feh --bg-fill $bg0 --bg-fill $bg1
  feh --bg-scale $bg0 --bg-scale $bg1
	sleep 30m
done
