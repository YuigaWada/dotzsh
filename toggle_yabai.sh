#!/usr/bin/env sh
cur_layout="$(yabai -m query --spaces --space | jq -r '.type')"

if [ "$cur_layout" = "bsp" ]; then
    rm -rf ~/.zsh/.yabairc
    ln -s  ~/.zsh/.yabairc_stack  ~/.zsh/.yabairc
else
    rm -rf ~/.zsh/.yabairc
    ln -s  ~/.zsh/.yabairc_bsp  ~/.zsh/.yabairc
fi

source ~/.zsh/.yabairc
