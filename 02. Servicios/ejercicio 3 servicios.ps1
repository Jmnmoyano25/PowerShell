<#
3. Hacer un script que te pida:

	-Introduce el nombre de un servicio:_

 comprobar el estado del servicio, y si esta "Running" (ejecutandose) mostrar este menu:

				A-Parar Servicio
				B-Pausar el Servicio
				C-Eliminar el Servicio (comprobar despues q se elimina del registro, ojo q es peligroso)
				D-Cambiar configuracion del servicio (su ARRANQUE solo, propiedad .StartType)
			Opcion:_ <-------------- SI LA OPCION NO ESTA ENTRE A,B,C,D me debera mostrar otra vez este MENU
			
#>

clear-host
[String]$nombre=read-host -prompt "nombre del servicio_"
[System.ServiceProcess.ServiceController]$servicio=get-service -name $nombre

#if ($servicio.Status -eq "running"){

while ($opcion -ne "E"){
 write-host "A. parar servicio"
 write-host "B. pausar servicio"
 write-host "C. eliminar servicio"
 write-host "D. cambiar arranque servicio"
 write-host "E. ---SALIR----"

 [String]$opcion=read-host -Prompt "Opcion_"
 switch($opcion){
    "A" {
        Stop-Service -name $nombre
        #$servicio.Stop()
        break
        }

    "B" {
          Suspend-service -name $nombre
          #$servicio.Pause()
          break
        }

    "C" {
          Write-Host "no se elimina por que es muy peligroso"
          #...se hace con WMI.....
          #(Get-WmiObject -clas win32_service -Filter "Name=$nombre").Delete()
          break
        }

    "D" {
         [String]$arranque=read-host -prompt "como quieres el arranque [Manual,Automatic]_"
         if ($arranque -ne "Automatic" -or $arranque -ne "Manual") {
                write-host "...opcion de arranque incorrecta.."
                break
        }
            Set-Service -name $nombre -StartupType $arranque
            break
        }

    "E" {
            exit;
    }

    * {
        write-host "...opcion incorrecta, introduce A-D..."
         }

 }
 Start-Sleep -Seconds 10

 } #fin del while menu

#}#fin del if estado servicio
