battery=$(acpi -b)
level=$(echo $battery | awk '{print $4}' | sed 's/%//;s/,//')
status=$(echo $battery | sed 1q |awk '{print $3}' | tr -d "\n")

printf "<span foreground='"

if [ $level -le 10 ];
then
	printf "red' weight='bold'>"
elif [ $level -gt 10 -a $level -le 30 ]
then
	printf "orange'>"
elif [ $level -gt 30 -a $level -le 60 ]
then
	printf "yellow'>"
else
	printf "lime'>"
fi

if [ $status = "Discharging," ];
then
	printf "↓"
else
	printf "↑"
fi

printf "$level%%</span>"
