#!/bin/bash

# Función para crear un usuario
crear_usuario() {
    echo "Introduce el nombre del usuario:"
    read username
    echo "Introduce la contraseña:"
    read -s password
    sudo useradd $username
    echo "$username:$password" | chpasswd
    echo "Usuario $username creado con éxito."
}

# Función para modificar la contraseña de un usuario
modificar_contraseña() {
    echo "Introduce el nombre del usuario:"
    read username
    echo "Introduce la nueva contraseña:"
    sudo read -s password
    echo "$username:$password" | chpasswd
    echo "Contraseña de $username modificada con éxito."
}

# Función para borrar un usuario
borrar_usuario() {
    echo "Introduce el nombre del usuario a borrar:"
    read username
    sudo userdel $username
    echo "Usuario $username borrado con éxito."
}

# Función para dar de alta usuarios desde un archivo CSV
dar_alta_usuarios() {
    echo "Introduce el nombre del fichero CSV con los usuarios (nombre,DNI,password):"
    read fichero
    while IFS=, read -r nombre dni password
    do
        sudo useradd $nombre
        echo "$nombre:$password" | chpasswd
        echo "Usuario $nombre dado de alta."
    done < $fichero
}

# Menú principal
while true
do
    echo "Selecciona una opción:"
    echo "1) Crear usuario"
    echo "2) Modificar contraseña"
    echo "3) Borrar usuario"
    echo "4) Dar de alta usuarios desde archivo"
    echo "5) Volver al menú principal"
    read opcion

    case $opcion in
        1) crear_usuario ;;
        2) modificar_contraseña ;;
        3) borrar_usuario ;;
        4) dar_alta_usuarios ;;
        5) exit ;;
        *) echo "Opción no válida. Intenta nuevamente." ;;
    esac
done
