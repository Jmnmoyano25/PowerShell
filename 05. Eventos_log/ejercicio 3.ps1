Clear-Host

$mensajes= get-eventlog -logname security
foreach ($unmensaje in $mensajes){

	if ($unmensaje.EventID -eq 4634){

		$unmensaje

	}
}