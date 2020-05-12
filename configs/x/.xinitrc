#!/bin/sh
xrdb -merge /home/elyshea/.Xresources

xset s 3600
xset -dpms

light-locker --no-late-locking --lock-on-suspend --lock-on-lid &
