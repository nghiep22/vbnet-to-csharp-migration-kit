[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$kitRoot = Split-Path $PSScriptRoot -Parent
$skillRoot = Join-Path $kitRoot 'skills'
$skillDirs = @(Get-ChildItem -LiteralPath $skillRoot -Directory)
if ($skillDirs.Count -ne 12) { throw "Expected 12 skills, found $($skillDirs.Count)." }
foreach ($directory in $skillDirs) {
    $skillFile = Join-Path $directory.FullName 'SKILL.md'
    $body = Get-Content -LiteralPath $skillFile -Raw
    if ($body -notmatch '(?s)^---\r?\n(.*?)\r?\n---') { throw "Invalid frontmatter: $skillFile" }
    $frontmatter = $Matches[1]
    if ($frontmatter -notmatch '(?m)^name: (vb-[a-z0-9-]+)$') { throw "Missing skill name: $skillFile" }
    $name = $Matches[1]
    if ($name -ne $directory.Name -or $name.Length -ge 64) { throw "Skill directory/name mismatch: $skillFile" }
    if ($frontmatter -notmatch '(?m)^description: (".*")$') { throw "Description must be a quoted scalar: $skillFile" }
    $description = $Matches[1] | ConvertFrom-Json
    if ([string]::IsNullOrWhiteSpace($description) -or $description.Length -gt 1024 -or $description -match '[<>]') { throw "Invalid description: $skillFile" }
    if ($body -match '\[TODO:') { throw "Unfinished skill scaffold: $skillFile" }
    $metadataFile = Join-Path $directory.FullName 'agents/openai.yaml'
    $metadata = Get-Content -LiteralPath $metadataFile -Raw
    if ($metadata -notmatch '(?m)^  default_prompt: (".*")$') { throw "Missing default_prompt: $metadataFile" }
    $prompt = $Matches[1] | ConvertFrom-Json
    if (-not $prompt.Contains('$' + $name)) { throw "Default prompt must invoke its skill: $metadataFile" }
    if ($metadata -notmatch '(?m)^  short_description: (".*")$') { throw "Missing short_description: $metadataFile" }
    $short = $Matches[1] | ConvertFrom-Json
    if ($short.Length -lt 25 -or $short.Length -gt 64) { throw "UI description length invalid: $metadataFile" }
}
foreach ($name in @('manifest','assessment','plan','state','verification','static-inventory')) {
    $schemaPath = Join-Path $kitRoot "schemas/$name.schema.json"
    $examplePath = Join-Path $kitRoot "examples/contracts/$name.json"
    $schema = Get-Content -LiteralPath $schemaPath -Raw | ConvertFrom-Json
    if ($schema.'$schema' -ne 'http://json-schema.org/draft-07/schema#') { throw "Unexpected schema dialect: $schemaPath" }
    $example = Get-Content -LiteralPath $examplePath -Raw
    if (-not (Test-Json -Json $example -SchemaFile $schemaPath)) { throw "Schema example failed: $name" }
}
$plan = Get-Content -LiteralPath (Join-Path $kitRoot 'examples/contracts/plan.json') -Raw | ConvertFrom-Json
$taskIds = @($plan.tasks | ForEach-Object id)
if (@($taskIds | Select-Object -Unique).Count -ne $taskIds.Count) { throw 'Duplicate task IDs.' }
foreach ($task in $plan.tasks) { foreach ($dependency in $task.dependsOn) { if ($dependency -notin $taskIds -or $dependency -eq $task.id) { throw 'Invalid sample task dependency.' } } }
$markdown = Get-ChildItem -LiteralPath $kitRoot -Recurse -File -Filter '*.md'
foreach ($file in $markdown) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($match in [regex]::Matches($content,'\[[^\]]+\]\(([^)]+)\)')) {
        $link = $match.Groups[1].Value
        if ($link -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $link.StartsWith('#')) { continue }
        $target = ($link -split '#',2)[0]
        if (-not (Test-Path -LiteralPath (Join-Path $file.DirectoryName $target))) { throw "Broken local link in $($file.Name): $target" }
    }
}
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $kitRoot 'scripts') -File -Filter '*.ps1') {
    $parseTokens=$null; $parseErrors=$null
    [void][System.Management.Automation.Language.Parser]::ParseFile($file.FullName,[ref]$parseTokens,[ref]$parseErrors)
    if ($parseErrors.Count) { throw "PowerShell syntax error in $($file.Name): $($parseErrors[0].Message)" }
}
Write-Output ('PASS: {0} skills, 6 schema examples, internal links, and PowerShell syntax.' -f $skillDirs.Count)
Write-Output 'Scope: repository structure only. No converter, VB/C# runtime or application migration was verified.'
