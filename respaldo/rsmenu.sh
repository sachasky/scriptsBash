#!/bin/bash

echo " -----Menu de Respaldo del Servidor----"

PS3='Ingrese una opcion :'

opcion=( "Respaldo" "Restauracion" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Respaldo")
	echo "Realizando Respaldo"
	fecha=$(date +%y-%m-%d)
	hora=$(date +%H:%M)

	tar -cvpjf /run/media/usuario/USB65/respaldOP.tar.bz2 --exclude=/proc --exclude=lost+found --exclude=respaldOP.tar.bz2 --exclude=/mnt --exclude=/sys --exclude=/media /
	echo "Finalizando"
            ;;
        "Restauracion")
	echo "-------------------------"
	echo "Proceso explicado en su Respectivo Documento"
	
	echo "-------------------------"
            ;; 
        "Salir")
            break
            ;;
        *) echo "opcion incorrecta"
            ;;


   esac
done

