#!/bin/bash
read -p "Introduce el rango a escanear (xxx.xxx.0): " RANGE;
for i in $(seq 1 254);
  do 
  ping=`ping -w 3 -c 2 $RANGE.$i` 
  if [ $? -ne 0 ]; then
  echo $RANGE.$i esta disponible.
  else
  echo $RANGE.$i NO esta disponible.
 fi
done
echo Listo!
exit
