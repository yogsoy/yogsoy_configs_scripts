printf "$(sensors | grep 'Package' | awk '{print $4}')"
