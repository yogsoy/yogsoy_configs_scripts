# first argument is the tar.gz file to output to, second is the input (usually a folder but it could be a file i suppose? doesnt support multiple files because fuck you)

function targz () {
	tar cf - "$2" -P | pv -s $(du -sb "$2" | awk '{print $1}') | gzip > $1

}
