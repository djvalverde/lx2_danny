#!/bin/bash

errorlog="$0.err"

#La salida estandar de error estara redireccionada al archivo if-then.sh.err

if cp archivo1.txt archivo1.tat.bkp 2> $errorlog
then
 echo "El archivo1.txt fue correctamente respaldado..."
else
echo "El archivo1.txt no pudo ser respaldado, verifique el log $errorlog"
fi
