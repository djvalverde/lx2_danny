#!/bin/bash
LOG_DIR=/home/admin1/lx2_Danny/perf_monitor

rm $LOG_DIR/*.dat


writedata() {
    for i in {1..25}; do
free -m -s 2 | head -2 | sed -e 's/ /|/g' -e '1d' -e 's/Mem:/|/g' -e 's/|||||/|/g' -e 's/|||/|/g' -e 's/||/|/g' -e 's/|/ /g' >> $LOG_DIR/memory.dat; mpstat | tail -1 | awk '{print " "$1" " $3" " $12}' >> $LOG_DIR/CPU_data.dat
        sleep 1
        echo "done"
 done
}

writedata &
sleep 1
gnuplot memory_liveplot.gnu
#gnuplot CPU_liveplot.gnu
