amixer | grep -A 4 Master | sed '5q;d' | cut -d '[' -f2 | sed 's/] //g'
