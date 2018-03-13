# configs
Programas para modificar las opciones de configuración de aplicaciones instaladas en mis Raspberries

## EN PROCESO
  Puedo crear un código que hace todas las tareas de manera general, solo que saca los parámetros de un archivo diferente para cada aplicación. De esta manera se reutiliza el código y se puede actualizar todo de una vez.

## FUNCIÓN
Cuando ejecuto uno de estos programas se modifican los archivos de configuración de las distintas aplicaciones, de manera que evito tener que detener el proceso, luego editar el archivo de configuración buscando cada opción y por último reiniciar el servicio. Todo se hace automáticamente.

## APLICACIONES
  motion.conf.sh
  samba.conf.sh
  transmission-daemon.conf.sh
  
## OTROS SCRIPTS
  dhcpcd.conf.sh ->  buscar redes y modificar la configuración de ip estática.
      Se debe iniciar con cada reboot (crontab) y ejecutarse hasta que la conexión se ha establecido satisfactoriamente.
  ftp.conf.sh  ->  configuración de acceso y subida de archivos a mi servidor ftp
  ssmtp.conf.sh  -> configuración de cuentas para envío de correos electrónicos
  
