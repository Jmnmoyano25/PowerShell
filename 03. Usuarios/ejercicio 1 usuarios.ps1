<#
1. a) hacer un script que te muestre la lista de Cuentas de USUARIO con su SID y despues las cuentas del sistema con su SID
   b) idem para los grupos, locales y del sistema con sus SID respectivos.
   c) hacer un script que te muestre un menu de esta forma:
					1.-Mostrar info de cuentas de usuario
					2.-Mostrar info de grupos 
					3.-Salir
					Opcion:_

     si se pulsa la opcion debera mostrar lo que habeis hecho en el apartado a), si pulsais la opcion 2 lo que habeis hecho en el apartado b)
 Solo acabara el script cuando se pulse la opcion 3.
 #>

 Clear-Host

 while ($opc -ne 3) {

 $usuarios=Get-LocalUser
 $grupos=Get-LocalGroup
 

 Write-Host "1.-Mostrar info de cuentas de usuario"
 Write-Host "2.-Mostrar info de grupos"
 Write-Host "3.-Salir"
 [int]$opc=Read-Host -Prompt "Opción: "

 switch ($opc){
    1 {
    write-host "Para la opción uno:`n`t1-$usuarios=Get-LocalUser`n`t2-Un foreach ($user in $usuarios)`n`t3-Mostramos write-host 'nombre:' $user.Name '... SID:' $user.SID`n"
    
    foreach ($user in $usuarios) {
    
    write-host "nombre:" $user.Name "... SID:" $user.SID
    }
    break
    }#fin opción 1
    2 {
    write-host "Para la opción dos:`n`t1-$grupos=Get-LocalGroup`n`t2-Un foreach ($group in $grupos)`n`t3-Mostramos write-host 'nombre:' $group.Name '... SID:' $group.SID"

    foreach ($group in $grupos) {
    
    write-host "nombre:" $group.Name "... SID:" $group.SID
    }#fin opción 2

    }
  }    break
}$opc=0



