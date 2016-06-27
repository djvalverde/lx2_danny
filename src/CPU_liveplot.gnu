#set xrange [0:50]
#set yrange [0:2000]
set grid
set title "CPU Usage"
plot "/home/admin1/lx2_Danny/perf_monitor/CPU_data.dat" using 2 with lines
pause 1 
reread
