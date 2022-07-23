#/bin/sh
~/.fehbg &
polybar
xbindkeys
rm ~/.Xauthority
tee /proc/acpi/bbswitch <<< OFF
sudo thermald
sudo bumblebeed
xset r rate 150 50
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec i3 &>> "/var/log/i3.log"
