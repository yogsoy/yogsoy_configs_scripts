echo "$(sensors | grep 'Package' | awk '{print $4}')"
