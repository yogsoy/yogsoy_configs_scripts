case $BLOCK_BUTTON in
	1) pamixer --allow-boost -t;;
	3) pamixer --set-volume 0;;
	4) pamixer --allow-boost -i 5;;
	5) pamixer --allow-boost -d 5;;
esac


if [ "`pamixer --get-mute`" != "true" ]; then
	echo "`pamixer --get-volume`%"
else
	echo "--%"
fi
