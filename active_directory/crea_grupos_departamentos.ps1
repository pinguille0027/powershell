. "./variables.ps1"

foreach ($departamento in $(Get-Content $listadoDeps)) {
  $rutaDep = "OU=$departamento,$($gruposPrincipales[1].ruta)"
  $nombreDep="Profes-$departamento"
  if (get-adgroup -filter "distinguishedName -eq '$("CN="+$nombreDep+","+$rutaDep)'") {
    Write-Host "el grupo ya existe"
  }
  else {
    New-ADGroup -Name $nombreDep -Path $rutaDep -GroupScope Global -Description "Profesorado do departamento de $departamento"
    Add-ADGroupMember -Identity $("CN=" + $gruposPrincipales[1].nombre + "," + $gruposPrincipales[1].ruta) -Members $nombreDep
  }
}