#!/usr/bin/bash
SCRIPT_FOLDER="/home/blueweabo/dotfiles/scripts/"
WALLPAPER_FOLDER="/home/blueweabo/dotfiles/wallpapers"

currwpFile=$SCRIPT_FOLDER"currwp"
oldwp=$(cat $currwpFile)

wallpapers="$(ls $WALLPAPER_FOLDER)"
option="$(echo $wallpapers |
    sed 's/ /\n/g' |
    wofi --show=dmenu)"
echo $option

wp=$WALLPAPER_FOLDER
wp+="/"
wp+=$option
wpname=$option

wpimg=$SCRIPT_FOLDER$wpname

magick -size 3440x1440 xc:skyblue $wpimg
magick composite -resize 3440x1440 -gravity east \
    -compose copy $wp $wpimg $wpimg
magick composite -resize 3440x1440 -blur 100x10 -gravity west \
    -compose copy $wp $wpimg $wpimg
magick composite -resize 3440x1440 -gravity center \
    -compose copy $wp $wpimg $wpimg
rm /home/blueweabo/dotfiles/scripts/tmp/*

CURRENT_WALLPAPER=$wpimg
cat > $currwpFile << EOF
$wpimg
EOF

hyprctl hyprpaper preload $CURRENT_WALLPAPER
hyprctl hyprpaper wallpaper ,$CURRENT_WALLPAPER
hyprctl hyprpaper unload $oldwp
rm -f $oldwp
