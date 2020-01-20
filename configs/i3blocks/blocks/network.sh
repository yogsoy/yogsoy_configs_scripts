NETWORK=$(iwgetid -r)

if [ -n "$NETWORK" ]; then
	echo "<span foreground='#2244ff'>$NETWORK</span> <span foreground='grey'>[$(hostname -I | head -c -2)]</span>"
else
	echo "<span foreground='red' weight='bold'>Not Connected</span>"
fi
