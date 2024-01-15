if ($args.Count -eq 2) {
    $nome = $args[0]
    $passwd = $args[1] | ConvertTo-SecureString -AsPlainText -Force
    New-LocalUser -Name $nome -Password $passwd
    Get-LocalUser -Name $nome | Format-List
}
else {
    Write-Host "se necesitan exactamente 2 parametros, usuario y contraseña"
}