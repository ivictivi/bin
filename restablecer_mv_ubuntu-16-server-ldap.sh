#!/bin/bash

cd /home/vlc/pool

### Apagar maquina
virsh shutdown ubuntu-16-server-ldap


### Comprobar estado de la maquina
while [[ $(virsh list --all | grep 'ubuntu-16-server-ldap' | grep 'apagado' | wc -l) = 0 ]];
   do
        echo "Esperando a que la máquina se apague..."
        sleep 5
done

qemu-img create -b ubuntu-16-server-ldap-rebase-*.img -f qcow2 ubuntu-16-server-ldap-incremento.img

virsh start ubuntu-16-server-ldap
