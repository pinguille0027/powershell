param(
    [string]$rutaDelVideo
)

# Verificar si la ruta del video es válida
if (Test-Path $rutaDelVideo -PathType Leaf) {
    # Utilizar Start-Process para abrir el reproductor de medios predeterminado
    Start-Process $rutaDelVideo
    Write-Host "Reproduciendo el video: $rutaDelVideo"
}
else {
    Write-Host "Error: La ruta del video no es válida."
}
