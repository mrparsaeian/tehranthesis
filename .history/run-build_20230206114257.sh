#!/bin/bash
# gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh
gnome-terminal --window-with-profile=LatexBuild --title=LatexXXX  -- ./build-alt.sh top > /dev/null 2>&1& 
sleep 0.5
xdotool windowminimize $(xdotool search --name "LatexXXX" | head -1)
# move_windows.sh "LatexXXX" "B173HAN04.9 LCD Monitor"
# move_windows.sh "LatexXXX" "Laptop Screen"
./move_windows.sh "LatexXXX" "DP-2"
# $ (gnome-terminal --window-with-profile=Background --title=xxx  --command top >/dev/null 2>&1&); sleep 0.1; xdotool windowminimize $(xdotool search --name xxx|head -1)
# gnome-terminal -- ./build-alt.sh > ./build.log 
# GNOME_TERMINAL_SCREEN="" gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh 