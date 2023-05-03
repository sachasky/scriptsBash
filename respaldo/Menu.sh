#!/bin/bash

echo " -----Menu de Administracion del servidor----"

PS3='Ingrese una opcion :'

opcion=( "Menu Administracion de Cuentas de usuario" "Menu Administracion de motor de la base de datos" "Menu Monitoreo de recursos del servidor"
"Menu de respaldos del sistema" "Menu Monitoreo de acceso al servidor y funcionamiento de servicios" "Menu testeos de red, conectividad" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Menu Administracion de Cuentas de usuario")
        echo "------------------------------------"
		./adminuser.sh
	echo "------------------------------------"
            ;;
        "Menu Administracion de motor de la base de datos")
        echo "------------------------------------"
                ./dbmenu.sh
        echo "------------------------------------"
            ;;
	"Menu Monitoreo de recursos del servidor")
        echo "------------------------------------"  
                ./monitoreo.sh
        echo "------------------------------------"
            ;;
	"Menu de respaldos del sistema")
        echo "------------------------------------"
                ./rsmenu.sh
        echo "------------------------------------"
            ;;
	#echo "------------------------------------"
	"Menu Monitoreo de acceso al servidor y funcionamiento de servicios")
	echo "------------------------------------"
		./accesosS.sh
	echo "------------------------------------"
	    ;;
	#echo "------------------------------------"
        "Menu testeos de red, conectividad")
        echo "------------------------------------"
                ./conectividad.sh
        echo "------------------------------------"
            ;;	
        "Salir")
            break
            ;;
        *) echo "opcion incorrecta"
            ;;
   esac
done

