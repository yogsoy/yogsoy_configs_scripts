LOW_BATTERY=20
MED_LOW_BATTERY=40
MED_BATTERY=60

battery="$(acpi -b)"
level=$(echo $battery | awk '{print $4}' | egrep -o '[0-9]+')
status=$(echo $battery | awk '{print $3}' | tr -d "\n")

printf "<span "

if [ $level -le $LOW_BATTERY ]; then
	printf "foreground='#FF0000' weight='bold'"
elif [ $level -le $MED_LOW_BATTERY ]; then
	printf "foreground='#FFA500'"
elif [ $level -le $MED_BATTERY ]; then
	printf "foreground='#FFFF00'"
else
	printf "foreground='#00FF00'"
fi
printf ">"

if [ $status = "Discharging," ];
then
	printf "↓"
else
	printf "↑"
fi

printf "$level%%</span>"
