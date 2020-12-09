#!/bin/bash
# marquee.sh [width] [delay] [text]

# https://www.reddit.com/r/i3wm/comments/al00gc/scrolling_text_on_i3bar/

w="$1"
delay="$2"
shift 2
text="$(printf "%${w}s" "$*")"
while sleep "$delay"; do
    printf '%s\r' "${text:$l:$w}${text:$l2:$w2}"
    (( l = (l + 1) % ${#text} ))
    (( l2 = (l - ${#text}) > 0 ? (l - ${#text}) : 0 ))
    (( w2 = (l + w - ${#text}) > 0 ? (l + w - ${#text}) : 0 ))
done
