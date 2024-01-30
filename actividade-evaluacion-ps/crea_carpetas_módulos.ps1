if ( Get-Item ".\variables.ps1" -ErrorAction SilentlyContinue) {
    . ".\variables.ps1"
    foreach ($ciclo in $(Get-Content "$listadoGrupos")) {
        if ( Get-Item .\"$ciclo".txt -ErrorAction SilentlyContinue) {
            Write-Host "creando las carpetas de los modulos de $ciclo"
            foreach ($modulo in $(Get-Content .\"$ciclo".txt)) {
                if ( ! $(Get-Item $dirMod\$ciclo\$modulo -ErrorAction SilentlyContinue) ) {
                    New-Item $dirMod\$ciclo\$modulo -ItemType Directory | Out-Null
                    #si, comprobé que ya por si mismo crea todo el arbol de carpetas sin que existan los padres. 
                    #dije que la salida la mandase a san andres de teixido que tanta tabla me estaba incordiando
                }
                else {
                    Write-Host "el directorio de ese $modulo ya existe"
                }
            }
        }
        else {
            Write-Host "no se encuentra el listado de modulos de $ciclo"
        }
    }
}
else {
    Write-Host "no se encuentra el archivo de variables. ejecutese desde la carpeta en la que esta almacenado el script"
}