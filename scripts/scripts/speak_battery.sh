#!/bin/bash

killall espeak
acpi -b | awk '{print $4, $3}' | sed 1q | head -c -2 | espeak -s 250 -v en
