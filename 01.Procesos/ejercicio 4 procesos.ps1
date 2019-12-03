<#4º) en el Administrador de tareas, los procesos q estan en estado "Suspendido" son los q tienen todos 
sus hilos en estado "Wait" o "StandBy". Hay una propiedad de la clase Process q te dice si un estado esta
suspendido o no, q es:
						.Responding ---> te devuelve un boolean, si es true esta suspendido 
																si es false esta ready o ejecutandose				
		

buscar un proceso en el adminstrador de tareas q este suspendido, y mostrar en la powershell el valor
de esta propiedad para el proceso, y el valor de la propiedad .ThreadState para su hilo principal 

Despues preguntar si quieres matar ese proceso, y si la respuesta es q SI, se debe finalizar el proceso
#>

Clear-Host

[String]$name=read-host -Prompt "Aplicación: "
[System.Diagnostics.Process]$process=Get-Process -name $name

Write-Host "`n El proceso esta en estado" $process.Responding
Write-Host "`n El valor del hilo principal es: " $process.Threads[0].ThreadState

if ($process.Responding -eq "True"){
    
Write-Host "`n El proceso "$proceso.ProcessName "esta en estado suspendido"
[String]$kill=Read-Host -Prompt "`n Quieres matar el proceso si o no: "

    if ($kill -eq "si"){
      
      $process.Kill()
      Write-Host "´n El proceso ya esta matado"
      }
    else{
    Write-Host "`n El proceso no ha sido matado"
    }
  }

<#solución Pablo

clear-host

#...buscamos dentro de los procesos los q estan en estado suspendido, me tengo q recorrer todos los procesos
# y PARA CADA PROCESO ver si su propiedad .Responding es true

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
#>

 