function Set-Personal-Configuration() {
    invoke-expression -Command "git config user.name Lnk2past"
    invoke-expression -Command "git config user.email Lnk2past@gmail.com"
}

Export-ModuleMember -Function * -Alias *