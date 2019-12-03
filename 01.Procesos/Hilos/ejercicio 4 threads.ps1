<#
4º) hacer un script q te pida el nombre de una aplicacion, pues tenemos q mostrar para su proceso el estado
de todos sus hilos de esta forma:

	"el hilo con TID: .... tiene un estado: ...."
	...
	
 (aqui tambien necesitareis un BUCLE para recorreros el conjunto de hilos del proceso)
#>

Clear-Host

[String]$name=Read-Host -Prompt "Nombre de la app "
[System.Diagnostics.Process]$app=Get-Process -Name $name

for ([int]$a=0; $a -lt $app.Threads.Count-1; $a++) {
    [System.Diagnostics.ProcessThread]$appNowThread=$app.Threads[$a]
    Write-Host "`nEl hilo con TID: "$appNowThread.Id "tiene un estado: "$appNowThread.ThreadState
}

<#
clear-host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

for([int]$a=0; $a -lt $proceso.Threads.Count-1; $a++){
    [System.Diagnostics.ProcessThread]$hiloActual=$proceso.Threads[$a] #...en esta variable metemos el hilo en esa posicion del bucle
    write-host "el hilo con TID: " $hiloActual.Id "`t`t tiene un estado: " $hiloActual.ThreadState
}
#>