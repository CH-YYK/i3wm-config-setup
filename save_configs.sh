#!/bin/sh

DEFAULT_POLYBAR_PATH=~/.config/polybar/
DEFAULT_I3_PATH=~/.config/i3/
DEFAULT_CONKY_PATH=~/.config/conky/
DEFAULT_SCREENLAYOUTS=~/.screenlayout/

# update configs
cp $DEFAULT_I3_PATH/config ./i3/   # i3 config
cp $DEFAULT_I3_PATH/compton.conf ./i3/  # compton.conf

cp $DEFAULT_POLYBAR_PATH/config ./polybar/  # polybar config
cp $DEFAULT_POLYBAR_PATH/i3wmthemer_bar_launch.sh ./polybar/  # polybar launcher

cp $DEFAULT_CONKY_PATH/conky*conf ./conky/  # conky configures
cp $DEFAULT_CONKY_PATH/launch_conky.sh ./conky/  # conky launcher


# update screen layouts
cp -r $DEFAULT_SCREENLAYOUTS ./
