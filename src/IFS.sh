#!/bin/bash

VAR1="algo:otro guia, paso, calle"

#Por defecto el Internal Field Separator es
#IFS=$' \n\t'
#Realizar la prueba con dos delimitadores ":" y ","

IFS=:,

for i in $VAR1; do 
echo Dato = $i

#Para correr este ejemplo se deben definir las variables
#VAR2 y VAR3 antes de correr tle script. Hagalo de dos formas distintas sin definitlo dentro del script

echo "La variable dos contiene \"$VAR2\" y tres contiene \"$VAR3\"."

done
