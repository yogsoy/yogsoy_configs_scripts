#!/bin/bash

killall espeak
date | awk '{print $4}' | head -c 5 | espeak -s 250 -v en
