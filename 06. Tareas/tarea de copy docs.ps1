<#Hacer un script que programe una tarea que se llama “BackUpFicheros” que se ejecute:
- todos los dias a las 21:45


1º Crear la acción de la tarea programada.
2º Crear el gatillo (trigger).
3º Crear la tarea programada en la computadora.
4º Crear la tarea programada en la memoria. 

	Tiene que hacer una copia de todos tus ficheros con extensión .doc, .docx, .txt, .pdf, .xls, .odt
 que se encuentran en tu directorio “Documentos” y los almacene en un pendrive que se conecta como unidad E:\
 #>

 clear-host

write-host "`n`t 1º-definimos la accion o ejecutable de la tarea"
$accion=New-ScheduledTaskAction -Execute "Powershell.exe -Command {Copy-item $env:HOMEPATH\Documents\*.odt *.doc *. docx *.xls   E:\ -Recurse  }"

write-host "`n`t 2º-definimos programacion de la misma"
$programacion=New-ScheduledTaskTrigger -Daily -At 21:45pm

write-host "`n`t 3º-definimos el usuario que la lanza" 
$usuario=new-scheduleTaskPrincipal -UserId $env:USERNAME

write-host "`n`t 4º-registramos tarea.."
Register-ScheduledTask -TaskName "BackUpFichero" -Action $accion -Trigger $programacion -Principal $usuario
