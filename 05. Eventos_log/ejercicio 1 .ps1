<#1º script que te pida el nombre de un fichero .evtx que exista y mostrar de el estas propiedades:
-nombre del fichero
-nombre que se muestra
-máximo tamaño
-nº de eventos que tiene (entries)

después, preguntar ¿QUIERES BORRAR EL LOG? Si es que SI vaciar el fichero log; ver comando1
	clear-eventlog
#>

clear-host
Get-EventLog -List 

[string]$nombre=Read-Host -Prompt "`nNombre del archivo .evtx Application, HardwareEvents, etc..."
$logs=Get-EventLog -List 

foreach($unolog in $logs){
    if($nombre -eq $unolog.Log){

        $nombrelog=$unolog.Log
        $nombredisplaylog=$unolog.LogDisplayName
        $maxflowlog=$unolog.MaximumKilobytes
        $numeroentries=$unolog.entries.count

        Write-Host "Nombre: "$nombrelog
        Write-Host "Nombre display: "$nombredisplaylog
        Write-Host "Máximo tamaño: "$maxflowlog
        Write-Host "Numero de entradas: "$numeroentries

        [string]$opcion=Read-Host -Prompt "borrar las entradas del log SI o NO"
        if($opcion -ieq "si"){
             Clear-EventLog $unolog.log -Confirm
        }
    }
}

