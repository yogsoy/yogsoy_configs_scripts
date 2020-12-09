COMMANDS="Play
Pause
Stop
Start MPD
Restart MPD
Kill MPD"
selection=$(echo "$COMMANDS" | dmenu -p 'Control MPD:')

case $selection in
	Resume/Play)
		mpc play
		message="MPD Resumed."
		;;
	Pause)
		mpc pause
		message="MPD Paused."
		;;
	Stop)
		mpc stop
		message="MPD Stopped."
		;;
	"Start MPD")
		mpd
		mpd-mpris 1>/dev/null 2>/dev/null &
		message="MPD Started."
		;;
	"Restart MPD")
		pkill mpd && mpd
		mpd-mpris 1>/dev/null 2>/dev/null &
		message="MPD Restarted."
		;;
	"Kill MPD")
		pkill mpd
		pkill mpd-mpris
		message="MPD Killed."
esac

notify-send "$message"
