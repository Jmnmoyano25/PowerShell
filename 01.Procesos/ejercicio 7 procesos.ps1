<#
7º) crearos un script con el siguiente contenido:

  clear
  Get-ChildItem -Path C:\Windows\System32\*.msc | ForEach-Object { 
  															Start-Process -FilePath $_.FullName
															write-host "arrancando aplicacion:"  $_.Name
															}

¿¿que es lo que hace?? ¿¿como finalizariais todos los procesos en vez de ir uno por uno ??
#>
  Clear-Host

  $intentar=Get-Process -Name mmc
  


  For ([int]$a=0; $a -lt $intentar.Count-1; $a++) { 
  [System.Diagnostics.Process]$intentar2=$intentar[$a]
  		Stop-Process -id $intentar2.Id
	}

<#

al ejecutar el comando q di se lanzan un monton de apps...
Si abres el administrador de tareas o ves los procesos q hay en el sistema antes y despues de lanzar el comando
 ves q de repente se crean un monton de procesos por cada fichero .msc asociado a un proceso q se llama:  mmc.exe
 ("Microsoft Management Console") <---- pues todos esos procesos con nombre "mmc" son los q tenemos q matar para no ir uno a uno



clear-host

$listaProcesosMMC=get-process -Name mmc  #en esta variable recogemos todos los procesos mmc creados, todos tienen identico nombre, pero diferente PID

for([int]$a=0; $a -lt $listaProcesosMMC.Count-1; $a++){
    [System.Diagnostics.Process]$procesoAhora=$listaProcesosMMC[$a] #...en esta variable recojo el proceso de la lista para el valor del bucle actual
    Stop-Process -Id $procesoAhora.Id -Force

}

#>