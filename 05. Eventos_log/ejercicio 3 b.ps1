Clear-Host

$mensajes= get-eventlog -logname security
foreach ($unmensaje in $mensajes){

	if ($unmensaje.EventID -eq 4624){

		write-host “...viendo timegenereated de fecha/hora inicio de sesión….”
		write-host $unmensaje.TimeGenerated

	}
}