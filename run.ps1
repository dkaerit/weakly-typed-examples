param (
    [Parameter(Mandatory = $true)]
    [string]$carpeta
)

$archivos = Get-ChildItem -Path $carpeta -File

foreach ($archivo in $archivos) {
    $extension = $archivo.Extension.ToLower()

    switch ($extension) {
        '.rb' {
            Write-Host "Ejecutando archivo $archivo usando Ruby..."
            ruby $archivo.FullName
        }
        '.py' {
            Write-Host "Ejecutando archivo $archivo usando Python..."
            python $archivo.FullName
        }
        '.php' {
            Write-Host "Ejecutando archivo $archivo usando PHP..."
            php $archivo.FullName
        }
        '.js' {
            Write-Host "Ejecutando archivo $archivo usando Node.js..."
            node $archivo.FullName
        }
        # Agrega aquí más casos para otros lenguajes si los necesitas

        default {
            Write-Host "No se puede ejecutar el archivo $archivo. Extensión no compatible."
        }
    }
}