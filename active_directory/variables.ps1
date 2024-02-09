$listadoOUs=".\Unidades-Organizativas-Xilgaro-XX.csv"
$rutaBasica="OU=Sede-Vigo,DC=Xilgaro-GOF,DC=local"
$gruposPrincipales=@(@{nombre="X-Usuarios"; ruta="OU=Usuarios,$rutaBasica" ; descripcion="Grupo de todos los usuarios del dominio"}
@{nombre="X-Profes"; ruta="OU=Profesorado,OU=Usuarios,$rutaBasica"; descripcion="Grupo de todos los profes del dominio"}
@{nombre="X-Alumnos"; ruta="OU=Alumnado,OU=Usuarios,$rutaBasica"; descripcion="Grupo de todos los Alumnos del dominio"}
@{nombre="X-Dirección"; ruta="OU=Dirección,OU=Usuarios,$rutaBasica"; descripcion="Grupo de todos el personal de dirección del dominio"}
)
$listadoDeps=".\departamentos.txt"
$listadoGrupos=".\grupos.txt"