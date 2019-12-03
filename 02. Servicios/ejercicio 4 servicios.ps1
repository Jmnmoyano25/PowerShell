<#
4.  Hacer un script que te muestre el siguiente MENU:

		1-Servicio de actualizaciones Automaticas (nombre:wuauserv)
		2-Servicio de Defensa contra virus,... de Windows (nombre: WinDefend)
		3-Servicio de Centro de seguridad de Windows (nombre: Wscsvc)
		4-Servicio de Reporte de Errores de Windows (nombre: Wersvc)
		5-Servicio de Programacion de Tareas Automaticas (nombre:Schedule)
		6-------SALIR--------
		 Opcion:_ <-------------------te tendra que mostrar este menu hasta que se pulse la opcion 6

 En cada opcion tendras que comprobar el estado del servicio, y si esta parado deberas iniciarlo. Ademas comprobaras que su inicio
esta en AUTOMATICO y si no es asi deberas modificar dicho servicio para que asi sea y el servicio se inicie de forma automatica por
el SCM en el arranque del sistema. <---- para modificar un servicio teneis el comando SET-SERVICE
#>

Clear-Host
do {
 Write-Host "`t`t`tMENU:"
 Write-Host "`n1-Servicio de actualizaciones Automaticas (nombre:wuauserv)"
 Write-Host "2-Servicio de Defensa contra virus,... de Windows (nombre: WinDefend)"
 Write-Host "3-Servicio de Centro de seguridad de Windows (nombre: Wscsvc)"
 Write-Host "4-Servicio de Reporte de Errores de Windows (nombre: Wersvc)"
 Write-Host "5-Servicio de Programacion de Tareas Automaticas (nombre:Schedule)"
 Write-Host "6-------SALIR--------"

[int]$opc=read-host -Prompt "Escribe una opción: "
[String]$nameopc=""
switch ($opc){
        1{
            $nameopc="wuauserv";
            break;
        }
        2{
            $nameopc="WinDefend";
            break;
        }
        3{
            $nameopc="Wscsvc";
            break;
        }
        4{
            $nameopc="Wersvc";
            break;
        }
        5{
            $nameopc="Schedule";
            break;
        }
        6{
            Exit;
        }
     }#fin del switch
     $servicio=Get-Service -Name $nameopc

     Write-Host "`nEl estado actual del servicio es: "$servicio.Status

     if ($servicio.Status -eq "Stopped"){
        Start-Service -Name $nameopc
        }
        Write-Host "`nEl servicio esta ahora en: "$servicio.Status
     
     Write-Host "`nEl inicio del servicio esta en: "$servicio.StartType

     if ($servicio.StartType -eq "Manual"){
        Set-Service -name $nombre -StartupType Automatic
        }
        Write-Host "`nEl servicio iniciara ahora de forma: "$servicio.StartType

}while ($opc -ne 6) #fin del while



<#
do {
	clear-host
	write-host "1-Servicio de actualizaciones Automaticas (nombre:wuauserv)"
	write-host "2-Servicio de Defensa contra virus,... de Windows (nombre: WinDefend)"
	write-host "3-Servicio de Centro de seguridad de Windows (nombre: Wscsvc)"
	write-host "4-Servicio de Reporte de Errores de Windows (nombre: Wersvc)"
	write-host "5-Servicio de Programacion de Tareas Automaticas (nombre:Schedule)"
	write-host "6-------SALIR--------"

	[int]$opcion=read-host -Prompt "Opcion_"
	
	[String]$nombre=""
	switch($opcion){
	    1{ $nombre="wuauserv"; break; }
	    2{ $nombre="windefend"; break; }
	    3{ $nombre="wscsvc"; break; }
	    4{ $nombre="wersvc"; break; }
	    5{ $nombre="schedule"; break; }
	    6{ exit }
	}

	[System.ServiceProcess.ServiceController]$servicio=get-service -name $nombre

	if($servicio.Status -ieq "stopped") { 
	        write-host "...el servicio" $nombre " esta parado, lo arrancamos..."
	        $servicio.Start()
	        }

	if($servicio.StartType -ne "Automatic") {
	        write-host "...cambiando el tipo de inicio del servicio a Automatic..."
	        set-service -Name $nombre -StartupType Automatic
	}

	Start-Sleep -Seconds 10

} while ($opcion -ne 6)
#>