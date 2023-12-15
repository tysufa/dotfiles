bg1="/home/tysufa/HyprV4/HyprV/backgrounds"
bg2="/home/tysufa/Téléchargements"
bg3="/home/tysufa/backgrounds"

img_list=("$bg3/bg.jpg" "$bg3/bg2.gif" "$bg3/bg3.gif" "$bg3/bg4.gif" 
    "$bg3/bg5.gif" "$bg3/bg6.gif" "$bg3/bg7.gif" "$bg3/bg8" "$bg3/static_bg/katanazero.png"
)
if [ -z "$1" ]; then
    rand=$((RANDOM%9))
    # swww init
    swww img ${img_list[rand]} -t none # --transition-type wipe --transition-duration 2
else
    # swww init
    swww img ${img_list[$1]} -t none # --transition-type wipe --transition-duration 2
fi

