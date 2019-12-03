<#
3º) haz un script q te pida el nombre de una aplicacion y para el hilo principal de su proceso, mostrar
su prioridad. Si es NORMAL o menor, preguntar si quieres subirla a:
		
		TimeCritical, Highest, AboveNormal

cambiarlo al nuevo valor y mostrar si el cambio se ha llevado a cabo.
#>

Clear-Host

[String]$name=Read-Host -Prompt "Nombre de la app "
[System.Diagnostics.Process]$app=Get-Process -Name $name
[System.Diagnostics.ProcessThread]$appPrincipalThread=$app.Threads[0];

if ($appPrincipalThread.PriorityLevel -le "normal") {

    [String]$newPriority = Read-Host -Prompt "`n Sube la prioridad a TimeCritical, Highest, AboveNormal"

    $appPrincipalThread.PriorityLevel=$newPriority

    }
Write-Host "`n La nueva prioridad es: "$appPrincipalThread.PriorityLevel

<#
clear-host


[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.ProcessThread]$hiloPrincipal=(get-process -name $nombre).Threads[0];

write-host "la prioridad del hilo principal del proceso es: "  $hiloPrincipal.PriorityLevel


[String]$nuevaPrioridad=read-host -Prompt "puedes cambiarla a TimeCritical, Highest o AboveNormal ..."

if($nuevaPrioridad -eq "TimeCritical" -or
   $nuevaPrioridad -eq "Highest" -or
   $nuevaPrioridad -eq "AboveNormal"){
   
            $hiloPrincipal.PriorityLevel=$nuevaPrioridad #...cambiamos prioridad....
            write-host "`n`n ahora la prioridad del hilo principal del proceso es: "  $hiloPrincipal.PriorityLevel
   
   }
#>