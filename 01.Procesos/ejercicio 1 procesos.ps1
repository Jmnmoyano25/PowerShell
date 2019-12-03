<#1º)
   hacer un script q te pida el nombre de una aplicacion y mostrar el proceso creado para la misma. 
		(Ir al Administrador de tareas y mirar si coincide el PID.)
		
		
	Todos los objetos de cualquier clase tiene un metodo, llamado .GetType() q te devuelve el tipo de objeto
	q es (la clase a la q pertenecen). Si quieres saber la clase a la q pertenece un proceso ejecuta para
	dicho proceso lo siguiente:
									.GetType().FullName <--- te deberia salir System.Diagnostics.Process
	
** PARA SABER EL GETTYPE PRIMERO HAY QUE ASIGNAR EL PROCESO A UNA VARIABLE**	
							
	Quiero q antes de mostrar la info del proceso q me piden por teclado me salga un mensaje asi:
	
		"el proceso q se crea para la aplicacion: .... es de tipo: ......"
LA CLASE DE NOTEPAD ES System.Object[], no System.Diagnostic.Process, por eso da un error, 
#>

clear-host

[String]$ap=Read-host -Prompt "Nombre de la aplicación"
$proceso=Get-Process -Name $ap

Write-Host "`n`tEl proceso q se crea para la aplicacion: " $proceso "es de tipo: " ($proceso).GetType().FullName
$proceso | Select-Object -Property * | Format-List

<#solución pablo

clear-host

[String]$nombre=read-host -Prompt "nombre de la aplicacion ej: notepad, firefox, powershell_ise, ..._"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

#el `n es un caracter especial q da un salto de linea, y el `t es un tabulador...
write-host "`n`t el proceso q se crea para la aplicacion_ " $nombre " .... es de tipo_ " $proceso.GetType().FullName
$proceso | Select-Object -Property * | Format-List
#>