#!/bin/bash

if test -e $1 #EL comando test -e verifica que el archivo existe
then
cp $1 $1.bck
echo "El archivo $1 fue correctamente respaldado..."
elif test -e $2
then
cp $2 $2.bck
echo "EL archivo $2 fue correctamente respaldado..."
elif test -e $3
then
cp $3 $3.bck
echo "EL archivo $3 fue correctamente respaldado..."
else
echo "No se pudo respaldar ninguno de los aarchivos: $@"
fi
