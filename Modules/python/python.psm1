function New-Environment {
    param(
        [Parameter(Mandatory=$true,
        HelpMessage="Enter the name of an environment to create.")]
        [string]$env
    )
    invoke-expression -Command "python -m venv $HOME\Documents\VirtualEnvironments\$env"
}; Set-Alias mkenv New-Environment

function Enter-Environment {
    param(
        [Parameter(Mandatory=$true,
        HelpMessage="Enter the name of an environment to activate.")]
        [string]$env
    )
    invoke-expression -Command "$HOME\Documents\VirtualEnvironments\$env\Scripts\Activate.ps1"
}; Set-Alias activate Enter-Environment

Export-ModuleMember -Function * -Alias *
