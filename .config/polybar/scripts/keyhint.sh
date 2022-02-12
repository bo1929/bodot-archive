#!/bin/sh
yad --title="EndeavourOS bspwm keybindings:"\
	--no-buttons\
	--geometry=400x345-15-400\
	--list\
	--column=key:\
	--column=description:\
	--column=command:\
	"ESC" "close this app" ""\
	"ctrl+alt+t" "open a terminal"	""\
	"ctrl+alt+w" "open Browser" ""\
	"+d" "app menu" "(rofi)"\
	"+q" "close focused app"\
	"(kill)" "Print" "screenshot" "(scrot)"\
	"+Shift+e" "logout menu" "(rofi)"\
	"+F1" "open keybinding helper" "full list"\
	"+Alt+r" "reload bspwm" "bpsc restart"\
	"+ESC"	"reload sxhkd" "pkill -USR1 -x sxhkd"
  
