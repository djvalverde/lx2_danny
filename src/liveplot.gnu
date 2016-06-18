set xrange [0:20]
set yrange [0:2000]
plot "plot.dat" using 2 with lines
pause 1 
reread
