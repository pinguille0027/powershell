if ( Get-Item ".\variables.ps1" -ErrorAction SilentlyContinue) {
    . ".\variables.ps1"
    if ( Get-Item .\"$listadoUsuarios" -ErrorAction SilentlyContinue) {
        $usuarios = Import-Csv "$listadoUsuarios" -Delimiter : 
        $usuarios | ForEach-Object -Begin {
            $i = 0
            $usuariosPrexistentes = ""
            $usuariosFallidos = ""
        } -Process {
            if ( ! $(Get-Item $dirUs\$($_.Grupo)\$($_.Login) -ErrorAction SilentlyContinue) ) {
                New-Item $dirUs\$($_.Grupo)\$($_.Login) -ItemType Directory -ErrorAction Continue | Out-Null
                # a sustitución de comando é necesaria para que o script entre nas propiedades do obxecto en vez de leer o obxecto completo porque maxia borrás de guillerme portas
                # no iba a mandar hasta 378 tablas de directorio creadas porque no aporta nada mas que ruido. Feliz día.
                if ( ! $(Get-Item $dirUs\$($_.Grupo)\$($_.Login) -ErrorAction SilentlyContinue) ) {
                    #aunque el comando manda los fallos por consola y continua creo que puede ser mas comodo tambien tener un listado de los que fallan, comprobé que funciona metiendo un nombre invalido
                    $usuariosFallidos = "$usuariosFallidos" + "- $($_.Login)
                    "
                }
            }
            else {
                #en vez de devolver los usuarios que ya existían durante la ejecución, lo devuelvo al final vía salida por consola.
                #puede ser algo ñe si ya existían todos los usuarios, pero para unos pocos...
                $usuariosPrexistentes = "$usuariosPrexistentes" + "- $($_.Login)
                "
            }
            #en vez de eso probé a hacer una barra de progreso para devolver el estado del script, me parece más indicativo aunque para hacerlo tuve que guardar el import en una variable, si no no furrulaba
            $i = $i + 1
            $progreso = $($i / $usuarios.count) * 100
            Write-Progress -Activity "Creando los directorios de los usuarios" -Status "Progreso:" -PercentComplete $progreso
        } -End {
            Write-Host "operacion finalizada"
            if ($usuariosPrexistentes -ne "") {
                Write-Host "los directorios de los siguientes usuarios no se crearon porque ya exitian:
                $usuariosPrexistentes"
            }
            if ($usuariosFallidos -ne "") {
                Write-Host "los directorios de los siguientes usuarios no se pudieron crear por algún otro motivo (ej: nombre invalido) :
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