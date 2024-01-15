$nome= Read-Host -Prompt "nome de usuario"
$passwd= "abc123." | ConvertTo-SecureString -AsPlainText -Force
New-LocalUser -Name $nome -Password $passwd
Get-LocalUser -Name $nome | Format-List