<#
2º) hacer un script q te muestre por pantalla el nombre (solo el nombre, ninguna otra propiedad) de todos los servicios q tienes en el sistema.
(mirar q coincide con las claves q hay en el registro donde se definen los servicios por el SCM: HKLM\system\CurrentControlSet\Services)

Despues te debe pedir un nombre de un servicio y ya si tienes q mostrar para ese servicio todas sus propiedades en formato lista
#>





get-service | Select-Object -Property name |format-list


[string]$name=Read-Host -Prompt "`nEscribre el nombre de alguno de los servicios anteriormente mostrados: "

 $servicelist=Get-Service | Select-Object -Property name

#con foreach

foreach ($oneservice in $servicelist){
    
    if ($oneservice.Name -eq $name){
    get-service -name $name | Select-Object -Property * |Format-List
    }
 }

<#
con for

 for ([int]$a=0; $a -lt $servicelist.Count -1; $a++){

    if ($servicelist[$a].Name -eq $name){
        get-service -name $name | Select-Object -Property * |Format-List
    }
}
#>


<#clear-host

get-service | Select-Object -Property Name | Format-List

#por cada nombre debe existir una clave en HKLM\System\CurrentControlSet\Services
#ejecutar regedit y mirarlo....



[String]$nombre=read-host -Prompt "nombre servicio de esa lista_" 

#...de todos los objetos service me creo una lista de objetos con su propiedad "Name solo, pero siguen siendo objetos
# de hecho si haceis despues un: write-host $listaServicios
#vereis q te salen muchos: @{Name=....} <--- esto es un objeto con una unica propiedad .Name
$listaServicios=get-service | select-object -Property name 


#....lo ideal seria comprobar si existe este nombre en esa lista
# me recorro toda esa lista con un bucle y voy comparando uno a uno

for([int]$a=0; $a -lt $listaServicios.Count-1; $a++){

    if($listaServicios[$a].Name -eq $nombre){
        get-service -name $nombre | Select-Object -Property * | format-list    
    }
}
#>