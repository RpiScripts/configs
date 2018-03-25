#!/bin/bash
# ~/configs/ssmtp.sh

# Asistente para la instalación y configuración del paquete ssmtp con Gmail
# EJEMPLO DE USO
# ./configs/ssmtp.sh mi.correo@gmail.com clave_de_gmail

# Instalación
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install ssmtp
wait ${!}

sed -i 's/^mailhub=.*/mailhub=smtp.gmail.com:587/g' /etc/ssmtp/ssmtp.conf
sed -i 's/^#FromLineOverride=YES/FromLineOverride=YES/g' /etc/ssmtp/ssmtp.conf
sudo echo "[GMAIL]
AuthUser=$1@gmail.com
AuthPass=$2
UseSTARTTLS=YES">> /etc/ssmtp/ssmtp.conf

echo 'Prueba de correo con ssmtp'
ssmtp $1 < correoDePrueba.txt
