#!/bin/sh

DEFAULT_POLYBAR_PATH=$HOME/.config/polybar/
DEFAULT_I3_PATH=$HOME/.config/i3/
DEFAULT_CONKY_PATH=$HOME/.config/conky/

# update configs
cp $DEFAULT_I3_PATH/config ./i3/   # i3 config
cp $DEFAULT_I3_PATH/compton.conf ./i3/  # compton.conf

cp $DEFAULT_POLYBAR_PATH/config ./polybar/  # polybar config
cp $DEFAULT_POLYBAR_PATH/i3wmthemer_bar_launch.sh ./polybar/  # polybar launcher

cp $DEFAULT_CONKY_PATH/conky*conf ./conky/  # conky configures
cp $DEFAULT_CONKY_PATH/launch_conky.sh ./conky/  # conky launcher

cp $HOME/.spacemacs ./.spacemacs # update .spacemacs configurations
cp -r $HOME/dotspacemacs/* ./dotspacemacs/  # update .spacemacs exteranl configurations

