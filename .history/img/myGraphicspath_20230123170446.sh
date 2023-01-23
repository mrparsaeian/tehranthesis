#!/bin/bash
PATH="./img/Task*"
echo > ./myTaskImages.tex
echo \\newcommand{  >> ./myTaskImages.tex
    echo \TaskImages  >> ./myTaskImages.tex
echo \}\[0\]\{  >> ./myTaskImages.tex
	echo \\eqref\{tab:CompareDarkTriadStatisticsCustomTable\}  >> ./myTaskImages.tex
echo \}  >> ./myTaskImages.tex
echo \\newcommand\{ >> ./myTaskImages.tex
echo    \TaskImagesCommand >> ./myTaskImages.tex
echo \}\[0\]\{  >> ./myTaskImages.tex
for i in $PATH; do
    echo -n \{$i/\} >> ./myTaskImages.tex
    echo \\begin\{figure\}\[htpb\]  >> ./myTaskImages.tex
    echo    \centering ]  >> ./myTaskImages.tex
    echo    \\includegraphics\[width=0.8\\textwidth\]\{./img/Task1.png\} >> ./myTaskImages.tex
    echo    \\caption\{\صفحه ۱} >> ./myTaskImages.tex
    echo    \\label\{fig:Task1\} >> ./myTaskImages.tex
    echo \\end\{figure\} >> ./myTaskImages.tex
done    
echo \}  >> ./myTaskImages.tex
echo " "  >> ./myTaskImages.tex