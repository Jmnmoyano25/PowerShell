<#
5º) hacer un script q te pida el nombre de una aplicacion, suspender el proceso de la misma 
y una vez hecho esto comprobar el estado de sus hilos (deberian estar todos en estado Wait o StandBy)
Los hlos tienen una propiedad llamada   .WaiteReason     q te dice la razon de por que estan en ese estado
pues debes mostrarla para cada uno de ellos. 

Te debera ir mostrando mensajes asi:

	nombre de la aplicacion:_ ....
	===> estamos suspendiendo el proceso de la aplicacion: ... <====
	te muestro el estado de sus hilos:
		"el hilo con TID: .... tiene un estado: .... y la razon de su estado Wait es: ...."
		...
#>

Clear-Host

[String]$name=Read-Host -Prompt "Nombre de la app "
[System.Diagnostics.Process]$app=Get-Process -Name $name
$appWait=Wait-Process -Name $name
Write-Host "===> estamos suspendiendo el proceso de la aplicacion: " $appWait "... <===="#al estar en wait-process no seguira el script hasta que se cierre la app.

for ($a=0; $a -lt $app.Threads.Count-1; $a++){
[System.Diagnostics.ProcessThread]$appThread=$app.Threads[$a]

Write-Host "Te muestro el estado de sus hilos:"
Write-Host "El hilo con TID:"$appThread.Id" tiene un estado:"$appThread.ThreadState" y la razón de su esta Wait es:"$appThread.WaitReason
}

<#
clear-host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

write-host "===> estamos suspendiendo el proceso de la aplicacion: ... <===="
Stop-Process -Name $proceso.Name -Force

write-host "`n`n vemos el estado de sus hilos:"
for([int]$a=0; $a -lt $proceso.Threads.Count-1; $a++){
    [System.Diagnostics.ProcessThread]$hiloActual=$proceso.Threads[$a] #...en esta variable metemos el hilo en esa posicion del bucle
    write-host "`t`t el hilo con TID: " $hiloActual.Id "`t`t tiene un estado: " $hiloActual.ThreadState "`t`t la razon: " $hiloActual.WaitReason
}
#>