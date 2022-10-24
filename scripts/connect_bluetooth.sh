#!/bin/sh

connect(){
	if [ $# -eq 0 ]; then
		1=$(bluetoothList | cut -d " " -f 3- | dmenu)
	fi
	bluetoothctl devices | grep -i "$1" | awk '{print $2}' | xargs bluetoothctl connect
}

disconnect(){
	if [ $# -eq 0 ]; then
		1=$(bluetoothList | cut -d " " -f 3- | dmenu)
	fi
	bluetoothctl devices | grep -i $1 | awk '{print $2}' | xargs bluetoothctl disconnect
}


bluetoothList(){
	bluetoothctl devices | grep -i "$1"
}




# bluetest(){
# 	if [ $# -eq 0 ]; then
# 		1=$(bluetoothList | cut -d " " -f 3- | dmenu)
# 		echo "$1"
# 	else
# 		echo "$1"
# 	fi
# }
