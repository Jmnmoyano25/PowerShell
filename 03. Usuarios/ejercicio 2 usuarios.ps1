<#
2. hacer un script que sirva para generar cuentas de usuario, para lo cual te debe pedir:

	-Cual es el login de la cuenta:_
	-Cual es su password:_
	-la Cuenta va a estar activa[yes/no]:_
	-El usuario puede cambiar la password[yes/no]:_
	-Cuando el usuario inicia sesion debe introducir su password[yes/no]:_
	-Comentarios de la cuenta[datos adicionales]:_

Crear la cuenta si los parametros estan ok (si falla alguno mostrar el mensaje de error y volver al principio)
 y si se crea bien, mostrar el SID que se le ha asociado.
 #>

 Clear-Host

#do {

 Write-Host "Vamos a crear una cuenta de usuario: `n"

 [String]$nombre=Read-Host -Prompt "`t-Cual es el login de la cuenta "
 [System.Security.SecureString]$pass=Read-Host "`t-Cual es su password "-AsSecureString
 [String]$activa=Read-Host -Prompt "`t-La cuenta va a estar activa [yes/no]"
 [String]$cambioPass=Read-Host -Prompt "`t-El usuario puede cambiar la contraseña [yes/no]"
 [String]$introPass=Read-Host -Prompt "`t-Cuando el usuario inicia sesion debe introducir su password[yes/no]"
 [String]$descripcion=Read-Host -Prompt "`t-Comentarios de la cuenta[datos adicionales]"
 
 
 

 Write-Host "1º Creamos la cuenta"

 #[String]$nombre=Read-Host -Prompt "`tCual es el login de la cuenta "

 New-LocalUser -Name $nombre -Password $pass -Description $descripcion 


$cuentaGet=Get-LocalUser -Name $nombre

 Write-Host "----------------------`n"
 

 Write-Host "2º Estado de la cuenta"
  
 if ($activa -eq "yes"){

 $cuentaGet | Enable-LocalUser
 Write-Host "`nLa cuenta esta activada"
 
 }else{
 $cuentaGet | Disable-LocalUser
 Write-Host "`nLa cuenta esta desactivada"
 }
 Write-Host "----------------------`n"

 Write-Host "3º Estado de la contraseña"

 if ($cambioPass -eq "yes"){

 Set-LocalUser -Name $nombre -UserMayChangePassword $true
 Write-Host "`nEl usuario podra cambiar la contraseña"
 
 }else{
 Set-LocalUser -Name $nombre -UserMayChangePassword $false
 Write-Host "`nEl usuario no podra cambiar la contraseña"
 }
 Write-Host "----------------------`n"

<# Write-Host "4º Estado de inicio de sesión"

  if ($introPass -eq "yes"){

 Write-Host "`nSe pedira la contraseña al usuario" $nombre
 
 }else{
 Set-LocalUser -Name $nombre -nopassword
 Write-Host "`nNo se solicitara la contraseña al usuario"$nombre
 }#>

 
#}while (if 
$cuentaGet=Get-LocalUser -Name $nombre
 
 Write-Host "`nLa cuenta tiene las siguientes caracteristicas"$cuentaGet
 Write-Host "-------------------------------------------------------------"
 Write-host "`nLa cuenta de ususario" $nombre "se le ha asociado un SID: "$cuentaGet.SID




