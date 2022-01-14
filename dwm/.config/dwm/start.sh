#!/bin/sh
picom --experimental-backends &
feh --bg-fill $HOME/Pictures/Wallpapers/peak.png &

while true; do
 dbus-launch /usr/local/bin/dwm 2> /dev/null
done
