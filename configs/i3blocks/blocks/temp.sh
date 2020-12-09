ping wttr.in -c 1 1>/dev/null 2>/dev/null || exit

case $BLOCK_BUTTON in
	1) notify-send "`curl 'wttr.in/?format=%l:.%c%C.%t+%w' | sed 's/\./\n/g'`";;
esac

echo `curl 'wttr.in?format=3' | awk '{print $NF}' | egrep -o '[-+][0-9]+°C'`
