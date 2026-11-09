[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$ProjectPath,
    [string[]]$Skills = @()
)
$ErrorActionPreference = 'Stop'
$kitRoot = Split-Path $PSScriptRoot -Parent
$skillRoot = Join-Path $kitRoot 'skills'
$project = (Resolve-Path -LiteralPath $ProjectPath).Path
if (-not (Test-Path -LiteralPath $project -PathType Container)) { throw 'ProjectPath must be an existing directory.' }
$available = @(Get-ChildItem -LiteralPath $skillRoot -Directory | Select-Object -ExpandProperty Name)
if ($Skills.Count -eq 0) { $Skills = $available }
$Skills = @($Skills | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ } | Select-Object -Unique)
if ($Skills.Count -eq 0) { throw 'At least one skill must be selected.' }
$destinationRoot = Join-Path $project '.agents/skills'
foreach ($skillName in $Skills) {
    if ($skillName -notmatch '^vb-[a-z0-9-]+$' -or $skillName -notin $available) { throw "Unknown skill: $skillName" }
    if (Test-Path -LiteralPath (Join-Path $destinationRoot $skillName)) { throw "Destination exists; no files changed: $skillName" }
}
foreach ($skillName in $Skills) {
    $destination = Join-Path $destinationRoot $skillName
    if ($PSCmdlet.ShouldProcess($destination, 'Install new project skill')) {
        New-Item -ItemType Directory -Path $destinationRoot -Force | Out-Null
        Copy-Item -LiteralPath (Join-Path $skillRoot $skillName) -Destination $destination -Recurse
        Write-Output "Installed: $skillName"
    }
}
