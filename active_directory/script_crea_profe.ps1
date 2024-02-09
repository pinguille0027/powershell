
param([Parameter(Mandatory)]$login, `
        [Parameter(Mandatory)]$password, `
        [Parameter(Mandatory)]$nome, `
        [Parameter(Mandatory)]$apelidos, `
        [Parameter(Mandatory)]$departamento, `
        [Parameter(Mandatory)]$email)

. "./variables.ps1"

if ( !(Get-Aduser -Filter  "SamAccountName -eq '$login'" -ErrorAction SilentlyContinue) -And (Get-ADGroup -Filter "SamAccountName -eq 'profes-$departamento'" -ErrorAction SilentlyContinue)  ) {
    Write-Host "Creando o profesor $login do departamento $departamento"
    New-ADUser `
        -SamAccountName "$login" `
        -GivenName "$nome" `
        -Surname "$apelidos" `
        -Name "$nome $apelidos"`
        -DisplayName "Profesor/a: $nome $apelidos"`
        -Company "IES XIlgaro"`
        -Department $departamento `
        -EmailAddress $email `
        -Description "Profesor/a do departamento de $departamento" `
        -Path $("OU=" + $departamento + "," + $gruposPrincipales[1].ruta)`
        -Type "user"`
        -UserPrincipalName $($login + "@" + $($nombreDominio))`
        -ChangePasswordAtLogon $true `
        -AccountPassword $(ConvertTo-SecureString -AsPlainText -Force $password) `
        -Enabled $true
    #Set-ADAccountPassword -Identity $login -Reset -NewPassword $(ConvertTo-SecureString -AsPlainText -Force $password)
    Add-ADGroupMember -Identity $("CN=Profes-" + $departamento + "," + "OU=" + $departamento + "," + $gruposPrincipales[1].ruta) -Members $login

}
else {
    Write-Host "O usuario $login xa existe ou o $departamento non existe"
}