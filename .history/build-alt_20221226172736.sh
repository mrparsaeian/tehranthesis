#!/bin/bash
if [ -z "$SCRIPT" ]
then 
    /usr/bin/script build.log /bin/bash -c "$0 $*"
    exit 0
fi
cd /home/master/pj/gitprojects/thesis/latex/tehran-thesis-master/
#source ./venv/bin/activate
#cd jinja2/ && jupyter nbconvert --execute ./doItFinal.ipynb --to html 
#cd ..
#deactivate
cd /home/master/pj/gitprojects/thesis/latex/tehran-thesis-master/
# Alternative commands to build final PDF:
#xelatex -synctex=1 -interaction=nonstopmode main
xelatex -synctex=1 main
#bibtex8 -W  main
bibtex8 -W -c cp1256fa main
xindy -L persian -C utf8 -I xindy -M main.xdy -t main.glg -o main.gls main.glo
xindy -L persian -C utf8 -I xindy -M main.xdy -t main.blg -o main.bls main.blo
#xindy -L persian-variant1 -C utf8 -I xindy -M main.xdy -t main.glg -o main.gls main.glo
#xindy -L persian-variant1 -C utf8 -I xindy -M main.xdy -t main.blg -o main.bls main.blo
xindy -L english -C utf8 -I xindy -M main.xdy -t main.alg -o main.acr main.acn
xelatex -synctex=1 -interaction=nonstopmode main
xelatex -synctex=1 -interaction=nonstopmode main
