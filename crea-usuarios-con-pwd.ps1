$nome = Read-Host -Prompt "nome de usuario"

if (! (Get-LocalUser -Name $nome) ) {
    $passwd = Read-Host -AsSecureString -Prompt "mete password"
    New-LocalUser -Name $nome -Password $passwd
    Get-LocalUser -Name $nome | Format-List
    
}
else {
    Write-Host "o usuario xa existe"
}