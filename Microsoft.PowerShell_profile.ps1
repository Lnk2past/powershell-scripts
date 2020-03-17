function activate ([string]$env) {
    invoke-expression -Command "$HOME\Documents\VirtualEnvironments\$env\Scripts\Activate.ps1"
}

function mkenv ([string]$env) {
    invoke-expression -Command "python -m venv $HOME\Documents\VirtualEnvironments\$env"
}


function set-personal() {
    invoke-expression -Command "git config user.name Lnk2past"
    invoke-expression -Command "git config user.email Lnk2past@gmail.com"
}
