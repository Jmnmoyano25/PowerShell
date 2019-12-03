<#2º) si te fijas el administrador de tareas te muestra parar cada proceso esta info:
  		nombre, pid, estado, nombre de usuario, cpu, memoria, virtualizacion

 Intenta sacar con la powershell estas propiedades que te da el Administrador de tareas para el proceso q te pidan
(para ver las propiedades de un proceso, con Get-Member -MemberType Properties   
 y para seleccionar las propiedades de un objeto Select-Object -Property propiedad1,...)#>

Clear-Host

[String]$name=read-host -Prompt "`n Aplicación...."
$process=Get-process -Name $name 
$process | Get-Member -MemberType Properties
$process | Select-Object -Property Name,Id,TotalProcessorTime,VirtualMemorySize,PagedMemorySize, @{Name="User"; Expression={$_.StartInfo.Environment["USERNAME"]}} | Format-List


<#solución Pablo

[String]$nombre=read-host -Prompt "nombre de la aplicacion ej: notepad, firefox, powershell_ise, ..._"
[System.Diagnostics.Process]$proceso=get-process -name $nombre

#...hacemos un bucle infinito para mostrar cada segundo los datos del proceso...para romperlo pulsar CTRL+C
while($true){
clear-host
write-host "`t`t emulador administracion de tareas para el proceso " $nombre
write-host "`t`t -----------------------------------------------------------------"

<#
 en la propiedad .StartInfo del objeto proceso hay mucha informacion, variables de entorno, etc...y esa info es un objeto de la clase StartInfo
 q a su vez tiene props y metodos. Tiene una propiedad q es .Environment q te dice variables de entorno de ejecucion del proceso,
 el nombre del usuario q lanzo la aplicacion, etc
 
 p.e para el proceso powershell_ise, para ver estas variables de entornpo: (get-process -name powershell_ise).StartInfo.Environment
 y si quiero recoger alguna de ellas, entre corchetes pongo su nombre, p.e para recuperar la variable de entorno del proceso USERNAME seria:

    (get-process -name powershell_ise).StartInfo.Environment["USERNAME"]

  con select-objetct a la hora de mostrar esta prop. puedo hacerla mas corta, definiendo un alias y se pone asi:
        @{ Name="__alias__"; Expression={__valor__propiedad__} } ===> en el valor de la propiedad, el simbolo: $_   representa el objeto q estas tratando
                                                                    en nuestro caso un proceso


$proceso | Select-Object -Property Name,Id,TotalProcessorTime,VirtualMemorySize,PagedMemorySize, @{Name="User"; Expression={$_.StartInfo.Environment["USERNAME"]}} | Format-List
Start-Sleep -Seconds 1
}
#>