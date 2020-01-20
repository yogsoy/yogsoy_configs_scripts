#!/bin/bash

xdotool getwindowfocus type --clearmodifiers "$(xclip -o)"
