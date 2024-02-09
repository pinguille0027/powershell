. "./variables.ps1"

foreach ($ciclo in $(Get-Content $listadoGrupos)) {
    $rutaCiclo = "OU=$ciclo,$($gruposPrincipales[2].ruta)"
    $nombreGrupoAlumnos = "Alumnos-$ciclo"
    $nombreGrupoProfes = "Profes-$ciclo"
    if (get-adgroup -filter "distinguishedName -eq '$("CN="+$nombreGrupoAlumnos+","+$rutaCiclo)'") {
        Write-Host "el grupo ya existe"
    }
    else {
        New-ADGroup -Name $nombreGrupoAlumnos -Path $rutaCiclo -GroupScope Global -Description "Alumnado do ciclo de $ciclo"
        Add-ADGroupMember -Identity $("CN=" + $gruposPrincipales[2].nombre + "," + $gruposPrincipales[2].ruta) -Members $nombreGrupoAlumnos
    }
    if (get-adgroup -filter "distinguishedName -eq '$("CN="+$nombreGrupoProfes+","+$rutaCiclo)'") {
        Write-Host "el grupo ya existe"
    }
    else {
        New-ADGroup -Name $nombreGrupoProfes -Path $rutaCiclo -GroupScope Global -Description "Profesorado do ciclo de $ciclo"
    }
}