# yeah this whole script only *really* works if there's only one thing playing but
# that's what we in the business call an "edge case", which i don't care about.


# note:
# I've replaced every occurrence of `head -c` in this script with `grep -oE "^.{x}"`,
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

# get the name of the player that is currently "Playing"
players=`playerctl -a metadata --format '{{status}} {{playerName}}'`
active_player=$(echo "$players" | grep '^Playing' | cut -d' ' -f2- | head -1)
# if there is a player "Playing"
if [ $(echo $active_player | wc -w) -gt 0 ]; then
	playing="-p $active_player"
# if there are any players not "Playing" to show
elif [ $(echo $players | wc -w) -gt 0 ]; then
	playing="-p $(playerctl -a metadata --format '{{playerName}}' | head -1)"
# if there are no players available (otherwise wouldn't output anything anyway but thats bad code that's designed to fail)
else
	playing=""
fi

status=$(playerctl $playing status)
artist=$(playerctl $playing metadata artist)
title=$(playerctl $playing metadata title)
length_us=$(playerctl $playing metadata mpris:length)

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
		artist=$(echo $artist | grep -oE "^.{$ARTIST_MAXLENGTH}" | iconv -c | sed 's/\s*$/…/')
	fi

	# formatting - add bold to the artist, and if a title exists (same match as before), insert the " - "
	artist="<b>$artist</b>$([ ! $(echo $title | egrep -q '^\s*$') ] && printf ' - ')"

	# if title length is over $TITLE_W_ARTIST_MAXLENGTH cut it down the same
	[ ${#title} -gt $TITLE_W_ARTIST_MAXLENGTH ] && title="$(echo $title | grep -oE "^.{$TITLE_W_ARTIST_MAXLENGTH}" | iconv -c | sed 's/\s*$/…/')"

else
	#title="this is a very long title which is over 45 characters but possibly less than 100"
	# if title length is over $TITLE_NO_ARTIST_MAXLENGTH cut it down - if there's no artist taking up space it can be longer
	[ ${#title} -gt $TITLE_NO_ARTIST_MAXLENGTH ] && title="$(echo $title | grep -oE "^.{$TITLE_NO_ARTIST_MAXLENGTH}" | iconv -c | sed 's/\s*$/…/')"

fi

# the "us" is for microseconds, as for *some fucking reason*, mpris spec says that the length of things should be in microseconds.
# had to do a bunch of fucked up shit because of that damnit
# (that's a lie, i would have had to do almost the same thing had it been milliseconds)
if [ "$length_us" != "" ]
then
	# hey julian, what if a track is over an hour long? fuck you, thats what. just don't listen to audio thats over an hour long if you're so worried
	# cursed_maths
	length_mins=`echo "($length_us / 1000000)/60" | bc | numfmt --round=down --format="%02f"`
	# cursed_awk
	# turns out numfmt doesnt round with just the --round={} option, that just sets how the rounding works when using --to={}
	# this became an issue when i switched to mpd-mpris as it provides track length in down to hundredths of a second (how good of him)
	# anyway works now:
	length_secs=`echo '' | awk "{print (($length_us / 1000000)/60 % 1)*60}" | numfmt --round=down --to=si --format="%02f"`
	length=" <b>[$length_mins:$length_secs]</b>"
fi

echo "$status$artist$title$length"
