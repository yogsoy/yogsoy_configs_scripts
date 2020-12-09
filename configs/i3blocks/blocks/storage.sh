case $BLOCK_BUTTON in
	1) notify-send "Filesystems:
target,size,used,free,percent
$(df -H -x 'tmpfs' --output='target,size,used,avail,pcent' | tail -n+2 | sort)";;
	2) baobab ~;;
esac

df -H --output='pcent' /home | tail -1 | numfmt -d '%'
