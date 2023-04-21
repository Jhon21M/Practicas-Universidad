#!/bin/bash

# Obtener la fecha actual
date=$(date +%Y-%m-%d)

# Comprobar si el archivo ya existe
if [ -e "procesos-$date.list" ]; then
    # Si el archivo ya existe, redirigir la salida estándar al archivo en modo append
    echo "------------------------------" >> "procesos-$date.list"
    echo "Estado del sistema al ejecutar el script" >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    uptime >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    echo "5 procesos que más están consumiendo recursos" >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    ps aux --sort=-%cpu | head -n 6 >> "procesos-$date.list"
else
    # Si el archivo no existe, redirigir la salida estándar al archivo en modo write
    echo "------------------------------" > "procesos-$date.list"
    echo "Estado del sistema al ejecutar el script" >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    uptime >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    echo "5 procesos que más están consumiendo recursos" >> "procesos-$date.list"
    echo "------------------------------" >> "procesos-$date.list"
    ps aux --sort=-%cpu | head -n 6 >> "procesos-$date.list"
fi

# Agregar tarea en CRON para ejecutar el script cada hora
(crontab -l ; echo "0 * * * * /ruta/al/script") | crontab -
