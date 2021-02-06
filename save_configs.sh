#!/bin/sh

DEFAULT_POLYBAR=~/.config/polybar/config
DEFAULT_I3=~/.config/i3/config
DEFAULT_COMPTON=~/.config/i3/compton.conf

DEFAULT_SCREENLAYOUTS=~/.screenlayout/

# update configs
cp $DEFAULT_I3 ./i3.conf
cp $DEFAULT_POLYBAR ./polybar.conf
cp $DEFAULT_COMPTON ./compton.conf

# update screen layouts
cp -r $DEFAULT_SCREENLAYOUTS ./
