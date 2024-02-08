
for ($taller = 1; $taller -lt 12; $taller++) {
    for ($idEquipo = 1; $idEquipo -lt 32; $idEquipo++) {
        if ($idEquipo -lt 10) {
            $nombreEquipo = $("W10-i" + $taller + "e0" + $idEquipo) 
        }
        else {
            $nombreEquipo = $("W10-i" + $taller + "e" + $idEquipo)   
        }
        $ruta="$("OU=T" + $taller + ",OU=Talleres,OU=Equipos,OU=Sede-Vigo,DC=Xilgaro-GOF,DC=local")"
        if (Get-ADComputer -Filter "distinguishedName -eq '$("CN="+$nombreEquipo+","+$ruta)'" -ErrorAction SilentlyContinue) {
            Write-Host "el equipo $nombreEquipo ya esta registrado"
        }
        else {
            New-ADComputer -Name $nombreEquipo -Path $ruta
        }
        
        
    }
}