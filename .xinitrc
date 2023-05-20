xset -dpms
xset s 0
xset r rate 200 50
xset m 0 0

xinput set-prop "DELL0B5B:00 04F3:3234 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "DELL0B5B:00 04F3:3234 Touchpad" "libinput Natural Scrolling Enabled" 1

.config/mode1.sh

xrdb -merge .Xresources

alttab -w 1 &

solaar -w hide &

pulseaudio -D

picom -b

nm-applet &

/opt/piavpn/bin/pia-client &


i3

