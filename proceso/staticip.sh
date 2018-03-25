#!/bin/bash
# configs/proceso/staticip.sh

## NO FUNCIONA ##

# Intenta conectar con el router local en 192.168.0.1 (Negocio)
# Si no logra la conexión cambia la ip del archivo dhcpcd.conf por 192.168.1.1 (Casa)

# Testear en instalación nueva.

# /etc/dhcpcd.conf
# interface wlan0
# static ip_address=192.168.0.162/24
# static routers=192.168.0.1
# static domain_servers=8.8.8.8


IP='192.168.0.1'
IP2='192.168.1.1'

ping -c 10 $IP > /dev/null && EXIT 0 || cp /etc/dhcpcd.conf /etc/dhcpcd.old.conf

# Tengo que modificar el archivo dhcpcd.conf y luego reiniciar las nuevas ip's
sudo /etc/init.d/dhcpcd stop
wait ${!}
sudo sed -i 's/$IP2 /$IP /g' /etc/dhcpcd.conf
sudo /etc/init.d/dhcpcd restart
wait ${!}

# Vuelvo a intentar la conexión.
ping -c 10 $IP > /dev/null && EXIT 0

# Tengo que modificar el archivo dhcpcd.conf y luego reiniciar las nuevas ip's
sudo /etc/init.d/dhcpcd stop
wait ${!}
sudo sed -i 's/$IP /$IP2 /g' /etc/dhcpcd.conf
sudo /etc/init.d/dhcpcd restart
wait ${!}

# Vuelvo a intentar la conexión.
ping -c 10 $IP2 > /dev/null && EXIT 0

# Si no conecta restauro la copia del archivo y reinicio todo.
sudo /etc/init.d/dhcpcd stop
wait ${!}
sudo mv /etc/dhcpcd.old.conf /etc/dhcpcd.conf
sudo /etc/init.d/dhcpcd restart

