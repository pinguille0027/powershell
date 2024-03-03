<# Para limpiar las acls. 
Cogemos acls
cambiamos la protección
  1- herencia
  2- limpieza de las cosas heredadas
seteamos la acl
#>
$acl =Get-Acl -Path C:\DATOSXILGARO
$acl.SetAccessRuleProtection($true,$false)
Set-Acl -Path C:\DATOSXILGARO -AclObject $acl
