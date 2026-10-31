#Requires -Version 5.1

$configHome  = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { "$HOME\.config" }
$configDir   = "$configHome\docker-lda"
$installPath = "$configDir\docker-lda.ps1"
$helpPath    = "$configDir\docker-lda-help.ps1"

# Remove files from older versions, which installed directly into ~
Remove-Item "$HOME\.docker-lda.ps1", "$HOME\.docker-lda-help.ps1" -Force -ErrorAction SilentlyContinue
if ((Test-Path $PROFILE) -and (Select-String -Path $PROFILE -SimpleMatch '\.docker-lda.ps1' -Quiet)) {
    $profileLines = @(Get-Content $PROFILE | Where-Object { -not $_.Contains('\.docker-lda.ps1') })
    Set-Content -Path $PROFILE -Value $profileLines
}

New-Item -ItemType Directory -Path $configDir -Force | Out-Null

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda.ps1" -UseBasicParsing -OutFile $installPath
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda-help.ps1" -UseBasicParsing -OutFile $helpPath

$profileDir = Split-Path $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

$sourceLine = ". `"$installPath`""
$content    = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
if ($content -notlike "*$installPath*") {
    Add-Content -Path $PROFILE -Value "`n$sourceLine"
}

Write-Host "docker-lda installed: $installPath"
Write-Host "docker-lda help installed: $helpPath"
Write-Host "Run '. `$PROFILE' or open a new terminal to activate."
