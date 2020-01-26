#!/bin/sh
xrdb -merge /home/elyshea/.Xresources
light-locker --no-late-locking --lock-on-suspend --lock-on-lid &
