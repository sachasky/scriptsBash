#!/bin/bash

echo "------Administracion de Cuentas de Usuario------"

PS3='Ingrese una opcion :'

opcion=( "Suspender Cuenta de Usuario" "Desbloquear Cuenta de Usuario" "Cambiar Contraseña del Usuario" "Modificar Grupo del Usuario" "Salir" )
select opt in "${opcion[@]}"


do
   case $opt in
        "Suspender Cuenta de Usuario")
            echo "--Seleccionastes Suspender Cuenta de Usuario--"
                echo "Lista de Usuarios en el Servidor"
                getent passwd {1001..60000} | cut -d":" -f1,3,5
		read -p "Ingrese la ID del Usuario :" Iduser
                echo Ingresa el Nombre de Usuario a Bloquear :
                read nombreu

                if [ $(cut -d":" -f3,1 /etc/passwd | grep -w $nombreu | grep -wc $Iduser) = "1" ]
                then
                   usermod -L $nombreu
                   echo ""
                   echo "Bloqueado Exitosamente"
                else 
                    echo "Id o usuario incorrecto"
                fi
  
            ;;
         "Desbloquear Cuenta de Usuario")
            echo "Seleccionastes Desbloquear Cuenta de Usuario"
               echo "--Seleccionastes Desbloquear Cuenta de Usuario--"
                echo "Lista de Usuarios Bloqueados en el Servidor"
                grep -w '!' /etc/passwd | cut -d":" -f1,2,3,5
                
 
                read -p "Ingrese la ID del Usuario :" Iduser
                echo Ingresa el Nombre de Usuario a Desbloquear :
                read nombreDU
                if [ $(cut -d":" -f3 /etc/passwd | grep -wc $Iduser) = "1" ]
                then
                    
                    usermod -U $nombreDU
                else
                    echo "Error, vuelve a idicar Opcion"
                fi
            ;;
         "Cambiar Contraseña del Usuario")
            echo "--Seleccionastes Cambiar Contraseña del Usuario--"
                 echo "Lista de Usuarios en el Servidor"
                 getent passwd {1001..60000} | cut -d":" -f1,3,5

                 read -p "Ingrese Nombre de Usuario : " nombreC
                 read -p "Ingrese ID del Usuario : " idusuario
                 
                 if [ $(cut -d":" -f1,3 /etc/passwd | grep -w $nombreC | grep -wc $idusuario) = "1" ]
                 then 
                   echo "------------------------------"
                   passwd $nombreC
                   echo "------------------------------"
                   echo "Contraseña Cambiada con exito"
                                
                 else
                   echo "Error de identificacion"
                 fi
                  ;;
         "Modificar Grupo del Usuario")

            echo "Seleccionastes Modificar Grupo del Usuario"
		./Mgrupos.sh
        	  ;; 
         "Salir")
              break
              ;;
         *) echo "Opcion Incorrecta $REPLY";;
   esac
done   

