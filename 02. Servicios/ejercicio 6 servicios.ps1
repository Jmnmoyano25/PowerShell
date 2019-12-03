<#
6. Hacer un script que te recorra todos los servicios y PARA CADA SERVICIO compruebe que son de tipo SHARED o compartidos, es decir, 
que comparten BCP aunquesus hilos sean diferentes; su PATHNAME el ejecutable del servicio es SVCHOSTS.EXE
(se distinguen porque su propiedad .ServiceType aparece "Win32ShareProcess")

Deberas mostrar su Nombre y su estado

#>

Clear-Host

$servicios=Get-Service

foreach ($servicio in $servicios){
    
    if ($servicio.ServiceType -imatch "Win32ShareProcess"){
           
    Write-Host "`n`tEl servicio"$servicio.Name"esta en estado"$servicio.Status
    }
}

<#
clear-host

$listaServicios=get-service #...en esta variable van a estar la lista de objetos de tipo servicio


#como es un conjunto de objetos, nos lo podemos recorrer con un bucle
for([int]$a=0; $a -lt $listaServicios.Count-1; $a++){

    [System.ServiceProcess.ServiceController]$servicioVeoAhora=$listaServicios[$a]; #meto en una variable el servicio q estoy tratando en esa posicion de la lista
    
    #el operador -match o -imatch busca si en un string contiene o no un conjunto de caracteres, el -imatch no distingue mays de mins
    if($servicioVeoAhora.ServiceType -imatch "win32shareprocess"){
        write-host "nombre:_ " $servicioVeoAhora.Name "....... estado:_ " $servicioVeoAhora.Status
    }       

}
#>