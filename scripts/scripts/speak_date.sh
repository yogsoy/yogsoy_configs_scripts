#!/bin/bash

killall espeak
date -I'minutes' | sed s/[T-]/\ /g | head -c 10 | espeak -s 250 -v en
