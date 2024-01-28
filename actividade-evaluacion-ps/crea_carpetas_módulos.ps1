. ".\variables.ps1"
foreach ($ciclo in $(Get-Content $listadoGrupos)) {
    if ( Get-Item .\${ciclo}.txt -ErrorAction SilentlyContinue) {
        Write-Host "creando las carpetas de los modulos de $ciclo"
        foreach ($modulo in $(Get-Content .\${ciclo}.txt)) {
            if ( ! $(Get-Item ${dirMod}\${ciclo}\${modulo} -ErrorAction SilentlyContinue) ) {
                New-Item ${dirMod}\${ciclo}\${modulo} -ItemType Directory | Out-Null
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
