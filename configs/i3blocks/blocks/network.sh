#!/bin/bash

NETWORK=$(iwgetid -r)
IP_ADDRESS=$(ip route get 1.2.3.4 | cut -d' ' -f7)

if [ -n "$NETWORK" ]; then
	echo -n "<span foreground='#2244ff'>$NETWORK</span> <span foreground='grey'>[$IP_ADDRESS]</span>"
	pgrep -x tor 1>/dev/null && echo -n "<span foreground='yellow'>(TOR)</span>"
	echo ""
else
	echo "<span foreground='red' weight='bold'>Not Connected</span>"
fi
