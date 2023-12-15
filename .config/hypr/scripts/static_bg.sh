bg="/home/tysufa/backgrounds/static_bg"

img_list=("$bg/bg.jpg" "$bg/katanazero.png" "$bg/bg2.jpg" "$bg/bg3.jpg" "$bg/bg4.jpg" "$bg/bg5.png")
img_list_size=6

rand=$((RANDOM%img_list_size))
swww img ${img_list[rand]} --transition-type wipe --transition-duration 2

if [ -z "$1" ]; then
    rand=$((RANDOM%img_list_size))
    swww img ${img_list[rand]} --transition-type wipe --transition-duration 2
else
    swww img ${img_list[$1]} --transition-type wipe --transition-duration 2
fi

