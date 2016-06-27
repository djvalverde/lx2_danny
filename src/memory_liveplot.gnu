set xrange [0:50]
set yrange [0:2000]
set grid
set title "Memory Usage"
set multiplot 
plot "/home/admin1/lx2_Danny/perf_monitor/memory.dat" using 2 with lines 
set xrange [0:50]
set yrange [0:50]
plot "/home/admin1/lx2_Danny/perf_monitor/memory.dat" using 2 with lines
#plot "/home/admin1/lx2_Danny/perf_monitor/CPU_data.dat"  using 2
pause 1 
reread
