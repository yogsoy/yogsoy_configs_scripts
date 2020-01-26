LOW_BATTERY=20

current=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep energy | sed '1q;d' | awk '{print $2}')
full=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep energy | sed '2q;d' | awk '{print $2}')

battery=$(echo "scale=3; $current / $full" | bc)
level=$(echo "scale=0; ($battery * 100) / 1" | bc)

status=$(acpi -b | sed 1q |awk '{print $3}' | tr -d "\n")
colours="#FF0000 #FC0300 #FA0500 #F70800 #F50A00 #F20D00 #F00F00 #ED1200 #EB1400 #E81700 #E61A00 #E31C00 #E01F00 #DE2100 #DB2400 #D92600 #D62900 #D42B00 #D12E00 #CF3000 #CC3300 #C93600 #C73800 #C43B00 #C23D00 #BF4000 #BD4200 #BA4500 #B84700 #B54A00 #B34D00 #B04F00 #AD5200 #AB5400 #A85700 #A65900 #A35C00 #A15E00 #9E6100 #9C6300 #996600 #966900 #946B00 #916E00 #8F7000 #8C7300 #8A7500 #877800 #857A00 #827D00 #808000 #7D8200 #7A8500 #788700 #758A00 #738C00 #708F00 #6E9100 #6B9400 #699600 #669900 #639C00 #619E00 #5EA100 #5CA300 #59A600 #57A800 #54AB00 #52AD00 #4FB000 #4CB300 #4AB500 #47B800 #45BA00 #42BD00 #40BF00 #3DC200 #3BC400 #38C700 #36C900 #33CC00 #30CF00 #2ED100 #2BD400 #29D600 #26D900 #24DB00 #21DE00 #1FE000 #1CE300 #1AE600 #17E800 #14EB00 #12ED00 #0FF000 #0DF200 #0AF500 #08F700 #05FA00 #03FC00 #00FF00"

printf "<span foreground='"

printf "$(echo $colours | tr ' ' '\n' | sed "$level q;d")'"

if [ $level -lt $LOW_BATTERY ];
then
	printf " weight='bold'"
fi
printf ">"

if [ $status = "Discharging," ];
then
	printf "↓"
else
	printf "↑"
fi

printf "$(echo "scale=1; $battery * 100" | bc | sed 's/\.*0*$//g')%%</span>"
