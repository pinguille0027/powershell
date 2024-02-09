if ( Get-Item ".\variables.ps1" -ErrorAction SilentlyContinue) {
    . ".\variables.ps1"
    if ( Get-Item .\"$listadoUsuarios" -ErrorAction SilentlyContinue) {
        $usuarios = Import-Csv "$listadoUsuarios" -Delimiter : 
        $usuarios | ForEach-Object -Begin {
            $i = 0
            $usuariosPrexistentes = ""
            $usuariosFallidos = ""
        } -Process {
            if ( !(Get-Aduser -Filter  "SamAccountName -eq '$($_.login)'" -ErrorAction SilentlyContinue) -And (Get-ADGroup -Filter "SamAccountName -eq 'Alumnos-$($_.grupo)'" -ErrorAction SilentlyContinue)  ) {
                New-ADUser `
                    -SamAccountName "$($_.login)" `
                    -GivenName "$($_.nome)" `
                    -Surname "$($_.apelidos)" `
                    -Name "$($_.nome) $($_.apelidos)"`
                    -DisplayName "$($_.nome) $($_.apelidos)"`
                    -Company "IES XIlgaro"`
                    -EmailAddress $($($_.login) + "@" + $($($nombreDominio).toLower())) `
                    -Description "Alumno de $($_.grupo)" `
                    -Path $("OU=" + $($_.grupo) + "," + $gruposPrincipales[2].ruta)`
                    -Type "user"`
                    -UserPrincipalName $($($_.login) + "@" + $($nombreDominio))`
                    -AccountPassword $(ConvertTo-SecureString -AsPlainText -Force $($_.password)) `
                    -CannotChangePassword $true `
                    -Enabled $true
                Add-ADGroupMember -Identity $("CN=Alumnos-" + $($_.grupo) + "," + "OU=" + $($_.grupo) + "," + $gruposPrincipales[2].ruta) -Members $($_.login)
                if ( ! $(Get-Aduser -Filter  "SamAccountName -eq '$($_.login)'" -ErrorAction SilentlyContinue) ) {
                    $usuariosFallidos = "$usuariosFallidos" + "- $($_.Login)
                    "
                }
            }
            else {
                $usuariosPrexistentes = "$usuariosPrexistentes" + "- $($_.Login)
                "
            }
            $i = $i + 1
            $progreso = $($i / $usuarios.count) * 100
            Write-Progress -Activity "Creando los usuarios de los Alumnos" -Status "Progreso:" -PercentComplete $progreso
        } -End {
            Write-Host "operacion finalizada"
            if ($usuariosPrexistentes -ne "") {
                Write-Host "los siguientes usuarios no se crearon porque ya exitian:
                $usuariosPrexistentes"
            }
            if ($usuariosFallidos -ne "") {
                Write-Host "los siguientes usuarios no se pudieron crear por algún otro motivo (ej: nombre invalido) :
                $usuariosFallidos"
            }
        }
    }    
    else {
        Write-Host "no se encuentra el listado de usuarios"
    }
}
else {
    Write-Host "no se encuentra el archivo de variables. ejecutese desde la carpeta en la que esta almacenado el script"
}