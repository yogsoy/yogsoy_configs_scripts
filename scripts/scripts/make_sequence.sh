#!/bin/bash

xdotool type "$(echo "" | dmenu -p "Sequence (comma delim):" -l 0| sed "s/,/, /g")"
