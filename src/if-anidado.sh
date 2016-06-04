#!/bin/bash
errorlog="$0.err"

#La salida estandar de error estara redireccionada al archivo if-then.sh.err

if cp archivo1.txt archivo1.txt.bck 2> $errorlog
then
  echo "El archivo1.txt fue correctamente respaldado..."
echo "Eliminando el archivo original"
#Ejemplo de "if" anidado, una condicion contenida dnetro de otra....

if rm archivo1.txt
then
echo "El archivo original fue eliminado correctamente..."
else
echo "No se pudo eliminar el archivo..."
fi
else
echo "El archivo1.txt no pudo ser respaldado, verifique el log: $errorlog"
fi
