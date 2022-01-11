#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --experimental-backends
# run xautolock -time 30 -locker slock
run syndaemon -i 0.5 -t -K -R
run nm-applet
run blueman-applet
run kmix --keepvisibility
run udiskie -t
