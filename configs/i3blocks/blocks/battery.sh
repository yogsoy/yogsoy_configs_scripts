MED_BATTERY=60
MED_LOW_BATTERY=40
LOW_BATTERY=20

level=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

printf "<span "

leveltest=$(echo $level | sed 's/\..//')
if [ $leveltest -le $LOW_BATTERY ]; then
	printf "foreground='#FF0000' weight='bold'"
elif [ $leveltest -le $MED_LOW_BATTERY ]; then
	printf "foreground='#FFA500'"
elif [ $leveltest -le $MED_BATTERY ]; then
	printf "foreground='#FFFF00'"
else
	printf "foreground='#00FF00'"
fi
printf ">"

if [ $status = "Discharging" ];
then
	printf "↓"
else
	printf "↑"
fi

printf "$level%%</span>\n"
