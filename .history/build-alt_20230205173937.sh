#!/bin/bash
# if [ -z "$SCRIPT" ]
# then 
#     /usr/bin/script ./build.log /bin/bash -c "$0 $*"
#     exit 0
# fi
# cd /home/master/pj/gitprojects/thesis/latex/tehran-thesis-master/
#source ./venv/bin/activate
#cd jinja2/ && jupyter nbconvert --execute ./doItFinal.ipynb --to html 
#cd ..
#deactivate
# cd /home/master/pj/gitprojects/thesis/latex/tehran-thesis-master/
# Alternative commands to build final PDF:
ls main.* | grep -xv "main.tex" | xargs rm
#xelatex -synctex=1 -interaction=nonstopmode main
xelatex -synctex=1 main | tee ./build.log
#bibtex8 -W  main | tee ./build.log
bibtex8 -W -c cp1256fa main | tee ./build.log
xindy -L persian -C utf8 -I xindy -M main.xdy -t main.glg -o main.gls main.glo | tee ./build.log
xindy -L persian -C utf8 -I xindy -M main.xdy -t main.blg -o main.bls main.blo | tee ./build.log
#xindy -L persian-variant1 -C utf8 -I xindy -M main.xdy -t main.glg -o main.gls main.glo | tee ./build.log
#xindy -L persian-variant1 -C utf8 -I xindy -M main.xdy -t main.blg -o main.bls main.blo | tee ./build.log
xindy -L english -C utf8 -I xindy -M main.xdy -t main.alg -o main.acr main.acn | tee ./build.log
# xelatex -synctex=1 -interaction=nonstopmode main | tee ./build.log
# xelatex -synctex=1 -interaction=nonstopmode main | tee ./build.log
xelatex -synctex=1 main | tee ./build.log
xelatex -synctex=1 main | tee ./build.log
#
# xwininfo -display :1
# WindowID=$(xwininfo -name "My Thesis - main.pdf — Mozilla Firefox" | grep "Window id" | awk '{print $4}') && echo "$WindowID" && xdotool key --window "$WindowID" F5
WindowID=$(xwininfo -display :0 -root -all | grep Investigation | grep "\(\"Navigator\" \"firefox\"\)" | awk '{print $1}') && echo "$WindowID" 
xdotool key --window "$WindowID" F5
