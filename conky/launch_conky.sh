#!/bin/env sh

pkill conky

sleep 1;

conky -c $HOME/.config/conky/conky.conf

sleep 1;

conky -c $HOME/.config/conky/conkyp2.conf
