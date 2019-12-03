<# escript que te pide un aclave y te devuelve las variables difinidas en esa clave...NO LAS SUBCLAVES!!!#>


[String]$rutaclave=read-host -Prompt "intrucuce la ruta de la variable"

[Microsoft.Win32.RegistryKey]$clave=get-item -Path registry::$rutaclave

write-host "`nVariables de la clave $rutaclave"
Write-Host "`n`t`t-----------------------------------"

#$clave.Property | Format-list la propidedad property me devuelve las variables de una clave.

#$clave.Property.GetType().fullname
#System.String[]

#para recuperar todas las subclaves necesito el comando get-itemproperty 

foreach($unaclave in $clave.Property){
    $valor=get-itemProperty -Path registry::$rutaclave -Name $unaclave
    
    Write-Host "nombre variable: " $unaclave "`t`t...valor"$valor
    
}
