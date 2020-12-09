case $BLOCK_BUTTON in
	1) notify-send "Date" "$(cal | sed "s/\<`date +%d`\>/<b>█<\/b>/")";;
esac

DELIM=" "

# timezone names come from /usr/share/zoneinfo/

printf "$(TZ=":America/Los_Angeles" date +"%R")<span foreground='grey'>-8</span>"
printf "$DELIM"
printf "$(TZ=":UTC" date +"%R")<span foreground='grey'>+0</span>"
printf "$DELIM"
printf "$(TZ=":Africa/Johannesburg" date +"%R")<span foreground='grey'>+2</span>"

printf "\n"
