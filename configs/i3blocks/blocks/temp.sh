curl wttr.in 2>/dev/null | sed '4q;d' | sed 's/\x1b\[[0-9;]*m//g' | egrep -o "\-?[0-9]+.*[0-9]+" | sed 's/\.\./-/' | head -c -1; printf "°C"
