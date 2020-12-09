case $BLOCK_BUTTON in
	1) ~/scripts/go.sh;;
esac

free -h --si | sed '2q;d' | awk '{print $3}'
