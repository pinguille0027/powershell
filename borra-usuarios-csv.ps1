$usuarios = Import-Csv -Path .\usuarios.csv -Delimiter :
foreach ($user in $usuarios) {
  Remove-LocalUser -Name $user.Nombre
}
Get-LocalUser