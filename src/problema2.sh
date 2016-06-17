#!/bin/bash

DATA=/home/admin1/lx2_Danny/problema2
OUT_DATA=$DATA/datos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/datos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

 m=0

 for i in `find $DATA -name '*.xls' `
 do
echo "Procesando archivo $i"
xls2csv $i > $OUT_DATA/`echo $i |  cut -d'/' -f6 | sed -e 's/.xls//' -e 's/bills//' -e 's/_//'`.csv
let m=m+1

done 2> error_xls2csv.log

m=0

for e in `find $OUT_DATA -name "*.csv"`
do
echo "Dando formato de datos para graficar el archivo $e"
v_month=`echo $e |  cut -d'/' -f7 | sed -e 's/.csv//'` 
#cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " "$4 " " $5}'| sed '1,$ s/"//g' | sed '1 s/date/#date/g'> $GRAF_DATA/graf-$m.dat
cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " "}' | sed -e '1,$ s/,//g' -e '1,$ s/"//g' -e "1,$ s/^/$v_month /g" -e "1,1 s/$v_month//g" -e "2,2 s/$v_month/Mes/g"|  grep '\S' | head -10 > $GRAF_DATA/`echo $e |  cut -d'/' -f7 | sed -e 's/.csv//'`.dat

let m=m+1

done 2> csv2dat.log

if [ `ls -ltrh $FULL_DATA/all.dat | wc -l` -gt 0 ]
then
         rm $FULL_DATA/all.dat
         echo "Archivo all.dat borrado"
fi 2> errorIf.log


for k in `find $GRAF_DATA -name "*.dat"`
do
cat $k | grep Luz >> $FULL_DATA/all.dat
         echo "Procesando archivo $k"
done 2> error3.log
cat $FULL_DATA/all.dat |  grep '\S' | sort -d > $FULL_DATA/all_2.dat
mv $FULL_DATA/all_2.dat $FULL_DATA/all.dat

FMT_BEGIN='012012'
FMT_END='032012'
FMT_X_SHOW=%m%Y
DATA_DONE=$FULL_DATA/all.dat


graficar()
{
gnuplot << EOF 2> error.log

set title "Consumo electrico"
set ylabel "Miles de Colones"
set xdata time
set timefmt "%m%Y"
set xrange ["$FMT_BEGIN" : "$FMT_END"]
set format x "$FMT_X_SHOW"
set terminal png
set output 'elect.png'
plot "$DATA_DONE" using 1:3 with lines title "Monto Colones"
EOF

}

graficar
