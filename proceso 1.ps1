using namespace System.Diagnostics

<#
    script que recupera la prioridad del hilo principal de la aplicación que metamos y la eleva a High si es Normal
#>

[string]$ap=Read-host -Prompt "nombre de la aplicación"
[Process]$proceso=Get-Process -Name $ap
[ProcessThread]$hilo=$proceso.Threads[0];
$prioridad=$hilo.PriorityLevel.value__

#...preguntamos si la prioridad es NORMAL el valor normal es 8
if ($prioridad -ne 8){
    #...sumbimos la prioridad del hilo a HIGT
    Write-Host "subimos la prioridad a HIGH"
    
   (Get-Process -name notepad).Threads[0].PriorityLevelHigt

} else {
    Write-Host "la prioridad no es NORMAL, no la subimos"
}

