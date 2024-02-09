$usuarios= Import-Csv -Path .\usuarios.csv -Delimiter :
foreach($user in $usuarios){
  $passwd= $user.Password | ConvertTo-SecureString -AsPlainText -Force
  New-LocalUser -Name $user.Nombre -Password $passwd
}
Get-LocalUser