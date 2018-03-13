#!/bin/bash
# Intenta conectar con el router local en 192.168.0.1 (Negocio)
# Si no logra la conexión cambia la ip del archivo dhcpcd.conf por 192.168.1.1 (Casa)
IP='192.168.0.1'

if ping -c 1 $IP &> /dev/null
then
# Conexión satisfactoria
  EXIT 0
else
  sudo sed -i 's/192.168.0.1 /192.168.1.1 /g' /etc/dhcpcd.conf
fi

# Otra opción:
# ping -c 10 192.168.1.1 > /dev/null && echo "up" || echo "down"
