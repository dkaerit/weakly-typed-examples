#!/bin/bash

# Obtener el nombre de la carpeta como argumento
carpeta=$1

# Ejecutar los programas en cada lenguaje
printf "\nEjecutando programas en la carpeta $carpeta\n"

printf "\nRUBY:\n"
ruby "$carpeta/$carpeta.rb" # Ejecutar programa de Ruby

printf "\nPYTHON:\n"
python "$carpeta/$carpeta.py" # Ejecutar programa de Python

printf "\nPHP:\n"
php "$carpeta/$carpeta.php" # Ejecutar programa de PHP

printf "\nJAVASCRIPT:\n"
node "$carpeta/$carpeta.js" # Ejecutar programa de JavaScript

printf "\n"