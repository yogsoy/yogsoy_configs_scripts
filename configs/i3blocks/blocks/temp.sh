ping wttr.in -c 1 1>/dev/null 2>/dev/null || exit

echo `curl 'wttr.in?format=3' | awk '{print $NF}' | egrep -o '[-+][0-9]+°C'`
