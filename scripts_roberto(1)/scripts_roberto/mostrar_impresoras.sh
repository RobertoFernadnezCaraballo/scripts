#!/bin/bash

# Mostrar impresoras disponibles
echo "Impresoras disponibles en el sistema:"
lpstat -p

# Preguntar si se desea guardar la lista en un archivo
echo "¿Quieres guardar la lista de impresoras en un archivo? (s/n)"
read respuesta

if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    sudo lpstat -p > impresoras.txt
    echo "La lista de impresoras ha sido guardada en 'impresoras.txt'."
else
    echo "La lista no ha sido guardada."
fi
