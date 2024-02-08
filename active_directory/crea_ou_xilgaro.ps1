if ( Get-Item ".\variables.ps1" -ErrorAction SilentlyContinue) {
    . "./variables.ps1"
    Import-Csv -Path $listadoOUs -Delimiter : | ForEach-Object {
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$("OU=" + $_.OU + "," + $_.Path)'" -ErrorAction SilentlyContinue) {
            Write-Host "la UO $($_.OU) ya existe"
        }
        else {
            New-ADOrganizationalUnit -Name $_.OU -Path $_.Path
        }
    }
}
else {
    Write-Host "no se encuentra el archivo de variables. ejecutese desde la carpeta en la que esta almacenado el script"
}