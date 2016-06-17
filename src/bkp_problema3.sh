#!/bin/bash

DATA=/home/admin1/lx2_Danny/problema3
OUT_DATA=$DATA/datos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/datos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

 #m=0

# for i in `find $DATA -name '*.xls' `
# do
#echo "Procesando archivo $i"
#xls2csv $i > $OUT_DATA/`echo $i |  cut -d'/' -f6 | sed -e 's/.xls//' -e 's/bills//' -e 's/_//'`.csv
#let m=m+1

#done 2> error_xls2csv.log

m=0

for e in `find $OUT_DATA -name "Datos"`
do
echo "Dando formato de datos para graficar el archivo $e"
#cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " "$4 " " $5}'| sed '1,$ s/"//g' | sed '1 s/date/#date/g'> $GRAF_DATA/graf-$m.dat

#cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7}' | sed -e '1,$ s/,/|/g' -e '1d' -e '3,4d' | grep '\S' > $GRAF_DATA/Datos.dat

cat $e | awk -F "," '{print $1 " " $6 " " $7}' | sed -e '1,$ s/,/|/g' -e '1d' -e '3,4d' -e '1,$ s/"//g' | grep '\S' > $GRAF_DATA/Datos.dat

let m=m+1

done 2> csv2dat.log
