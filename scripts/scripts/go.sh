#!/bin/bash

PROGRAMS=$(ls $(echo $PATH | sed s/:/\ /g); find ~/scripts/ -type f)
#$(echo $PROGRAMS | sed 's/ /\n/g' | sort | grep -v ':' | rofi -dmenu -p "Run: " -font "Share Tech Mono 20")
$(echo $PROGRAMS | sed 's/ /\n/g' | sort | grep -v ':' | dmenu -p "Run:") &
