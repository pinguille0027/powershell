. "./variables.ps1"

foreach ($ciclo in $(Get-Content $listadoGrupos)) {
  $rutaCiclo = "OU=$ciclo,$($gruposPrincipales[2].ruta)"
  if (get-adgroup -filter "distinguishedName -eq '$("CN="+$ciclo+","+$rutaCiclo)'") {
    Write-Host "el grupo ya existe"
  }
  else {
    New-ADGroup -Name $ciclo -Path $rutaCiclo -GroupScope Global -Description "Alumnado do ciclo de $ciclo"
  }
}