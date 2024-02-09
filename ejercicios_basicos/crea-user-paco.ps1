$passwd= Read-Host -AsSecureString -Prompt "mete password"
New-LocalUser -Name "Paco" -FullName "Paco Martinez Soria" -Password $passwd