[CmdletBinding()]
param(
    [switch]$Recrear,
    [switch]$Abrir
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$localBase = Join-Path $repoRoot '.local'
$localRoot = Join-Path $localBase 'SIES_IP_CFT_U'

if (Test-Path -LiteralPath $localRoot) {
    if (-not $Recrear) {
        throw "La copia local ya existe en '$localRoot'. Use -Recrear para reemplazarla."
    }

    $resolvedLocal = (Resolve-Path -LiteralPath $localRoot).Path
    $resolvedBase = if (Test-Path -LiteralPath $localBase) { (Resolve-Path -LiteralPath $localBase).Path } else { $localBase }
    if (-not $resolvedLocal.StartsWith($resolvedBase + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "La ruta local calculada está fuera de .local: $resolvedLocal"
    }
    Remove-Item -LiteralPath $resolvedLocal -Recurse -Force
}

New-Item -ItemType Directory -Path $localRoot -Force | Out-Null

$items = @(
    'SIES_IP_CFT_U.pbip',
    'SIES_IP_CFT_U.Report',
    'SIES_IP_CFT_U.SemanticModel',
    'SIES_IP_CFT_U.Data'
)

foreach ($item in $items) {
    $source = Join-Path $repoRoot $item
    if (-not (Test-Path -LiteralPath $source)) {
        throw "Falta el componente requerido: $source"
    }
    Copy-Item -LiteralPath $source -Destination $localRoot -Recurse
}

$expressionFile = Join-Path $localRoot 'SIES_IP_CFT_U.SemanticModel\definition\expressions.tmdl'
$dataPath = Join-Path $localRoot 'SIES_IP_CFT_U.Data'
$encoding = [Text.UTF8Encoding]::new($false)
$content = [IO.File]::ReadAllText($expressionFile)
$placeholder = 'C:\SIES_IP_CFT_U\SIES_IP_CFT_U.Data'

if (-not $content.Contains($placeholder)) {
    throw 'No se encontró la ruta genérica pCarpetaDatos en expressions.tmdl.'
}

$updated = $content.Replace($placeholder, $dataPath)
[IO.File]::WriteAllText($expressionFile, $updated, $encoding)

$localPbip = Join-Path $localRoot 'SIES_IP_CFT_U.pbip'
Write-Host "Copia local preparada: $localPbip"
Write-Host "Ruta de datos configurada: $dataPath"

if ($Abrir) {
    Start-Process -FilePath $localPbip
}

