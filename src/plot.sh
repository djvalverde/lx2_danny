#!/bin/bash
rm plot.dat

writedata() {
    for i in {1..20}; do
free -m -s 2 | head -2 | sed -e 's/ /|/g' -e '1d' -e 's/Mem:/|/g' -e 's/|||||/|/g' -e 's/|||/|/g' -e 's/||/|/g' -e 's/|/ /g' >> plot.dat       
        sleep 1
        echo "done"
    done
}

writedata &
sleep 1
gnuplot liveplot.gnu
