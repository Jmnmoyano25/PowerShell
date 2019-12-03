<#6º) mostrar por pantalla aquellos procesos q esten segun el admin.de tareas en estado "Suspendido"
(si su propiedad .Responding vale $true, entonces hay q mostrarle)

(aqui necesitareis un BUCLE para recorreros cada uno de los procesos)
#>

Clear-Host

$procesos=get-process

for([int]$a=0; $a -lt $procesos.Count-1; $a++){

    [System.Diagnostics.process]$procesoViendo=$procesos[$a]
    
    if ($procesoViendo.Responding -eq "true"){
    Write-Host "`n El proceso: "$procesoViendo.name"`n tiene un estado: "$procesoViendo.Threads[0].ThreadState
    }
}
<#
$procesos=get-process #....en esta variable metemos el conjunto de tooooodos los procesos, una lista de procesos

for([int]$a=0; $a -lt $procesos.Count-1; $a++){

    [System.Diagnostics.process]$procesoViendo=$procesos[$a] #....en esta variable meto el proceso de la lista q estoy viendo en esa posicion del bucle
    if ($procesoViendo.Responding -eq $true){
        write-host "`n`nel proceso:" $procesoViendo.Name " `t`t tiene su hilo principal en estado: " $procesoViendo.Threads[0].ThreadState
        
        [String]$opcion=read-host -Prompt "Quieres matar este proceso [S/N]_"
        if($opcion -ieq "s"){
            stop-process -name $procesoViendo.Name -Force #...tambien se puede hacer usando el metodo .Kill() del objeto proceso, asi: $procesoViendo.Kill()
            
        }
    }
}


es el bucle for q esta hecho en el ejercicio 4....

#>