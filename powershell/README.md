# Powershell Aliases

A collection of useful PowerShell aliases to boost productivity and streamline your command-line experience.

## Steps

### 1. Git clone the project.

Navigate to `D:/Repositories/vokewasike` and git clone the project in this directory.



``` powershell
cd D:/Repositories/vokewasike
```

``` powershell
git clone git@github.com:vokewasike/aliases.git
```

> ℹ️ **Note:** <br />
> Do not directly edit the aliases in this README file. Instead, edit the `Microsoft.PowerShell_profile.ps1` file and then run the `update-readme.ps1` script to update the aliases section in the README. <br />
> If you change the location of where you git clone the project, remember to update the relevant parts in the `Microsoft.PowerShell_profile.ps1` file as indicated in the comments that are in the file.

``` powershell
cd scripts
```

``` powershell
./update-readme.ps1
```

To link the profile to the PowerShell profile location, run the link-profile.ps1 script _as an **administrator**_.

> ℹ️ **Note:** <br />
> Ensure you confirm the target location (edit the link-profile.ps1 script) before running the script.
> Ensure you run the script using administrator privileges.


``` powershell
cd scripts
```

``` powershell
./link-profile.ps1
```

``` powershell
# =================== Repositories folders ====================
# * NOTE: If you change the location of the either personal or treeolive, or the main repo folder that holds these two, update here as well

function Set-Repositories {
    Set-Location -Path "D:/Repositories/"
}
Set-Alias repos Set-Repositories
Set-Alias Repositories Set-Repositories

# ---

function Set-PersonalRepositories {
    Set-Repositories
    Set-Location -Path "vokewasike/"
}
Set-Alias personal_repos Set-PersonalRepositories

# ---

function Set-TreeoliveRepositories {
    Set-Repositories
    Set-Location -Path "treeolive/"
}
Set-Alias treeolive_repos Set-TreeoliveRepositories

# =================== Aliases repository  folder ====================
# * NOTE: If you change the aliases repo or folder name on your local machine, update here as well

function Edit-Aliases {
    personal_repos && Set-Location -Path "aliases/" && code .
}
Set-Alias editaliases Edit-Aliases

# =================== Other Local / Cloud Folders ====================

function Set-Downloads {
    Set-Location -Path "C:\Users\vokewasike\Downloads"
}
Set-Alias downloads Set-Downloads
Set-Alias Downloads Set-Downloads

# ---

function Set-Desktop {
    Set-Location -Path "C:\Users\vokewasike\OneDrive\Desktop"
}
Set-Alias desktop Set-Desktop
Set-Alias Desktop Set-Desktop

# ---

function Set-Videos {
    Set-Location -Path "C:\Users\vokewasike\OneDrive\Videos"
}
Set-Alias vids Set-Videos
Set-Alias videos Set-Videos
Set-Alias Videos Set-Videos

# ---

function Set-Pictures {
    Set-Location -Path "C:\Users\vokewasike\OneDrive\Pictures"
}
Set-Alias pics Set-Pictures
Set-Alias pictures Set-Pictures
Set-Alias Pictures Set-Pictures

# ---

function Set-Documents {
    Set-Location -Path "C:\Users\vokewasike\OneDrive\Documents"
}
Set-Alias docs Set-Documents
Set-Alias documents Set-Documents
Set-Alias Documents Set-Documents

# ---

function Set-Music {
    Set-Location -Path "C:\Users\vokewasike\OneDrive\Music"
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
    django-admin startproject $args
}
Set-Alias startproject New-Project

# ---

function New-DjangoApp {
    django-admin startapp $args
}
Set-Alias startapp New-DjangoApp

# ---

function New-Migrations {
    python manage.py makemigrations $args
}
Set-Alias makemigrations New-Migrations

# ---

function Update-Migrations {
    python manage.py migrate $args
}
Set-Alias migrate Update-Migrations

# ---

function New-DjangoSuperuser {
    python manage.py createsuperuser $args
}
Set-Alias createsuperuser New-DjangoSuperuser

# ---

function Export-DjangoStatic {
    python manage.py collectstatic $args
}
Set-Alias collectstatic Export-DjangoStatic

# ---

function Start-DjangoServer {
    python manage.py runserver $args
}
Set-Alias runserver Start-DjangoServer

# ---

function Import-DjangoData {
    python manage.py loaddata $args
}
Set-Alias loaddata Import-DjangoData

# =================== SSH ====================

function Set-TreeoliveCode {
    ssh -i "C:\Users\vokewasike\OneDrive\Treeolive Technologies\Documents\SSH\keys\treeolive-aws.pem" treeolive@ec2-13-244-135-166.af-south-1.compute.amazonaws.com
}
Set-Alias treeolive_code Set-TreeoliveCode

# ---

function Set-TreeoliveCodeVokewasike {
    ssh -i "C:\Users\vokewasike\OneDrive\Treeolive Technologies\Documents\SSH\keys\treeolive-aws.pem" vokewasike@ec2-13-244-135-166.af-south-1.compute.amazonaws.com
}
Set-Alias treeolive_code_vokewasike Set-TreeoliveCodeVokewasike

# =================== Misc ====================

function Get-HiddenItems {
    Get-ChildItem && Get-ChildItem -Hidden
}
Set-Alias la Get-HiddenItems

# ---

function New-File {
    param ( [string]$path ) if (Test-Path $path) { (Get-Item $path).LastWriteTime = Get-Date } else { New-Item $path -ItemType File }
}
Set-Alias touch New-File

# ---

```
