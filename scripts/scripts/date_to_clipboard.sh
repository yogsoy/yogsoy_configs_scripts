#!/bin/bash

#date -I'minutes' | sed s/T/\ /g | head -c 16 | xclip -i -selection clipboard
date -I | head -c -1| xclip -i -selection clipboard
