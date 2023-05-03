#!/bin/bash

echo " -----Menu Monitoreo de acceso al servidor y funcionamientos de servicios----"

PS3='Ingrese una opcion :'

opcion=( "Mostrar los Usuarios Conectados" "Cantidad de Usuarios Logueados" "Listar Funcionamientos de Servicios Activos" "Lista de Puertos Utilizado por cada Servicio" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Mostrar los Usuarios Conectados")
            echo "-----------------------"
		echo "Usuarios Conectados"
		who
	    echo "-------------------"
            ;;
        "Cantidad de Usuarios Logueados")
	echo "---------------------------"
            who -q
	echo "---------------------------"
	echo "Finalizado"
            ;;
        "Listar Funcionamientos de Servicios Activos")
            echo "------------------------"
		systemctl | grep running
            echo "------------------------"
            ;;
	"Lista de Puertos Utilizado por cada Servicio")
	echo "---------------------------"
		netstat -plnt
	echo "---------------------------"
	;;
        "Salir")
            break
            ;;
        *) echo "opcion incorrecta"
            ;;


   esac
done

