[int]$opc=0

while ($opc -ne 4){

clear-host
[String]$nombre=read-host -Prompt "nombre servicio_"
[System.ServiceProcess.ServiceController]$servicio=get-service -name $nombre

write-host "1.mostrar nombre,estado, dependencias"
write-host "2.parar servicio"
write-host "3.arrancar servicio"
Write-Host "4.salir del script"

[int]$opc=read-host -Prompt "opcion_"
switch ($opc){ 
<#if ($opc -eq 1) {
    write-host $servicio.Name  $servicio.Status $servicio.DependentServices
 } elseif($opc -eq 2) {
    
    #...antes de parar el servicio tengo q ver si su
    # estado es "Running"

        if ($servicio.Status -ieq "running") {
            #para parar el servicio lo pueddo hacer de 2 formas
            Stop-service -name $servicio.Name -Force
            
            #$servicio.Stop()

        } else {
            write-host "el servicio " $servicio.Name " no esta ejecutandose"
        }


 } elseif ($opc -eq 3) {
        
    #...antes de arrancar el servicio tengo q ver si su
    # estado es "Stopped"
         if ($servicio.Status -ieq "stopped") {
            #para arrancar el servicio lo puedo hacer de 2 formas
            Start-service -name $servicio.Name
            
            #$servicio.Start()

        } else {
            write-host "el servicio " $servicio.Name " esta ya ejecutandose"
        }


 }#>
 1{
 write-host $servicio.Name  $servicio.Status $servicio.DependentServices
 break
 }
 2 {
    
    #...antes de parar el servicio tengo q ver si su
    # estado es "Running"

        if ($servicio.Status -ieq "running") {
            #para parar el servicio lo pueddo hacer de 2 formas
            Stop-service -name $servicio.Name -Force
            
            #$servicio.Stop()

        } else {
            write-host "el servicio " $servicio.Name " no esta ejecutandose"
        }
 break
 }
 3{
        
    #...antes de arrancar el servicio tengo q ver si su
    # estado es "Stopped"
         if ($servicio.Status -ieq "stopped") {
            #para arrancar el servicio lo puedo hacer de 2 formas
            Start-service -name $servicio.Name
            
            #$servicio.Start()

        } else {
            write-host "el servicio " $servicio.Name " esta ya ejecutandose"
        }

 break
 }
 }
 
 }