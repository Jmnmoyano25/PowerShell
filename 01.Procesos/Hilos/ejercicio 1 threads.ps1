<#
1º) hacer un script q te pida el nombre de una aplicacion y mostrar el siguiente mensaje por pantalla:

 	"el proceso de nombre: ..... tiene un PID: ....  y tiene este numero de THREADS: ....."
#>

Clear-Host

[String]$name=read-host -Prompt "Nombre de una aplicación: "
[System.Diagnostics.Process]$app=Get-Process -name $name

    Write-Host "`n El proceso de nombre: "$name "`t tiene un PID: "$app.Id " y tiene este número de THREADS: "$app.Threads.Count
<#
1º)

clear-host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

write-host "el proceso de nombre: " $nombre "`t`t tiene un PID: " $proceso.Id "`t`t y tiene este numero de THREADS:" $proceso.Threads.Count
#>