<#3º) hacer un script q te pida el nombre de una aplicacion y mostrar del proceso creado para la misma la 
prioridad q tiene dicho proceso. Si es NORMAL preguntar a q valor lo quieres cambiar:

	RealTime, High, AboveNormal, BelowNormal, Idle 

y cambiarlo. Para ver si se ha cambiado, mostrar de nuevo la prioridad del proceso a ver si se ha cambiado.


(Get-Process -Name notepad).Threads.Count#>
Clear-Host

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

if ($proceso.PriorityClass -eq "Normal"){

    write-host "la prioridad asociado a su proceso es NORMAL `n`n" #...el `n es un caracter q significa nueva linea
    [String]$nuevaPrioridad=read-host -Prompt "valor nuevo de prioridad base proceso RealTime, High, AboveNormal, BelowNormal, Idle ..."
    
    if ($nuevaPrioridad -eq "RealTime" -or 
        $nuevaPrioridad -eq "High" -or 
        $nuevaPrioridad -eq "AboveNormal" -or
        $nuevaPrioridad -eq "BelowNormal" -or
        $nuevaPrioridad -eq "Idle"){

            $proceso.PriorityClass=$nuevaPrioridad;
            write-host "...la nueva prioridad del proceso es ... " $proceso.PriorityClass
        
        }
}



<#solución Pablo

clear

[String]$nombre=read-host -Prompt "nombre aplicacion ej: powershell_ise, notepad, firefox,... _"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

if ($proceso.PriorityClass -eq "Normal"){

    write-host "la prioridad asociado a su proceso es NORMAL `n`n" #...el `n es un caracter q significa nueva linea
    [String]$nuevaPrioridad=read-host -Prompt "valor nuevo de prioridad base proceso RealTime, High, AboveNormal, BelowNormal, Idle ..."
    
    if ($nuevaPrioridad -eq "RealTime" -or 
        $nuevaPrioridad -eq "High" -or 
        $nuevaPrioridad -eq "AboveNormal" -or
        $nuevaPrioridad -eq "BelowNormal" -or
        $nuevaPrioridad -eq "Idle"){

            $proceso.PriorityClass=$nuevaPrioridad;
            write-host "...la nueva prioridad del proceso es ... " $proceso.PriorityClass
        
        }
}
#>

 
