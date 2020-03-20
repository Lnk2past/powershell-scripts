function Set-Personal-Configuration {
    invoke-expression -Command "git config user.name Lnk2past"
    invoke-expression -Command "git config user.email Lnk2past@gmail.com"
}

function Initialize-Git {
    param(
        [Parameter(Mandatory=$true,
        HelpMessage="Enter the URL of the repository you want to initialize here.")]
        [string]$repository
    )
    invoke-expression -Command "git init ."
    invoke-expression -Command "git remote add origin $repository"
    invoke-expression -Command "git pull origin master"
}

Export-ModuleMember -Function * -Alias *
