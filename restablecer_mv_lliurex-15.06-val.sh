#!/bin/bash

cd /home/vlc/pool

### Apagar maquina
virsh shutdown lliurex15-esc-val


### Comprobar estado de la maquina
while [[ $(virsh list --all | grep 'lliurex15-esc-val' | grep 'apagado' | wc -l) = 0 ]];
   do
        echo "Esperando a que la máquina se apague..."
        sleep 5
done

qemu-img create -b lliurex15-esc-val-rebase-*.img -f qcow2 lliurex15-esc-val-incremento.img

virsh start lliurex15-esc-val
