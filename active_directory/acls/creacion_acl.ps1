$entidade="X-Usuarios" #usuario o grupo
$permisos="ReadAndExecute" #permisos separados por comas
$flagsHerdanza="ContainerInherit,ObjectInherit" #herencias, container para dir, object para ficheros o none
$flagsPropagacion="None" #none para sin declarar, InheritOnly para solo hijos, NoPropagateInherit sin propagación
$regra = New-Object System.Security.AccessControl.FileSystemAccessRule
($entidade, $permisos, $flagsHerdanza, $flagsPropagacion, "Allow")
$acl =Get-Acl -Path C:\DATOSXILGARO
$acl.AddAccessRule($regra)
#Aplicamos a nova ACL á ruta.
Set-Acl -Path $ruta -AclObject $acl