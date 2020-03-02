#!/bin/bash

killall espeak
date +"%R" | espeak -s 250 -v en
