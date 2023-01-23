#!/bin/bash
PATH="./img/Task*"
echo > ./myTaskImages.tex
echo -n \\newcommand{  >> ./myTaskImages.tex
    echo \TaskImages  >> ./myTaskImages.tex
echo -n \}\[0\]\{  >> ./myTaskImages.tex
	echo -n \\eqref\{tab:CompareDarkTriadStatisticsCustomTable\}  >> ./myTaskImages.tex
echo -n \}  >> ./myTaskImages.tex
echo -n \\newcommand\{ >> ./myTaskImages.tex
echo -n   \\TaskImagesCommand >> ./myTaskImages.tex
echo -n \}\[0\]\{  >> ./myTaskImages.tex
for i in $PATH; do
    echo  \{$i/\} >> ./myTaskImages.tex
    echo  \\begin\{figure\}\[htpb\]  >> ./myTaskImages.tex
    echo    \centering ]  >> ./myTaskImages.tex
    echo   \\includegraphics\[width=0.8\\textwidth\]\{./img/Task1.png\} >> ./myTaskImages.tex
    echo    \\caption\{\صفحه ۱} >> ./myTaskImages.tex
    echo    \\label\{fig:Task1\} >> ./myTaskImages.tex
    echo  \\end\{figure\} >> ./myTaskImages.tex
    echo  " "  >> ./myTaskImages.tex
    echo " "  >> ./myTaskImages.tex
done    
echo -n \}  >> ./myTaskImages.tex
