function New-Environment ([string]$env) {
    invoke-expression -Command "python -m venv $HOME\Documents\VirtualEnvironments\$env"
}; Set-Alias activate Enter-Environment

function Enter-Environment ([string]$env) {
    invoke-expression -Command "$HOME\Documents\VirtualEnvironments\$env\Scripts\Activate.ps1"
}; Set-Alias mkenv New-Environment

Export-ModuleMember -Function * -Alias *
