#!/bin/bash

killall espeak
xclip -o | espeak -s 250 -v en
