#!/bin/bash
PATH="./img/Task*"
echo > ./myTaskImages.tex
echo  \\newcommand{  >> ./myTaskImages.tex
    echo \TaskImages  >> ./myTaskImages.tex
echo  \}\[0\]\{  >> ./myTaskImages.tex
	echo  \\eqref\{tab:CompareDarkTriadStatisticsCustomTable\}  >> ./myTaskImages.tex
echo  \}  >> ./myTaskImages.tex
echo  \\newcommand\{ >> ./myTaskImages.tex
echo    \\TaskImagesCommand >> ./myTaskImages.tex
echo  \}\[0\]\{  >> ./myTaskImages.tex
let "j=1"
for i in $PATH; do
    echo  " % ^ %%%% ">> ./myTaskImages.tex
    echo  \\begin\{figure\}\[htpb\]  >> ./myTaskImages.tex
    echo    \\centering   >> ./myTaskImages.tex
    echo   \\includegraphics\[width=0.8\\textwidth\]\{$i/\} >> ./myTaskImages.tex
    echo    \\caption\{ صفحه $j آزمایش \} >> ./myTaskImages.tex
    echo    \\label\{fig:Task$j\} >> ./myTaskImages.tex
    echo  \\end\{figure\} >> ./myTaskImages.tex
    echo  " "  >> ./myTaskImages.tex
    echo " "  >> ./myTaskImages.tex
    ((j=j+1))
done    
echo \}  >> ./myTaskImages.tex



# \begin{figure}[htpb]
#     \centering
#     \includegraphics[width=0.8\textwidth]{./img/sexualityAndSVOAgainstPopulation.pdf}
#     \caption{فراوانی دسته‌های رویکرد ارزش اجتمعای با توجه به جنسیت}
#     \label{fig:sexualityAndSVOAgainstPopulation}
# \end{figure}
