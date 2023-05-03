#!/bin/bash

echo " -----Menu de Conectividad y Testeos de Red----"

PS3='Ingrese una opcion :'

opcion=( "Realizar Ping a Cliente Windows" "Ruta de Conexion a la RED" "Estado del SSH" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Realizar Ping a Cliente Windows")
		read -p "Ingrese IP de La maquina Cliente :" IP
		
            echo "Realizando Ping"
		echo "--------------------------"
                ping $IP -c 10
		echo "--------------------------"
		echo "--------------------------"
            echo "Finalizo"
		echo "--------------------------"
            ;;
        "Ruta de Conexion a la RED")
                echo "------------------------"
                route -n
		echo "------------------------"
            echo "Finalizo"
            ;;
        "Estado del SSH")
                echo "-----------------------"
             systemctl status sshd
		echo "-----------------------"
                echo "Finalizo"
            ;;
        "Salir")
            break
            ;;
        *) echo "opcion incorrecta"
            ;;


   esac
done

