USED_MEM=$(free -h --si | sed '2q;d' | awk '{print $3}')
#TOTAL_MEM=$(free -h --si | sed '2q;d' | awk '{print $2}')

#echo "$USED_MEM/$TOTAL_MEM"
echo "${USED_MEM}B"
