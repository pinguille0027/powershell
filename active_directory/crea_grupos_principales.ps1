. "./variables.ps1"
$gruposPrincipales | ForEach-Object {
    if (get-adgroup -filter "distinguishedName -eq '$("CN="+$_.nombre+","+$_.ruta)'") {
        Write-Host "el grupo ya existe"
    }
    else {
        <#Write-Host $_.nombre
        Write-Host $_.ruta
        Write-Host $_.descripcion#>
        New-ADGroup -Name $_.nombre -Path $_.ruta -GroupScope Global -Description $_.descripcion
        if ($_.nombre -ne $gruposPrincipales[0].nombre) {
            Add-ADGroupMember -Identity $("CN=" + $gruposPrincipales[0].nombre + "," + $gruposPrincipales[0].ruta) -Members $_.nombre
        }
    }
}
