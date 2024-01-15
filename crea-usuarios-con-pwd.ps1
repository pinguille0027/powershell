$nome= Read-Host -Prompt "nome de usuario"
$passwd= Read-Host -AsSecureString -Prompt "mete password"
New-LocalUser -Name $nome -Password $passwd
Get-LocalUser -Name $nome | Format-List