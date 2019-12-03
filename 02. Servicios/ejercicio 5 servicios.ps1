<#
5. Hacer un script q te recorra todos los servicios y PARA CADA SERVICIO compruebe si su estado es "Running" y tiene un tipo de inicio
"Automatic" (propiedad .StartType). Si es asi, preguntar si quieres cambiar para ese servicio el arranque a "Manual" y si te responden
que "SI", cambiar su arranque a "Manual"
#>

Clear-Host

$servicios=get-service

foreach ($servicio in $servicios){
    
    if ($servicio.Status -eq "running" -and $servicio.StartType -eq "Automatic"){
        Write-Host "`nEl servicio" $servicio.Name "esta en estado" $servicio.Status "y con inicio"$servicio.StartType
        [string]$opc=Read-Host "`nQuieres cambiar el inicio del servicio a Manual (S/N)"
        }
        if ($opc -eq "S"){
            Set-Service -name $servicio.name -StartupType Manual

        }

}

<#
clear-host
$listaServicios=get-service #...en esta variable van a estar la lista de objetos de tipo servicio

#como es un conjunto de objetos, nos lo podemos recorrer con un bucle
for([int]$a=0; $a -lt $listaServicios.Count-1; $a++){
    
    [System.ServiceProcess.ServiceController]$servicioVeoAhora=$listaServicios[$a]; #meto en una variable el servicio q estoy tratando en esa posicion de la lista
    
    if($servicioVeoAhora.StartType -eq "Automatic" -and $servicioVeoAhora.Status -ieq "running"){       

        write-host "el servicio: " $servicioVeoAhora.Name "...esta arrancado y con arranque automatico"
        [String]$pregunta=read-host -Prompt "quieres cambiar su arranca a manual (S/N)_"
    
        if($pregunta -ieq "s"){
            Stop-Service -Name $servicioVeoAhora.Name -Force
            set-service -Name $servicioVeoAhora.Name -StartupType Manual
        }
    }

}
#>