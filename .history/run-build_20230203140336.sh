#!/bin/bash
# gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh
gnome-terminal --window-with-profile=LatexBuild --title=LatexXXX  -- ./build-alt.sh top >/dev/null 2>&1&; sleep 0.1; xdotool windowminimize $(xdotool search --name LatexXXX|head -1
# gnome-terminal -- ./build-alt.sh > ./build.log 
# GNOME_TERMINAL_SCREEN="" gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh 