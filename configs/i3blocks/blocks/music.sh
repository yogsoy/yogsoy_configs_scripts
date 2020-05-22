# note:
# I've replaced every occurrence of `head -c` in this script with `colrm`,
# as it deals with multi-byte (extended unicode) characters, e.g. この仮名, properly
# every occurrence of `head` was followed by a pipe through `iconv -c` to
# remove incomplete characters.


case $BLOCK_BUTTON in
	1) playerctl play-pause;;
	2) playerctl next;;
esac

ARTIST_MAXLENGTH=25
TITLE_W_ARTIST_MAXLENGTH=30
TITLE_NO_ARTIST_MAXLENGTH=55

status=$(playerctl status)
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

# check status of player (playing, paused, nothing, etc.)
if [ "$status" = "Playing" ]; then
	# adds a symbol for whether there's something playing or not, then adds a space if there is an artist or title
	status="♫$([ "$artist$title" != "" ] && printf " ")"
else
	status=""
fi

if [ "$artist" != "" ]
then
	# if the artist length is over $ARTIST_MAXLENGTH cut it down and add some ellipses
	if [ ${#artist} -gt $ARTIST_MAXLENGTH ]
	then
		artist=$(echo $artist | colrm $ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')
	fi

	# formatting - add bold to the artist, and if a title exists (same match as before), insert the " - "
	artist="<b>$artist</b>$([ ! $(echo $title | egrep -q '^\s*$') ] && printf ' - ')"

	# if title length is over $TITLE_W_ARTIST_MAXLENGTH cut it down the same
	[ ${#title} -gt $TITLE_W_ARTIST_MAXLENGTH ] && title="$(echo $title | colrm $TITLE_W_ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')"

else
	#title="this is a very long title which is over 45 characters but possibly less than 100"
	# if title length is over $TITLE_NO_ARTIST_MAXLENGTH cut it down - if there's no artist taking up space it can be longer
	[ ${#title} -gt $TITLE_NO_ARTIST_MAXLENGTH ] && title="$(echo $title | colrm $TITLE_NO_ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')"

fi

echo "$status$artist$title"
