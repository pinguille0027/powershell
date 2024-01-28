. ".\variables.ps1"
Import-Csv .\loginsegrupos.csv -Delimiter : | ForEach-Object {
  if ( ! $(Get-Item ${dirUs}\$($_.Grupo)\$($_.Login) -ErrorAction SilentlyContinue) ) {
    New-Item ${dirUs}\$($_.Grupo)\$($_.Login) -ItemType Directory | Out-Null
}
else {
    Write-Host "el directorio de ese $($_.Login) ya existe"
}
}