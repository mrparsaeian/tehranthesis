#!/bin/bash
gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh > ./build.log &
# GNOME_TERMINAL_SCREEN="" gnome-terminal --window-with-profile=LatexBuild -- ./build-alt.sh 