param (
    [string]$targetPath = $PROFILE
)

if (-not (Test-Path $targetPath)) {
    Write-Host "No PowerShell profile found at $targetPath"
    exit 0
}

try {
    if ((Get-Item $targetPath).LinkType -eq "SymbolicLink") {
        Remove-Item -Path $targetPath -Force
        Write-Host "PowerShell profile symlink removed successfully."
    }
    else {
        Write-Warning "Profile exists but is not a symbolic link. Manual removal required."
    }
}
catch {
    Write-Error "Failed to remove profile: $_"
    exit 1
}

