# Load .env file
$envFilePath = Join-Path $PSScriptRoot "../../.env"
Get-Content -Path $envFilePath | ForEach-Object {
    if ($_ -match "^\s*#") { return } # Skip comments
    if ($_ -match "^\s*$") { return } # Skip empty lines
    $name, $value = $_ -split "=", 2
    Set-Variable -Name ($name.Trim()) -Value ($value.Trim()) -Scope Script
}

# Define the profile path
[string]$profilePath = Join-Path $PSScriptRoot "../Microsoft.PowerShell_profile.ps1"

# Generate profile content
[string]$profileContent = @"
# =================== Repositories folders ====================

function Set-Repositories {
    Set-Location -Path "${REPOS_PATH}"
}
Set-Alias repos Set-Repositories
Set-Alias Repositories Set-Repositories

# ---

function Set-PersonalRepositories {
    Set-Location -Path "${PERSONAL_REPOS_PATH}"
}
Set-Alias personal_repos Set-PersonalRepositories

# ---

function Set-AvatarRepositories {
    Set-Location -Path "${WORK_REPOS_PATH}"
}
Set-Alias avatar_repos Set-AvatarRepositories

# ---

function Set-RemoteRepositories {
    ssh -i "${SSH_KEY_PATH}" ${SSH_USER_PERSONAL}@${SSH_HOST_CODE}:"/home/${SSH_USER_PERSONAL}/repos"
}
Set-Alias remote_repos Set-RemoteRepositories

# ---

function Set-RemotePersonalRepositories {
    ssh -i "${SSH_KEY_PATH}" ${SSH_USER_PERSONAL}@${SSH_HOST_CODE}:"/home/${SSH_USER_PERSONAL}/repos/vokewasike"
}
Set-Alias remote_personal_repos Set-RemotePersonalRepositories

# ---

function Set-RemoteAvatarRepositories {
    ssh -i "${SSH_KEY_PATH}" ${SSH_USER_PERSONAL}@${SSH_HOST_CODE}:"/home/${SSH_USER_PERSONAL}/repos/loxinformatics"
}
Set-Alias remote_avatar_repos Set-RemoteAvatarRepositories

# =================== Aliases repository  folder ====================

function Edit-Aliases {
    Set-Location -Path "${ALIASES_REPO_PATH}" && ${TEXT_EDITOR_COMMAND} .
}
Set-Alias editaliases Edit-Aliases

# =================== Other Local / Cloud Folders ====================

function Set-Downloads {
    Set-Location -Path "${DOWNLOADS_PATH}"
}
Set-Alias downloads Set-Downloads
Set-Alias Downloads Set-Downloads

# ---

function Set-Desktop {
    Set-Location -Path "${DESKTOP_PATH}"
}
Set-Alias desktop Set-Desktop
Set-Alias Desktop Set-Desktop

# ---

function Set-Videos {
    Set-Location -Path "${VIDEOS_PATH}"
}
Set-Alias vids Set-Videos
Set-Alias videos Set-Videos
Set-Alias Videos Set-Videos

# ---

function Set-Pictures {
    Set-Location -Path "${PICTURES_PATH}"
}
Set-Alias pics Set-Pictures
Set-Alias pictures Set-Pictures
Set-Alias Pictures Set-Pictures

# ---

function Set-Documents {
    Set-Location -Path "${DOCUMENTS_PATH}"
}
Set-Alias docs Set-Documents
Set-Alias documents Set-Documents
Set-Alias Documents Set-Documents

# ---

function Set-Music {
    Set-Location -Path "${MUSIC_PATH}"
}
Set-Alias music Set-Music
Set-Alias Music Set-Music

# =================== Python ====================

function Install-Requirements {
    python3 -m pip install --upgrade pip && pip install -r requirements.txt
}
Set-Alias installreq Install-Requirements

# ---

function New-Project {
    django-admin startproject `$args
}
Set-Alias startproject New-Project

# ---

function New-DjangoApp {
    django-admin startapp `$args
}
Set-Alias startapp New-DjangoApp

# ---

function New-Migrations {
    python manage.py makemigrations `$args
}
Set-Alias makemigrations New-Migrations

# ---

function Update-Migrations {
    python manage.py migrate `$args
}
Set-Alias migrate Update-Migrations

# ---

function New-DjangoSuperuser {
    python manage.py createsuperuser `$args
}
Set-Alias createsuperuser New-DjangoSuperuser

# ---

function Export-DjangoStatic {
    python manage.py collectstatic `$args
}
Set-Alias collectstatic Export-DjangoStatic

# ---

function Start-DjangoServer {
    python manage.py runserver `$args
}
Set-Alias runserver Start-DjangoServer

# ---

function Import-DjangoData {
    python manage.py loaddata `$args
}
Set-Alias loaddata Import-DjangoData

# =================== SCP ====================

function Copy-ToRemoteServer {
    param(
        [Parameter(Mandatory=`$true)]
        [string]`$localPath,
        [string]`$remotePath = "~/",
        [string]`$user = "`${SSH_USER_AVATAR}"
    )
    scp -i "${SSH_KEY_PATH}" "`$localPath" "`${user}@${SSH_HOST_CODE}:`$remotePath"
}
Set-Alias scpto Copy-ToRemoteServer

# =================== Misc ====================

function Get-HiddenItems {
    Get-ChildItem && Get-ChildItem -Hidden
}
Set-Alias la Get-HiddenItems

# ---

function New-File {
    param ( [string]`$path ) if (Test-Path `$path) { (Get-Item `$path).LastWriteTime = Get-Date } else { New-Item `$path -ItemType File }
}
Set-Alias touch New-File

# ---
"@

# Write profile content to the specified path - make the operation explicit
Write-Host "Writing profile content to: $profilePath"
Set-Content -Path $profilePath -Value $profileContent
Write-Host "Profile content has been written successfully."