#!/bin/bash

sudo systemctl stop motion
# Espera a que se terminen de ejecutar todos los proceos activos.
wait ${!}

# Muestro los valores actuales:
grep "^daemon" /etc/motion/motion.conf;grep "^stream_localhost" /etc/motion/motion.conf;grep "^stream_maxrate" /etc/motion/motion.conf;grep "^framerate" /etc/motion/motion.conf;grep "^width" /etc/motion/motion.conf;grep "^height" /etc/motion/motion.conf;grep "^output_pictures" /etc/motion/motion.conf;grep "^ffmpeg_output_movies" /etc/motion/motion.conf;grep "^picture_filename" /etc/motion/motion.conf;grep "^movie_filename" /etc/motion/motion.conf;grep "^stream_auth_method" /etc/motion/motion.conf;grep "^stream_authentication" /etc/motion/motion.conf;grep "^target_dir" /etc/motion/motion.conf;

#Espero 3 segundos para leer la información
sleep 3

# Actualizo los valores:
sudo sed -i 's/daemon [a-z][a-z]*/daemon on/g' /etc/motion/motion.conf
sudo sed -i 's/stream_localhost [a-z][a-z]*/stream_localhost off/g' /etc/motion/motion.conf
sudo sed -i 's/stream_maxrate [0-9][0-9]*/stream_maxrate 100/g' /etc/motion/motion.conf
sudo sed -i 's/framerate [0-9][0-9]*/framerate 100/g' /etc/motion/motion.conf
sudo sed -i 's/height [0-9][0-9]*/height 480/g' /etc/motion/motion.conf
sudo sed -i 's/width [0-9][0-9]*/width 640/g' /etc/motion/motion.conf
sudo sed -i 's/output_pictures [a-z][a-z]*/output_pictures on/g' /etc/motion/motion.conf
sudo sed -i 's/ffmpeg_output_movies [a-z][a-z]*/ffmpeg_output_movies on/g' /etc/motion/motion.conf
sudo sed -i 's|picture_filename .*|picture_filename %Y/%m/%d/ %H:%M:%S-%q|g' /etc/motion/motion.conf
sudo sed -i 's|movie_filename .*|movie_filename %Y/%m/%d/ %H:%M:%S|g' /etc/motion/motion.conf
sudo sed -i 's/stream_auth_method [0-9][0-9]*/stream_auth_method 1/g' /etc/motion/motion.conf
sudo sed -i 's/stream_authentication [a-zA-Z]*:[a-zA-Z]*/stream_authentication pi:pi/g' /etc/motion/motion.conf
sudo sed -i 's|target_dir .*|target_dir ~/motion|g' /etc/motion/motion.conf

sudo sed -i 's/rotate [0-9][0-9]*/rotate 90/g' /etc/motion/motion.conf
sudo sed -i 's/threshold [0-9][0-9]*/threshold 2000/g' /etc/motion/motion.conf
sudo sed -i 's/lightswitch [0-9][0-9]*/lightswitch 50/g' /etc/motion/motion.conf
sudo sed -i 's/minimum_motion_frames [0-9][0-9]*/minimum_motion_frames 5/g' /etc/motion/motion.conf
sudo sed -i 's/lightswitch [0-9][0-9]*/lightswitch 50/g' /etc/motion/motion.conf
sudo sed -i 's/pre_capture [0-9][0-9]*/pre_capture 50/g' /etc/motion/motion.conf
sudo sed -i 's/post_capture [0-9][0-9]*/post_capture 50/g' /etc/motion/motion.conf
sudo sed -i 's/event_gap [0-9][0-9]*/event_gap 10/g' /etc/motion/motion.conf
sudo sed -i 's/max_movie_time [0-9][0-9]*/max_movie_time 120/g' /etc/motion/motion.conf
sudo sed -i 's/quality [0-9][0-9]*/quality 75/g' /etc/motion/motion.conf

# Espera a que se terminen de ejecutar todos los proceos activos.
wait ${!}

# Muestro los valores después de la modificación:
grep "^daemon" /etc/motion/motion.conf;grep "^stream_localhost" /etc/motion/motion.conf;grep "^stream_maxrate" /etc/motion/motion.conf;grep "^framerate" /etc/motion/motion.conf;grep "^width" /etc/motion/motion.conf;grep "^height" /etc/motion/motion.conf;grep "^output_pictures" /etc/motion/motion.conf;grep "^ffmpeg_output_movies" /etc/motion/motion.conf;grep "^picture_filename" /etc/motion/motion.conf;grep "^movie_filename" /etc/motion/motion.conf;grep "^stream_auth_method" /etc/motion/motion.conf;grep "^stream_authentication" /etc/motion/motion.conf;grep "^target_dir" /etc/motion/motion.conf;

# Reinicio el servicio.
sudo systemctl restart motion
wait ${!}

# Reinicio el sistema (parece que motion lo requiere)
sudo shutdown -r 10
