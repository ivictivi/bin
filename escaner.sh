#!/bin/bash

if [ $(id -u) = 0 ]
     then
crearcarp(){
cd 
for i in "Escritorio" "Desktop" "Escriptori"
do
	if [ -d $i ];then
		cd $i
			direc=$(pwd)
			usu=echo $direc | cut -f3 -d "/"
		mkdir $direc/escaner 2>/dev/null
		chmod -R 777 $direc/escaner 2>/dev/null
		echo "[escaner]" >> /etc/samba/smb.conf
		echo " "
		echo "path = $direc/escaner" >> /etc/samba/smb.conf
		echo "writeable = yes" >> /etc/samba/smb.conf
		echo "guest ok = yes" >> /etc/samba/smb.conf
		echo "force user = "$usu" >> /etc/samba/smb.conf
			break
else
	echo "No existe."
fi
done
}

#Función crear compartida.
crearcomp(){
echo "[escaner]" >> /etc/samba/smb.conf
echo ""
echo "path = /home/$USER/Escritorio/escaner" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
echo "force user = $USER" >> /etc/samba/smb.conf
}

apt-get install samba -y ## instalamos samba 
crearcarp

else
        echo "Recuerda ejecutar con privilegios crack!!"
fi
