#!/usr/bin/env bash
source "$HOME/polybar-scripts/rofi-widgets/wrapper/rofi-effects.sh"

paramFile="$HOME/polybar-scripts/rofi-widgets/parameters.json"

# Custom Pipe
PIPE=$(mktemp -u) # This creates a temp file (name only)
mkfifo "$PIPE"    # This makes the pipe (creates the file)
exec 3<>"$PIPE"   # This attaches the pipe to descriptor 3
rm $PIPE          # This removes the file

function rofi_load_vars(){
	width=$(cat "$paramFile" | jq -r ."$1".width)
	lines=$(cat "$paramFile" | jq -r ."$1".lines)
	columns=$(cat "$paramFile" | jq -r ."$1".columns)
	location=$(cat "$paramFile" | jq -r ."$1".location)
	prompt=$(cat "$paramFile" | jq -r ."$1".prompt)
	format=$(cat "$paramFile" | jq -r ."$1".format)
	cmd=$(cat "$paramFile" | jq -r ."$1".cmd)
	config=$(cat "$paramFile" | jq  -r ."$1".config)
}

function rofi_dmenu(){
      rofi -config "${config}" -width "$width" -lines "$lines" -columns "$columns" \
      -location "$location" -dmenu -format "$format" -p "$prompt" \
      <<< $(eval "$cmd") \
      >&3
}

function rofi_dmenu_read(){
	wait $1
	read -t 1 choice <&3
}

function rofi_drun(){
	rofi -show drun &
	rofi_window_show
}
