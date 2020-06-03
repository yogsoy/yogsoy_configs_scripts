function untargz () {
	if [ -n "$2" ]; then
		if [ ! -d "$2" ]; then
			echo "Creating directory $2"
			mkdir "$2"
		fi
		FILE_FOR_OUTPUT="$2"
	else
		FILE_FOR_OUTPUT="$(echo "$1" | sed 's/\.gz$//;s/\.tar$//')"
	fi

	pv "$1" | tar xz -C "$FILE_FOR_OUTPUT"
}
