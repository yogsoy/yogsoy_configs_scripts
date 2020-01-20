artist=$(playerctl -a metadata artist)
title=$(playerctl -a metadata title)

ARTIST_MAXLENGTH=25
TITLE_W_ARTIST_MAXLENGTH=30
TITLE_NO_ARTIST_MAXLENGTH=55

# this may look super inefficient, but it matches any whitespace string: e.g. "  ", "", "     "
if [ ! $(echo $artist | egrep -q '^\s*$') ]
then
	# if the artist length is over $ARTIST_MAXLENGTH cut it down and add some ellipses
	if [ ${#artist} -gt $ARTIST_MAXLENGTH ]
	then
		artist=$(echo $artist | head -c $ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')
	fi

	# formatting - add bold to the artist, and if a title exists (same match as before), insert the " - "
	artist="<b>$artist</b>$([ ! $(echo $title | egrep -q '^\s*$') ] && printf ' - ')"

	# if title length is over $TITLE_W_ARTIST_MAXLENGTH cut it down the same
	[ ${#title} -gt $TITLE_W_ARTIST_MAXLENGTH ] && title="$(echo $title | head -c $TITLE_W_ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')"

else
	#title="this is a very long title which is over 45 characters but possibly less than 100"
	# if title length is over $TITLE_NO_ARTIST_MAXLENGTH cut it down - if there's no artist taking up space it can be longer
	[ ${#title} -gt $TITLE_NO_ARTIST_MAXLENGTH ] && title="$(echo $title | head -c $TITLE_NO_ARTIST_MAXLENGTH | iconv -c | sed 's/\s*$/…/')"

fi

echo "$artist$title"
