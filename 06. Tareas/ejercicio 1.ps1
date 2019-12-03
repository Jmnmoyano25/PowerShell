<#Ejercicio 1
Introducir el nombre de una tarea y mostrar:
    -Descripción, ruta en el pool, y nombre
    -la acción que ejecuta
    -programación 
    -triggers
#>
Clear-Host

[String]$nametask=Read-Host -Prompt "nombre de la tarea, ejemplo (editor)"
$tarea=Get-ScheduledTask -TaskName $nametask

write-host "`n Descripción, ruta en el pool y nombre"

$tarea | Select-Object Description, TaskPath, Taskname, id | Format-List

Write-Host "`n La acción que se ejecuta"

$accion=($tarea).Actions

foreach ($acciones in $accion){
Write-host "estas son las acciones:" $acciones.Execute
}


Write-Host "`n La Programación: "
$accion | Select-Object -Property settings


Write-Host "`n Los Triggers: `n"

$trigger=($tarea).Triggers
foreach ($triggers in $trigger){
Write-Host "Habilitado: " $triggers.Enabled
Write-Host "Fecha de inicio: " $triggers.StartBoundary
}

