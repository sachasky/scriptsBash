#!/bin/bash

echo " -----Menu de Monitoreo de recursos del servidor----"

PS3='Ingrese una opcion :'

opcion=( "Monitorear Interfaz de Red" "Monitorear Discos" "Monitoreo de CPU y Consumo de Memoria" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Monitorear Interfaz de Red")
            echo "Monitoreando Red(INGRESE LA TECLA q PARA FINALIZAR)"
		iftop
	    echo "Finalizo"
            ;;
        "Monitorear Discos")
        	echo "Monitoreando Discos(INGRESE LA TECLA q PARA FINALIZAR)"    
	        iotop
            echo "Finalizo"
            ;;
        "Monitoreo de CPU y Consumo de Memoria")
                echo "Monitoreando CPU y Memoria(INGRESE LA TECLA q PARA FINALIZAR)"
             htop
                echo "Finalizo"
            ;;
        "Salir")
            break
            ;;
        *) echo "opcion incorrecta"
            ;;


   esac
done

