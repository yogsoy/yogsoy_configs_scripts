#!/bin/bash

killall espeak
date +"%I:%M %P" | espeak -s 250 -v en
