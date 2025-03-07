param (
    [string]$targetPath = "C:\Users\vokewasike\OneDrive\Documents\PowerShell"
)

$sourcePath = Join-Path $PSScriptRoot "../Microsoft.PowerShell_profile.ps1"

# Confirm the target location
if (-not (Test-Path $targetPath)) {
    New-Item -ItemType Directory -Path $targetPath
}

# Create the symbolic link
New-Item -ItemType SymbolicLink -Path "$targetPath\Microsoft.PowerShell_profile.ps1" -Target $sourcePath -Force
