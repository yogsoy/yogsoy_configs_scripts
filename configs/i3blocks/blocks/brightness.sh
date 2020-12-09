case $BLOCK_BUTTON in
	4) xbacklight -inc 5 -time 0;;
	5) xbacklight -dec 5 -time 0;;
esac

echo "$(xbacklight | cut -f1 -d'.')%"
