#!/usr/bin/bash
SCRIPT_FOLDER="/home/blueweabo/dotfiles/scripts/"
WALLPAPER_FOLDER="/home/blueweabo/dotfiles/wallpapers"

currwpFile=$SCRIPT_FOLDER"currwp"
oldwp=$(cat $currwpFile)

wallpapers="$(ls $WALLPAPER_FOLDER)"

count="$(ls -q $WALLPAPER_FOLDER | wc -l)"

wpindex=$(echo $((1+$RANDOM%$count)))

awkarg='{print$'
awkarg+="$wpindex"
awkarg+='}'
wp=$WALLPAPER_FOLDER
wp+="/"
wp+=$(echo $wallpapers | awk $awkarg)
wpname=$(echo $wallpapers | awk $awkarg)

wpimg=$SCRIPT_FOLDER$wpname

magick -size 1920x1080 xc:skyblue $wpimg
magick composite -resize 1920x1080 -gravity east \
    -compose copy $wp $wpimg $wpimg
magick composite -resize 1920x1080 -blur 100x10 -gravity west \
    -compose copy $wp $wpimg $wpimg
magick composite -resize 1920x1080 -gravity center \
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
