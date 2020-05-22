#!/bin/sh
xrdb -merge /home/elyshea/.Xresources

xset s off
xset -dpms

light-locker --no-late-locking --lock-on-suspend --lock-on-lid &
