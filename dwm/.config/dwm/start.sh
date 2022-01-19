#!/bin/sh
picom --experimental-backends &
feh --bg-fill $HOME/Pictures/Wallpapers/peak.png &

syndaemon -d -K -i 0.5

while true; do
 dbus-launch /usr/local/bin/dwm 2> /dev/null
 sleep 5
done
