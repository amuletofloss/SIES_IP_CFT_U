[CmdletBinding()]
param(
    [switch]$IncluirBinarios
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$textExtensions = @('.csv', '.json', '.md', '.pbip', '.pbir', '.pbism', '.ps1', '.tmdl', '.txt')
$patterns = [ordered]@{
    'Ruta de perfil de Windows' = 'C:\\Users\\'
    'Ruta corporativa personal' = 'OneDrive\s+-\s+'
    'Referencia a PPT interna' = '\bPPT\s*v\d+\b|presentaci[oó]n\s+v\d+'
    'Correo electrónico' = '[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}'
    'Secreto aparente' = '(password|contrase[nñ]a|secret|token|api[_ -]?key)\s*[:=]\s*[^\s]+'
}

$findings = [System.Collections.Generic.List[object]]::new()
$files = Get-ChildItem -LiteralPath $repoRoot -Recurse -Force -File | Where-Object {
    $_.FullName -notmatch '[\\/]\.git[\\/]' -and
    $_.FullName -notmatch '[\\/]\.local[\\/]'
}

foreach ($file in $files) {
    if ($file.FullName -eq $PSCommandPath) {
        continue
    }

    $isText = $textExtensions -contains $file.Extension.ToLowerInvariant() -or $file.Name -eq '.platform'
    $isPbix = $file.Extension -ieq '.pbix'
    if (-not $isText -and -not ($IncluirBinarios -and $isPbix)) {
        continue
    }

    if ($isPbix) {
        $bytes = [IO.File]::ReadAllBytes($file.FullName)
        $contents = @(
            [Text.Encoding]::GetEncoding(28591).GetString($bytes),
            [Text.Encoding]::Unicode.GetString($bytes)
        )
    }
    else {
        $contents = @([IO.File]::ReadAllText($file.FullName))
    }

    foreach ($entry in $patterns.GetEnumerator()) {
        foreach ($content in $contents) {
            if ($content -match $entry.Value) {
                $findings.Add([pscustomobject]@{
                    Regla = $entry.Key
                    Archivo = $file.FullName.Substring($repoRoot.Length + 1)
                })
                break
            }
        }
    }
}

if ($findings.Count -gt 0) {
    $findings | Sort-Object Archivo, Regla -Unique | Format-Table -AutoSize
    throw "La revisión encontró $($findings.Count) posible(s) exposición(es)."
}

Write-Host 'Validación de privacidad superada: no se encontraron rutas personales, credenciales ni referencias internas.'
