function Stop-All-Docker {
    docker ps -q | ForEach-Object { docker stop $_ }
}

function Remove-All-Docker {
    docker ps -q | ForEach-Object { docker rm --force $_ }
}

function Show-All-Docker {
    docker ps -a
}

Export-ModuleMember -Function * -Alias *
