# mein bash aliases
# your mum's pretty gay to be honest

alias a=alias
a ns=notify-send
a apti="sudo apt install"
# send to clipboard
a cb="xclip -i -selection clipboard"
a rf="rm -rf"
# reload
a rl="exec $0"
a cht=cht.sh
# line count
a lc="wc -l"
# character count
a cc="wc -m"
a cl=clear
a ch="google-chrome 1>/dev/null 2>/dev/null"
a am="ch --app=https://messages.google.com/web"
# clear empty lines
a cel="grep -v ^[[:space:]]*$"
a es="espeak -s 250 -v en"
a dc=discord-canary
a chi="ch --incognito"
a debi="sudo dpkg -i"
# local ip
a lip="hostname -I"
a bc="bc -q"
a st=speedtest-cli
a apts="apt search"
a ety=etymology
a weather="curl wttr.in 2>/dev/null | sed 7q"
a cp="rsync --progress -s -r -h"
a gelemental="export GTK2_RC_FILES=/usr/share/themes/Industrial/gtk-2.0/gtkrc && gelemental"
a srv="ssh -X elyshea@192.168.1.51"
# format json so it's readable
a json="jq ."
# get file size
a fs="du -sh"
a vpn="sudo openvpn --config /home/elyshea/.vpn/bennisons.ovpn"
a v=vim
a thop=htop
a mkdir="mkdir -p"
# put commas in numbers
a cn="numfmt --g"
# remove colour from output
a rc="sed 's/\x1b\[[0-9;]*m//g'"
#a di="vim dpkg -i"
a cls="cl;ls"
a pls=sudo
a no=vim
a suod=sudo
a p=python
a p3=python3
a cdl="cd;cl"
a iv=sxiv
a pick="dmenu -p '?' -l 5"
a c=cat
a gitgo="git add .; git commit; git push"
a extdisp=~/scripts/extdisp.sh
a sl="sl -e"
a sxiv="sxiv -a"
a sc=sc-im
a chx="chmod +x"
a :q="exit"
a g=egrep
a gitc="git clone"
a sr="du -a ~/.config/* ~/scripts/* ~/Documents/testing/code/* | awk '{print \$2}' | fzf | xargs -ro $EDITOR"
a xc="tput reset"
a cdls="cd;cl;ls"
