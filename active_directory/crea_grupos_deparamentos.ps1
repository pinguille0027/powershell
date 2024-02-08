. "./variables.ps1"

foreach ($departamento in $(Get-Content $listadoDeps)) {
  $rutaDep = "OU=$departamento,$($gruposPrincipales[1].ruta)"
  if (get-adgroup -filter "distinguishedName -eq '$("CN="+$departamento+","+$rutaDep)'") {
    Write-Host "el grupo ya existe"
  }
  else {
    New-ADGroup -Name $departamento -Path $rutaDep -GroupScope Global -Description "Profesorado do departamento de $departamento"
  }
}