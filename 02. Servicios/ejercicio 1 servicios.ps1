<#
1º) Hacer un script q te pida el nombre de un servicio y q despues te muestre de ese servicio todas sus propiedades en formato lista y el siguiente
mensaje:
		"el objeto servicio pertenece a la clase: ...... si quieres ver sus propiedades pulsa la tecla (H)"
		
y si meten una "h" o "H" entonces mostrar las propiedades q tiene la clase q genera los servicios
#>

Clear-Host

[string]$name=Read-Host -Prompt "Escribe el nombre de un servicio (wuauserv, xboxGipSvc, Themes, etc.....)_"
[System.ServiceProcess.ServiceController]$servicio=get-service -Name $name 

Write-Host "`nLas propiedadas del servicio elegido son:"
$servicio | Select-Object -Property * | Format-List

$claseservicio=(Get-Service -Name $name).GetType().FullName

Write-Host "`nEl objeto servicio pertenece a la clase: "$claseservicio

[string]$opc=Read-host -prompt "`nSi quieres ver sus propiedaddes pulsa la tecla(H)_"


if ($opc -eq "h" -or $opc -eq "H"){

    $servicio | Get-member -MemberType Properties

    }
else {

Write-Host "La opción introducida esta mal"
}





<#
clear-host
[String]$nombre=read-host -Prompt "nombre del servicio_"
[System.ServiceProcess.ServiceController]$servicio=get-service -name $nombre 

write-host "las propiedades del servicio q quieres..."
$servicio | select-object -property * | format-list

write-host "el servicio pertenece a la clase: "  $servicio.GetType().FullName

[String]$opcion=read-host -Prompt "...si quieres ver sus propiedades pulsa H ..."
if($opcion -eq "h" -or  $opcion -eq "H"){
  $servicio | get-member -MemberType Properties
}
#>