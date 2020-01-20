#!/bin/bash

PROGRAMS=$(ls $(echo $PATH | sed s/:/\ /g))
$(echo $PROGRAMS | sed 's/ /\n/g' | sort | grep -v ':' | dmenu -p "Run:" -l 10)
