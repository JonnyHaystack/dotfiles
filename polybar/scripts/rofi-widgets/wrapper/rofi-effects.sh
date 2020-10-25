#!/usr/bin/env bash

# Global variables
winId=""
findTimeOut=0.5
polybarHeight=32
maxOpacity="-x 2 2"

# Find an open rofi window
rofi_window_find(){
	timeout $findTimeOut sh -c "while ! xdotool search --classname "rofi"; do :; done" >&3
	read -t $findTimeOut winId <&3

	if [ "$winId" ]; then
		xdotool windowmap --sync $winId # Waits for mapping before setting the opacity
		return 0;
	else
		return 1;
	fi
}

# Show the window (opacity from 0 (default on compton) to 1)
rofi_window_show(){
	# Get Window Id
	rofi_window_find

	# Make the Window Visible
	transset -i $winId $maxOpacity
}

# Show the window (opacity from 0 (default on compton) to 1) and move it to position
rofi_window_pop(){
	# Get Window Id
	rofi_window_find

	# Get Window Height
	winHeight=$(xwininfo -id $winId | awk '/Height:/ {print $2}') 
	displacement=$(( $winHeight + $polybarHeight - 1))
	remainder=$(( $displacement % $animationSpeed ))
	displacement=$(( $displacement - $remainder ))

	# Pop the window to view
	case "$1" in
		'+')
			xdotool windowmove --relative "$winId" 0 "$(($winHeight - 1))"
			transset -i  $winId $maxOpacity
			for ((i=$animationSpeed; i<=$displacement; i+=$animationSpeed)); do
				xdotool windowmove --relative "$winId" 0 -$animationSpeed
				sleep 0.01
			done
			xdotool windowmove --relative "$winId" 0 -$remainder
			;;
		'-')
			xdotool windowmove --relative "$winId" 0 -"$(($winHeight - 1))"
			transset -i  $winId $maxOpacity
			for ((i=$animationSpeed; i<=$displacement; i+=$animationSpeed)); do
				xdotool windowmove --relative "$winId" 0 $animationSpeed
				sleep 0.01
			done
			xdotool windowmove --relative "$winId" 0 $remainder
			;;
	esac
}
