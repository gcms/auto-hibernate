#!/usr/bin/env bash

sudo apt-get -y install yad pm-utils
sudo chmod g+w /sys/class/rtc/rtc0/wakealarm /sys/power/state
sudo chgrp sudo /sys/class/rtc/rtc0/wakealarm /sys/power/state

BASEDIR="$(dirname "$0")"

mkdir -p "$HOME/.auto-hibernate"
cp -p "$BASEDIR/hibernate" "$HOME/.auto-hibernate/hibernate"
chmod +x "$HOME/.auto-hibernate/hibernate"


AUTOSTART="$HOME/.config/autostart"
mkdir -p "$AUTOSTART"

cat "$BASEDIR/hibernate.desktop" | while read l; do eval "echo  $l"; done > $HOME/.config/autostart/hibernate.desktop
