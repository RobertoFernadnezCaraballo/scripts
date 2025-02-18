#!/bin/bash

# Función para almacenar las conexiones TIME_WAIT
almacenar_conexiones() {
    sudo netstat -an | grep "TIME_WAIT" > salida_red.txt
    echo "Conexiones TIME_WAIT almacenadas en salida_red.txt."
}

# Función para mostrar las IPs de conexiones web no seguras
mostrar_conexiones_no_seguras() {
    grep ":80" salida_red.txt | awk '{print $5}'
}

# Función para mostrar el contenido de salida_red.txt
mostrar_contenido() {
    cat salida_red.txt
}

# Función para detectar sistema operativo y puertos
detectar_sistema_y_puertos() {
    for ip in {12..23}
    do
        nmap -O 192.168.8.$ip
    done
}

# Función para mostrar información de un usuario
mostrar_informacion_usuario() {
    echo "Introduce el nombre del usuario:"
    read username
    id $username
}

# Menú principal
while true
do
    echo "Selecciona una opción:"
    echo "1) Almacenar conexiones TIME_WAIT"
    echo "2) Mostrar conexiones web no seguras"
    echo "3) Mostrar contenido de salida_red.txt"
    echo "4) Detectar sistema operativo y puertos"
    echo "5) Mostrar información de un usuario"
    echo "6) Volver al menú principal"
    read opcion

    case $opcion in
        1) almacenar_conexiones ;;
        2) mostrar_conexiones_no_seguras ;;
        3) mostrar_contenido ;;
        4) detectar_sistema_y_puertos ;;
        5) mostrar_informacion_usuario ;;
        6) exit ;;
        *) echo "Opción no válida. Intenta nuevamente." ;;
    esac
done
