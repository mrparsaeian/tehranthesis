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
    echo -n \{$i/\} >> ./myTaskImages.tex
    echo -n \\begin\{figure\}\[htpb\]  >> ./myTaskImages.tex
    echo -n   \centering ]  >> ./myTaskImages.tex
    echo -n  \\includegraphics\[width=0.8\\textwidth\]\{./img/Task1.png\} >> ./myTaskImages.tex
    echo -n   \\caption\{\صفحه ۱} >> ./myTaskImages.tex
    echo -n   \\label\{fig:Task1\} >> ./myTaskImages.tex
    echo -n \\end\{figure\} >> ./myTaskImages.tex
    echo -n " "  >> ./myTaskImages.tex
    echo -n" "  >> ./myTaskImages.tex
done    
echo -n \}  >> ./myTaskImages.tex
