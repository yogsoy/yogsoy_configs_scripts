#!/bin/bash

# superficial sort - bite me
MAN_PAGES=$(apropos . | cut -d' ' -f1 | sort -V | uniq)

SELECTED_MAN=$(echo "$MAN_PAGES" | dmenu -p 'Show man page: ')

[[ -z "$SELECTED_MAN" ]] && exit

man -w "$SELECTED_MAN" || { notify-send "man page does not exist."; exit 1; }

kitty -o background_opacity=0.8 --class sys_monitor --title "$SELECTED_MAN - man" /usr/bin/man $SELECTED_MAN &
