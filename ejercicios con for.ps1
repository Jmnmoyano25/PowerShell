<#
    cuando ejecute el script:
            proceso_ .....

    el proceso ... tiene PID: ... y  THREADS: ....
    y su estado es:
        thread-1 .... estado: xxxx
        thread-1 .... estado: xxxx
#>

clear-host

$proceso=get-process -Name $(read-host -Prompt "proceso_")
Write-Host "El proceso" $proceso.Name "tiene PID: "$proceso.Id "y THREADS: "$proceso.ThreadsCount | Format-Table

for ([int]$a=0; $a -lt $proceso.Threads.Count; $a++){


Write-Host $proceso.Threads[$a].ThreadState
}

 
