#!/usr/bin/bash

wallpaper=$(cat /home/blueweabo/dotfiles/scripts/currwp);

hyprctl dispatch exec hyprpaper;
hyprctl hyprpaper preload $wallpaper;
hyprctl hyprpaper wallpaper ,$wallpaper;
