<#forech#>
Clear-Host

$hilos=(get-process -Name powershell_ise).Threads
foreach ($unhilo in $hilos){
    Write-Host "hilo TID: "$unhilo.Id"....estado:"$unhilo.ThreadState
}
<#con for, pero es mejor utilizar foreach

for([int]$a=0; $a -lt $hilos.Count-1; $a++){
    $unhilo=$hilos[$a];
    Write-Host "hilo TID: "$unhilo.Id"....estado:"$unhilo.ThreadState
}
#>