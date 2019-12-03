[int]$variable1=$(Read-host -Prompt "escribe un numero entero: ")
[int]$varibale2=$(Read-host -Prompt "Escribe otro número entero: ")
Write-Host "La suma de" $variable1" y "$variable2" es "($variable1+$varibale2)