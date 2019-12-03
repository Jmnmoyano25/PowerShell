[int]$opc=0

while ($opc -ne 4) {

clear-host
[String]$nombre=read-host -Prompt "nombre servicio_"
[System.ServiceProcess.ServiceController]$servicio=get-service -name $nombre

write-host "1.mostrar nombre,estado, dependencias"
write-host "2.parar servicio"
write-host "3.arrancar servicio"
write-host "4. ---SALIR DEL SCRIPT---"

[int]$opc=read-host -Prompt "opcion_"

switch ($opc)
{
    1 {
        write-host $servicio.Name $servicio.Status $servicio.DependentServices
        break
        }

    2 {
        if ($servicio.Status -ieq "running") {
            #para parar el servicio lo pueddo hacer de 2 formas
            Stop-service -name $servicio.Name -Force
            
            #$servicio.Stop()

        } else {
            write-host "el servicio " $servicio.Name " no esta ejecutandose"
        } 
        break   
      }

    3 {
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
 
 write-host "....espere un momento para continuar...." 
 start-sleep -Seconds 10

 #Read-Host -prompt "presiona una tecla para continuar"
}