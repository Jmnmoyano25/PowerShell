<#script que te pida el nombre de un fichero .evtx que exista y mostrar de el estas propiedadees:
-nombre del fichero
-nombre que se muestra
-máximo tamaño
-nº de eventos que tiene (entries)#>

Get-EventLog -List

[string]$nombre=Read-Host -Prompt "`nDame un Eventlog correcto de la lista anterior"
$evento=Get-EventLog -logname $name
$por=Get-Eventlog -LogName $name | Select-Object -Property log,logdisplayname,maximumkilobytes,entries| Format-List

Write-Host "Las propiedades son: "$por