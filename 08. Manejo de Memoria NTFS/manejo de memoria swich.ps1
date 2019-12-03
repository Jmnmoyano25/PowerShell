<#	MENU GESTIÓN FICHEROS
	---------------------------------------
	1.Copiar Fichero(s) a un directorio destino
	2.Borrar Ficheros(s)
	3.Renombrar Ficheros
	4.Mover fichero(s) a otro directorios
	5.--Salir--

en las opciones 1 y 4, hay que comprobar que los directorios de destino existen. 
En la opción 3 te debe pedir el nuevo nombre y en la opción 2 te tiene que pedir el directorio donde están los ficheros, 
mostrar un listado de los ficheros y luego pedir que ficheros borrar.#>

clear-host
do{

write-host "`tMENU GESTIÓN FICHEROS"
write-host "`n`t----------------------------"
write-host "`n1.Copiar Fichero(s) a un directorio destino"
write-host "`n2.Borrar Ficheros(s)"
write-host "`n3.Renombrar Ficheros"
write-host "`n4.Mover fichero(s) a otro directorios"
write-host "`n5.--Salir--"

[int]$opcion=Read-Host -Prompt "Opción "
$fichero= Read-Host -Prompt "Nombre del fichero "
#1
swich($opcion){
    case 1{
    $destino= Read-Host -Prompt "destino del fichero "

    Copy-Item -Path $fichero -Destination $destino

        break
    }#FIN1

    case 2{
        Remove-Item $fichero -Confirm
        break
    }#FIN 2

    case 3{
    $nuevoNombre = Read-Host -Prompt "Cual va a ser el nuevo nombre y su extensión"
    Rename-Item -Path $fichero -NewName $nuevoNombre
        break
    }#FIN 3

    case 4{
    $destino= Read-Host -Prompt "Destino del fichero "
    
    Move-Item -Path $fichero -Destination $destino
        break
    }#FIN 4

    case 5{
    exit

    }#FIN 5
}
}while($opcion -eq 5)