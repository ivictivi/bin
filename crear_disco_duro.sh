#!/bin/bash

#!/bin/sh

fecha=`date +"%Y%m%d_%H%M%S"`


read -p "Introduzca nombre del disco duro" d

if [ "$d" = "" ] | [ "$d" = "Nombre del disco duro" ]
	then
		echo "No ha especificado ningún nombre"
	else
        read -p "Introduzca capacidad de disco duro" s
		es_numero='^-?[0-9]+([.][0-9]+)?$'
		if [ ! "$s" = "" ] | [ ! "$s" = $es_numero ]
			then
				echo "esta bien introducido"
				qemu-img create -f qcow2 "$d"-rebase-"$fecha".img "$s"G
				qemu-img create -b "$d"-rebase-"$fecha".img -f qcow2 "$d"-incremento.img
			else
				echo "No ha introducido un tamaño valido"
		fi
fi
		


