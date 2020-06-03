#!/bin/bash

PROGRAMS=$(ls $(echo $PATH | sed s/:/\ /g) ~/scripts/)
$(echo $PROGRAMS | sed 's/ /\n/g' | sort | grep -v ':' | rofi -dmenu -p "Run: " -font "Share Tech Mono 20")
#$(echo $PROGRAMS | sed 's/ /\n/g' | sort | grep -v ':' | dmenu -p "Run:" -l 10 -nb "#333" -sb "#d70a53")
