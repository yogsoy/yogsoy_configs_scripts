DEVICE_COUNT=$(bluetoothctl info | egrep '^Device' | wc -l)
