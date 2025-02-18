#!/bin/bash

# Función para llamar a ges_user.sh
menu_ges_user() {
    ./ges_user.sh
}

# Función para llamar a red_scan.sh
menu_red_scan() {
    ./red_scan.sh
}

# Función para llamar a ges_firewall.sh
menu_ges_firewall() {
    ./ges_firewall.sh
}

# Función para llamar a mostrar_impresoras.sh
menu_mostrar_impresoras() {
    ./mostrar_impresoras.sh
}

# Menú principal
while true
do
    echo "Selecciona una opción:"
    echo "1) Gestión de usuarios"
    echo "2) Escaneo de red"
    echo "3) Gestión de firewall"
    echo "4) Mostrar impresoras"
    echo "5) Salir"
    read opcion

    case $opcion in
        1) menu_ges_user ;;
        2) menu_red_scan ;;
        3) menu_ges_firewall ;;
        4) menu_mostrar_impresoras ;;
        5) exit ;;
        *) echo "Opción no válida. Intenta nuevamente." ;;
    esac
done
