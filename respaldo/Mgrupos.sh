#!/bin/bash

echo " -----Menu de Modificacion de Grupos----"

PS3='Ingrese una opcion :'

opcion=( "Borrar Usuario de un Grupo" "Añadir Usuario a un Grupo" "Salir" )
select opt in "${opcion[@]}"
do
   case $opt in
        "Borrar Usuario de un Grupo")

	 echo "Seleccionastes Modificar Grupo del Usuario"
                getent group Operadores Administradores
            
		echo "--Borrar Usuario de un Grupo--"

               read -p "Ingrese Nombre de Usuario : " nombreM
                read -p "Ingrese ID del Grupo : "    idgrupo

                if [ $(cut -d":" -f3,4 /etc/group | grep -w $nombreM | grep -wc $idgrupo) = "1" ]
                then
                        echo "--------------------"
                        gpasswd -d $nombreM Operadores
                        echo "--------------------"
                        echo "Borrado con Exito el Usuario del grupo Operadores"

                elif [ $(cut -d":" -f3,4 /etc/group | grep -w $nombreM | grep -wc $idgrupo) = "1" ]
                then
                        echo "--------------------"
                        gpasswd -d $nombreM Administradores
                        echo "--------------------"
                        echo "Borrado con Exito el Usuario del grupo"

                elif [ $(cut -d":" -f3,4 /etc/group | grep -w $nombreM | grep -wc $idgrupo) = "0" ]
                then
                        echo "No coinciden"

                #elif [ $(cut -d":" -f3,4 /etc/group | grep -l $nombreM | grep -wc $idgrupo) = "0" ]
                #then
                        #echo "No existe en el grupo"
                else
                        echo "Error"
                fi
            ;;
        "Añadir Usuario a un Grupo")
            echo "Seleccionastes Añadir Usuario a un Grupo"
		getent group Operadores Administradores
		echo "-----------------------------------------"
		read -p "Ingresar Nombre de Usuario : " nombreA
 	
               	read -p "Ingrese el Nombre  del Grupo  :  " Ngrupo
		echo "-----------------------------------------"
		gpasswd -a $nombreA $Ngrupo
		echo "-----------------------------------------"
		 ;;
        "Salir")
            break
            ;;
        *) echo "Opcion Incorrecta $REPLY";;
       
   esac
done


