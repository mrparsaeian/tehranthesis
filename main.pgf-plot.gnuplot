set table "main.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 25; set dummy x; plot [x=-5:5] \pythonvar@coeffA *x**2 + \pythonvar@coeffB *x;
