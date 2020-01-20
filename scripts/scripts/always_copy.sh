#!/bin/bash

xclip -o | xclip -i -selection clipboard

CLIPB=$(xclip -o --selection clipboard)

if [ -f ~/clipboard_history ]; then
	if [ "$(cat ~/clipboard_history | tail -1)" != "$CLIPB" ]; then
		echo "$CLIPB" >> ~/clipboard_history
	fi
fi
