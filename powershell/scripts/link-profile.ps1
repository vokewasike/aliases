param (
    [string]$targetPath = $PROFILE
)

$sourcePath = Join-Path $PSScriptRoot "../Microsoft.PowerShell_profile.ps1"

# Verify source file exists
if (-not (Test-Path $sourcePath)) {
    Write-Error "Source profile not found at: $sourcePath"
    exit 1
}

# Create profile directory if it doesn't exist
$profileDir = Split-Path $targetPath -Parent
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force
}

# Remove existing profile if it exists
if (Test-Path $targetPath) {
    Remove-Item -Path $targetPath -Force
}

try {
    # Create the symbolic link
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourcePath -Force
    Write-Host "Profile successfully linked from $sourcePath to $targetPath"
}
catch {
    Write-Error "Failed to create symbolic link: $_"
    exit 1
}
