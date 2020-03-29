function Stop-All-Docker {
    docker ps -q | ForEach-Object { docker stop $_ }
}

function Remove-All-Docker {
    docker ps -q | ForEach-Object { docker rm --force $_ }
}

function Show-All-Docker {
    docker ps -a
}

function Debug-Docker {
    param(
        [Parameter(Mandatory=$true,
        HelpMessage="Container to search for")]
        [String]$containerName,

        [Parameter(Mandatory=$false,
        HelpMessage="Command to run")]
        [String]$command = "bash"
    )

    docker ps -a | select-string -pattern $containerName | ForEach-Object {
        $_.Line.Split(" ")[0]
    } | Out-String -OutVariable container | Out-Null
    $container = $container.Trim()
    docker exec -it $container $command
}

Export-ModuleMember -Function * -Alias *
