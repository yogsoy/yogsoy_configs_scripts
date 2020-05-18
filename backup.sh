#!/bin/bash
# yes i know bash isn't necessary at all but i might use a bashism at some point and not notice

### Configs

# bash configs (+ history and plugins)
cp -r ~/.bash* ./configs/bash/
# i3 configs
cp -r ~/.config/i3/* ./configs/i3/
# i3blocks configs
cp -r ~/.config/i3blocks/* ./configs/i3blocks/
# x configs
cp -r ~/.Xauthority ~/.xinitrc ~/.xinputrc ~/.Xmodmap ~/.Xresources ~/.xscreensaver ~/.XCompose ./configs/x/
# vim configs (+ plugins)
cp -r ~/.vim* ./configs/vim/
# misc configs
cp -r ~/.bcrc ~/.inputrc ~/.profile ~/.screenrc ~/.selected_editor ~/.config/htop/htoprc ~/.config/screenkey.json ~/.config/termite ./configs/misc/

### Scripts

# cron jobs
cp -r ~/cronjobs/* ./scripts/cronjobs/
# various scripts i've made for hotkeys and such
cp -r ~/scripts/* ./scripts/scripts/
# misc scripts
cp -r ~/.fehbg ./scripts/misc/
