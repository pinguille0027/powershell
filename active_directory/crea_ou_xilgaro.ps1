if ( Get-Item ".\variables.ps1" -ErrorAction SilentlyContinue) {
. "./variables.ps1"
Import-Csv -Path $listadoOUs -Delimiter : | ForEach-Object {
    if (Get-ADOrganizationalUnit -Identity $($_.Path) -ErrorAction SilentlyContinue) {
        if (Get-ADOrganizationalUnit -Identity $("OU="+$_.OU+","+$_.Path) -ErrorAction SilentlyContinue) {
            Write-Host "la UO $($_.OU) ya existe"
        }
        else {
            New-ADOrganizationalUnit -Name $_.OU -Path $_.Path
        }
    }
    else {
        Write-Host "alguna de las unidades padre de la $($_.OU) no exiten.
        Combrueba que exiten los siguientes elementos en el dominio $($_.Path)"
    }
}
}
else {
    Write-Host "no se encuentra el archivo de variables. ejecutese desde la carpeta en la que esta almacenado el script"
}