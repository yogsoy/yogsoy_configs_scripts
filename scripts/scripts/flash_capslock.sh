
LED_PATH="/sys/class/leds/`ls /sys/class/leds | grep -om1 'input.*::capslock'`/brightness"
for i in {1..10}
do
	echo $(expr $i % 2) > $LED_PATH
	sleep 0.05
done
