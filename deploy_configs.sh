#!/bin/sh

TARGET_POLYBAR_PATH=~/.config/polybar/
TARGET_I3_PATH=~/.config/i3/
TARGET_CONKY_PATH=~/.config/conky/
TARGET_SCREENLAYOUTS=~/.screenlayout/

# deploy configs to local
cp -r ./polybar/* $TARGET_POLYBAR_PATH/
cp -r ./i3/* $TARGET_I3_PATH/
cp -r ./conky/* $TARGET_CONKY_PATH/
cp -r ./.screenlayout/* $TARGET_SCREENLAYOUTS/

cp -r ./dotspacemacs $HOME/
cp ./.spacemacs $HOME/

