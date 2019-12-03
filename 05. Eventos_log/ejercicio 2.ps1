<#2º script que te pida el nombre de un log y modificar del log (del fichero donde se almacena) estas caracteristicas

	-política de cambios cuando alcanza su tamaño máximo
	(pedirlo por teclado)
	-establecer nuevo tamaño máximo
NOTA: para modificar caracteristicas de un log, VER COMANDO:
	set-eventlog#>


Clear-Host

Get-EventLog -List 

[string]$nombre=Read-Host -Prompt "`nNombre del archivo .evtx Application, HardwareEvents, etc..."
$logs=Get-EventLog -List 
foreach($unolog in $logs){
    if($nombre -eq $unolog.Log){
    Write-Host "`nvamos a cambiar la politica de tamaño máximo"

            #[System.Diagnostics.OverflowAction]$maximolog=$unolog | limit-eventlog -OverflowAction  

            $unolog| Limit-EventLog -MaximumSize 20kb

            write-host "¿Que acción quieres tomar con respecto al maximo llenado del log?"
            write-host "1.DoNotOverwrite"
            write-host "2.OverwriteAsNeeded"
            write-host "3.OverwriteOlder"

            [int]$opc=Read-Host -Prompt "`nOpcion"
            switch ($opc)
            {
                
                1 { write-host "La nueva seguridad es "$unolog | limit-eventlog -OverflowAction DoNotOverwrite
                break
                }
                2 { write-host "La nueva seguridad es "$unolog | limit-eventlog -OverflowAction OverwriteAsNeeded
                break
                }
                3 { write-host "La nueva seguridad es "$unolog | limit-eventlog -OverflowAction OverwriteOlder
                break
                }
              

        }
    }
}