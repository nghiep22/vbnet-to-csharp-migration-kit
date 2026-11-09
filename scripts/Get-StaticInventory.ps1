[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$SourcePath,
    [Parameter(Mandatory)][string]$OutFile
)
$ErrorActionPreference = 'Stop'
$sourceRoot = (Resolve-Path -LiteralPath $SourcePath).Path
if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) { throw 'SourcePath must be a directory.' }
$outputPath = [IO.Path]::GetFullPath($OutFile)
if ([IO.Path]::GetExtension($outputPath) -ne '.json') { throw 'OutFile must have a .json extension.' }
if (Test-Path -LiteralPath $outputPath) { throw 'OutFile already exists; refusing to overwrite.' }
$skip = @('.git','.vs','bin','obj','node_modules','migration','artifacts')
function Get-SourceFiles([string]$Directory) {
    foreach ($item in Get-ChildItem -LiteralPath $Directory -Force) {
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
        if ($item.PSIsContainer) {
            if ($item.Name -notin $skip) { Get-SourceFiles $item.FullName }
        } else { $item }
    }
}
$files = @(Get-SourceFiles $sourceRoot)
$projects = @()
foreach ($file in $files | Where-Object Extension -in @('.vbproj','.csproj')) {
    $relative = [IO.Path]::GetRelativePath($sourceRoot,$file.FullName).Replace('\','/')
    $targets = @(); $references = @(); $hints = @(); $parseStatus = 'parsed'
    try {
        $settings = [Xml.XmlReaderSettings]::new()
        $settings.DtdProcessing = [Xml.DtdProcessing]::Prohibit
        $settings.XmlResolver = $null
        $reader = [Xml.XmlReader]::Create($file.FullName,$settings)
        try { $xml = [Xml.XmlDocument]::new(); $xml.XmlResolver = $null; $xml.Load($reader) } finally { $reader.Dispose() }
        $targets = @($xml.SelectNodes("//*[local-name()='TargetFramework' or local-name()='TargetFrameworks' or local-name()='TargetFrameworkVersion']") | ForEach-Object InnerText)
        $references = @($xml.SelectNodes("//*[local-name()='ProjectReference' or local-name()='Reference' or local-name()='COMReference' or local-name()='PackageReference']") | ForEach-Object { $_.GetAttribute('Include') } | Where-Object { $_ })
        $sdk = $xml.DocumentElement.GetAttribute('Sdk')
        $outputTypes = @($xml.SelectNodes("//*[local-name()='OutputType']") | ForEach-Object InnerText)
        $forms = @($xml.SelectNodes("//*[local-name()='UseWindowsForms']") | ForEach-Object InnerText)
        if ('true' -in $forms -or @($references | Where-Object { $_ -match '^System\.Windows\.Forms' }).Count) { $hints += 'winforms' }
        if ($sdk -match '\.Web$' -or @($references | Where-Object { $_ -match '^(System\.Web|Microsoft\.AspNet)' }).Count) { $hints += 'web' }
        if ($sdk -match '\.Worker$' -or @($references | Where-Object { $_ -match '^(System\.ServiceProcess|System\.ServiceModel)' }).Count) { $hints += 'service' }
        if ($hints.Count -eq 0) { if ('Exe' -in $outputTypes -or 'WinExe' -in $outputTypes) { $hints += 'console' } else { $hints += 'library' } }
    } catch { $parseStatus = 'error'; $hints = @('unknown') }
    $projects += [ordered]@{path=$relative;parseStatus=$parseStatus;targetDeclarations=@($targets);workloadHints=@($hints);references=@($references)}
}
$report = [ordered]@{
    schemaVersion='0.1'; analysisMode='static'; semanticResolved=$false; root=$sourceRoot
    counts=[ordered]@{files=$files.Count;vb=@($files | Where-Object Extension -eq '.vb').Count;resx=@($files | Where-Object Extension -eq '.resx').Count;projects=$projects.Count}
    projects=@($projects)
    limitations=@('Experimental XML/file inventory only.','Properties and conditions are not evaluated with MSBuild.','No reference resolution, call graph, package compatibility or behavior verification.','Workload hints are heuristics; nested/mixed projects require review.','Symlink/reparse-point directories and common build/output directories are skipped.')
}
$parent = Split-Path $outputPath -Parent
if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
$report | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $outputPath -Encoding utf8
Write-Output "Static-only inventory written: $outputPath"
