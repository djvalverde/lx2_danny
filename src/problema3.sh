#!/bin/bash

#Variables Definition
DATA=/home/admin1/lx2_Danny/problema3
OUT_DATA=$DATA/datos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/datos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

m=0
#Extracting the columns needed and converting the file for chart
for e in `find $OUT_DATA -name "Datos"`
do
echo "Dando formato de datos para graficar el archivo $e"

cat $e | awk -F "," '{print $1 " " $6 " " $7}' | sed -e '1,$ s/,/|/g' -e '1d' -e '3,4d' -e '1,$ s/"//g' | grep '\S' > $GRAF_DATA/Datos.dat

let m=m+1

done 2> csv2dat.log

#Variables used on gnuplot chart

FMT_BEGIN='2012-03-16 11:00:00'
FMT_END='2012-05-30 22:00:00'
#FMT_X_SHOW='%Y-%m-%d %H:%M:%S'
FMT_X_SHOW='%Y-%m-%d'
DATA_DONE=$GRAF_DATA/Datos.dat

#Function in charge of chart creation in gnuplot
graficar()
{
gnuplot << EOF 2> error.log

set grid
set title "Maximo Indice de radiacion solar"
set ylabel "KW/m2"
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set xrange ["$FMT_BEGIN" : "$FMT_END"]
set format x "$FMT_X_SHOW"
set terminal png size 1024,864
set output 'IRS_max.png'
plot "$DATA_DONE" using 1:3 with lines title "MAX"
set title "Minimo Indice de radiacion solar"
set terminal png
set output 'IRS_min.png'
plot "$DATA_DONE" using 1:4 with lines title "MIN"
EOF
}

graficar
