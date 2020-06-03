NETWORK=$(iwgetid -r)
IP_ADDRESS=$(ip route get 1.2.3.4 | awk '{print $7}')

if [ -n "$NETWORK" ]; then
	echo "<span foreground='#2244ff'>$NETWORK</span> <span foreground='grey'>[$IP_ADDRESS]</span>"
else
	echo "<span foreground='red' weight='bold'>Not Connected</span>"
fi
