TEMP_FILE='/tmp/selection_qr.png'

# get whatever is currently selected, encode it as a qr code in $TEMP_FILE with dot size of 20
xclip -o | qrencode -s 20 -o $TEMP_FILE

# open the qr code file with an sxiv window named 'selection_qr', starting in fullscreen and not showing the status bar, fitting the image to the window
sxiv -N selection_qr -b -f -s f $TEMP_FILE
