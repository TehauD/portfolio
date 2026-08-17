<#
.SYNOPSIS
    Publishes the GitHub profile README with a static face image and editable markdown text.

.DESCRIPTION
    Copies README.md and assets/tehau-ascii-face.png into the local GitHub profile repository,
    commits the change, and pushes to the configured remote.

.PARAMETER RepositoryPath
    Local path to the GitHub profile repository.

.PARAMETER CommitMessage
    Git commit message.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$RepositoryPath,

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$CommitMessage = "Update profile README with static face and editable markdown"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Log {
    param(
        [Parameter(Mandatory = $true)] [string]$Message,
        [Parameter(Mandatory = $false)] [ValidateSet("INFO", "WARN", "ERROR")] [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp][$Level] $Message"
}

try {
    $sourceRoot = Split-Path -Parent $PSScriptRoot
    $sourceReadme = Join-Path $sourceRoot "README.md"
    $sourceAsset = Join-Path $sourceRoot "assets\tehau-ascii-face.png"

    if (-not (Test-Path -LiteralPath $RepositoryPath)) { throw "RepositoryPath not found: $RepositoryPath" }
    if (-not (Test-Path -LiteralPath (Join-Path $RepositoryPath ".git"))) { throw "Target path is not a Git repository: $RepositoryPath" }
    if (-not (Test-Path -LiteralPath $sourceReadme)) { throw "README.md not found: $sourceReadme" }
    if (-not (Test-Path -LiteralPath $sourceAsset)) { throw "PNG asset not found: $sourceAsset" }

    $targetAssets = Join-Path $RepositoryPath "assets"
    if (-not (Test-Path -LiteralPath $targetAssets)) { New-Item -Path $targetAssets -ItemType Directory -Force | Out-Null }

    Copy-Item -LiteralPath $sourceReadme -Destination (Join-Path $RepositoryPath "README.md") -Force
    Copy-Item -LiteralPath $sourceAsset -Destination (Join-Path $targetAssets "tehau-ascii-face.png") -Force

    Push-Location $RepositoryPath
    try {
        git add README.md assets/tehau-ascii-face.png
        git commit -m $CommitMessage
        git push
    } finally {
        Pop-Location
    }

    Write-Log "Profile README published successfully."
} catch {
    Write-Log $_.Exception.Message "ERROR"
    throw
}
