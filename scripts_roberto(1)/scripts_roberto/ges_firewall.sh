#!/bin/bash

# Función para cortar el tráfico saliente hacia un dominio
cortar_trafico_saliente() {
    echo "Introduce el dominio a bloquear:"
    read dominio
    ip=$(dig +short $dominio)
    sudo iptables -A OUTPUT -d $ip -j REJECT
    echo "Tráfico saliente hacia $dominio bloqueado."
}

# Función para cortar el tráfico entrante hacia una IP
cortar_trafico_entrante() {
    echo "Introduce la IP del servidor:"
    read ip_servidor
    sudo iptables -A INPUT -s $ip_servidor -j REJECT
    echo "Tráfico entrante desde $ip_servidor bloqueado."
}

# Menú principal
while true
do
    echo "Selecciona una opción:"
    echo "1) Cortar tráfico saliente hacia un dominio"
    echo "2) Cortar tráfico entrante hacia un servidor"
    echo "3) Volver al menú principal"
    read opcion

    case $opcion in
        1) cortar_trafico_saliente ;;
        2) cortar_trafico_entrante ;;
        3) exit ;;
        *) echo "Opción no válida. Intenta nuevamente." ;;
    esac
done
