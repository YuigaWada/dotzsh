#!/usr/bin/env sh
cur_layout="$(yabai -m query --spaces --space | jq -r '.type')"
RCPATH="$HOME/.zsh/configs"

if [ "$cur_layout" = "bsp" ]; then
    rm -rf $RCPATH/.yabairc
    ln -s  $RCPATH/.yabairc_stack  $RCPATH/.yabairc
else
    rm -rf $RCPATH/.yabairc
    ln -s  $RCPATH/.yabairc_bsp  $RCPATH/.yabairc
fi

source $RCPATH/.yabairc
