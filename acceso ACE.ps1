<#
añadir una nueva regla de acceso ACE a un fichero:
PRUEBA.txt ( esta en docuementos C:\Users\jmnmo\OneDrive\Documentos\)
1º paso) recuperar todo el security-descripto del fichero con command: get-acl
2º paso) nos tenemos que crear una nueva regla de acceso ACE y añadirlo al security-despcriptor del fichero
3º paso) añado esa nueva regla de acceso al security-descriptor del fichero con:
         -metodo:
             .SetAccesRule(nuevaACE)
         -y despues:
            variable_SecDesc | Set-Acl -Path ruta/recurso
#>
Clear-host

$fichero=get-acl -path C:\Users\jmnmo\OneDrive\Documentos\PRUEBA.txt

Write-Host "1º paso"
Write-Host "`t security-descriptor del fiechero: owner, grupo-prioritario, DACL (reglas acceso), SACL (reglas auditoria)"
Write-Host "`t -------------------------------------------------------------------------------"

$fichero | Select-Object -Property * | Format-List

Write-Host "2º paso"
Write-Host "`t me creo un objeto FileAccessRule"
Write-Host "`t --------------------------------------------------------------------------------"

<#
(IdentityReference   $usuariosGrupo  pero hay que coger NTAaccount ó SecurityIdentifier
 FileSystemRights    $permisos
 AccessControlType   $acceso
#>
[String]$nombreUG=Read-Host -prompt  "nombre de usuario o grupo"
$usuarioGrupo=[System.Security.Principal.NTAccount]::new($env:COMPUTERNAME + "\" +$nobreUG)

[String] $tipoper=Read-Host -Prompt "que permisos le damos: Read, Write, FullControl"
 if ($tipoper -ne "Read" -and 
    $tipoper -ne "Write" -and 
    $tipoper -ne "FullControl"){
    Write-Host "...no se permite ese tipo de persimos..."
    exit
}
$permisos=[System.Security.AccessControl.FileSystemRights]::$tipoper

[String]$tipoacceso=Read-Host -Prompt "que tipo de acceso le damos: Allow, Deny"
 if ($tipoacceso -ne "Allow" -and 
    $tipoacceso -ne "Deny"){
    Write-Host "...no se permite ese tipo de acceso..."
    exit
}
$acceso=[System.Security.AccessControl.AccessControlType]::$tipoacceso

$nuevaACE=[System.Security.AccessControl.FileSystemAccessRule]::new($usuarioGrupo,$permisos,$acceso);

Write-Host "3º paso"
Write-Host "`t añadimos una nueva regla al Security-Descriptor del reucurso"
Write-Host "`t --------------------------------------------------------------"

$ficheroSD.SetAccessRule($nuevaACE)
$ficheroSD | Set-Acl -Path C:\Users\jmnmo\OneDrive\Documentos\PRUEBA.txt