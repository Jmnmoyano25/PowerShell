<#
3. hacer un script que te pida:

		-Introduce el nombre de la cuenta de usuario del cual quieres saber su SID:_

  Comprobar que el dato que te meten no esta vacio, y que lo que el usuario introduce es una cuenta valida
  existente en el equipo. Si no es asi, me lo tiene que volver a pedir.
  Si la cuenta existe, me debe mostrar su SID. y luego te debe preguntar lo siguiente:

		A)Eliminar la cuenta
		B)Modificar la PASSWORD de la cuenta
		C)--salir---
	    Introduce Opcion:_

  si el usuario introduce A, se borrara la cuenta, si el usuario introduce B te debera pedir la contraseña 
  nueva y se debera modificar, si el usuario pulsa la C se acabara el script.
   
   
$usuario="juan"
$existe = $(try {
             Get-LocalUser -Name $usuario 
           } catch{
           }) -ne $null
   
   #>
   
 Clear-Host
  
do{
$nombre=Read-Host -Prompt "`tCual es el login de la cuenta"

$cuenta=Get-LocalUser -Name $nombre -ErrorAction Ignore
#$cuentar=Get-LocalUser -Name ($(Read-host -prompt "`tCual es el login de la cuenta")) -ErrorAction Ignore

if($cuenta -eq $null) {
        write-host "no existe esa cuenta..."
    # Se la volvemos a pedir
   $nombre=Read-Host -Prompt "`n`tIntroduce una cuenta valida"


} else {
           #.....aquí ya mostraría el menu, etc, etc....
 $cuenta=Get-LocalUser -Name $nombre
 Write-Host "`nCuenta valida`n`n`tSID`t"$cuenta.SID
 
 }#fin del else
 } while ($cuenta -ne $null)

 <#
 Write-Host "`nCuenta valida`n`n`tSID`t"$cuenta.SID
 
  [String]$opc="C"
 do{
 

 Write-Host "`nA) Eliminar la cuenta"
 Write-Host "B) Modificar la PASSWORD de la cuenta"
 Write-Host "C)--salir---"

 [String]$opc=Read-Host -Prompt "Opción: "
  switch ($opc){
    "A" {
    if ($(try { Get-LocalUser -Name $nombre } catch{}) -eq $null){
    Write-Host "La cuenta ya ha sido eliminada."
    exit
    }
    Remove-LocalUser $nombre

    write-host "Hemos borrado la cuenta "$nombre
    
    break
    }#fin opción 1
    "B" {

    $NuevaPass = Read-Host -AsSecureString

    $UserAccount = Get-LocalUser -Name $nombre
    $UserAccount | Set-LocalUser -Password $NuevaPass

    write-host "`nHemos cambiado tu Password"

    break
    }#fin opción 2
    
    }

 
} while ([string]$opc -ne "C")#fin del while#>

 
 
 