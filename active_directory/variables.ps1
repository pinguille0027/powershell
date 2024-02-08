$listadoOUs=".\Unidades-Organizativas-Xilgaro-XX.csv"
$rutaBasica="OU=Sede-Vigo,DC=Xilgaro-dm,DC=local"
$gruposPrincipales=@(@{nombre="X-Usuarios"; ruta="OU=Usuarios,$rutaBasica"})