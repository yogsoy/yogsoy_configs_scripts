#!/bin/bash

INPUT="$(xclip -o)"

[[ -z "$INPUT" ]] && exit

xdg-open "https://en.wiktionary.org/wiki/$(xclip -o)"
