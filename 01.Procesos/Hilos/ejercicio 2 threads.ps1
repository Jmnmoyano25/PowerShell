<#
2º)
	a) hacer un script q te pida el nombre de una aplicacion y mostrar la info de su hilo principal (numero 0)

	Si quieres saber la clase a la q pertenece un hilo ejecuta para
	dicho hilo lo siguiente:
									.GetType().FullName <--- te deberia salir System.Diagnostics.ProcessThread
									
	Quiero q antes de mostrar la info del hilo principal me salga un mensaje asi:
	
		"el proceso q se crea para la aplicacion: .... tiene un hilo principal numero 0 q es de tipo: ......"
	
	
	b)saca ahora de este hilo estas propiedades pero en formato Tabla:
				id, BasePriority, CurrentPriority, PriorityLevel, ThreadState


#>

Clear-Host

[String]$name=Read-Host -Prompt "Nombre de la app: "
[System.Diagnostics.Process]$app=Get-Process -Name $name
[System.Diagnostics.ProcessThread]$appPrincipalThread=$app.Threads[0];

Write-Host "`n El proceso que se crea para la aplicación: "$app.Name "teine un hilo principal numero 0 que es de tipo: "$appPrincipalThread.GetType().Fullname

$appPrincipalThread | Select-Object -Property Id, BasePriority, CurrentPriority, PriorityLevel, ThreadState | Format-Table



<#
clear-host


[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre
[System.Diagnostics.ProcessThread]$hiloPrincipal=$proceso.Threads[0];

write-host "el proceso q se crea para la aplicacion: " $nombre "`t`t tiene un hilo principal de esta clase o tipo: " $hiloPrincipal.GetType().FullName
$hiloPrincipal | Select-Object -Property id,BasePriority, CurrentPriority, PriorityLevel, ThreadState | Format-Table

#>