<# 5º)
a) hacer un script q te pida el nombre de una aplicacion y mostrar del proceso asociado la fecha y hora
de creacion del mismo  (propiedad .StartTime)

	b) Me gustaria saber cuantas horas, minutos y segundos lleva ejecutandose el mismo, para lo cual necesito
RESTAR de la fecha y hora actual del sistema q te lo da este comando:

	[System.DateTime]::Now

la fecha y hora de creacion del proceso (Pista: mirar el metodo .Substract() de la clase System.DateTime)
#>

clear-host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

write-host "`n`n el proceso ha sido creado: " $proceso.StartTime.ToString()

#la clase DateTime crea objetos del tipo Fecha y Hora (clase DateTime), y la clase TimeSpan son objetos de tipo franja horaria

[TimeSpan]$tiempoejecucion=[System.DateTime]::Now.Subtract($proceso.StartTime)
write-host "...y lleva ejecutandose: `n Horas:"  $tiempoejecucion.Hours "`n Minutos: " $tiempoejecucion.Minutes "`n Segundos: " $tiempoejecucion.Seconds


<#solución Pablo

clear-host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

write-host "`n`n el proceso ha sido creado: " $proceso.StartTime.ToString()

#la clase DateTime crea objetos del tipo Fecha y Hora (clase DateTime), y la clase TimeSpan son objetos de tipo franja horaria

[TimeSpan]$tiempoejecucion=[System.DateTime]::Now.Subtract($proceso.StartTime)
write-host "...y lleva ejecutandose: `n Horas:"  $tiempoejecucion.Hours "`n Minutos: " $tiempoejecucion.Minutes "`n Segundos: " $tiempoejecucion.Seconds

#>