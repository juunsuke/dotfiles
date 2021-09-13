xset -dpms
xset s 0
xset r rate 200 50
xset m 0 0

xrandr --output HDMI-A-0 --mode 1920x1080 --rate 120

xrdb -merge .Xresources

nitrogen --restore

alttab -w 1 &

solaar -w hide &

pulseaudio -D

#nm-applet &


i3

