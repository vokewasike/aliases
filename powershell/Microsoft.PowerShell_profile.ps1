# =================== Local / Cloud Folders ====================

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

# =================== Repositories ====================

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
Set-Alias lox_repos Set-TreeoliveRepositories

# =================== SSH ====================
function Set-TreeoliveCode {
    ssh -i "C:\Users\vokewasike\OneDrive\Treeolive Technologies\Documents\SSH\keys\treeolive-aws.pem" treeolive@ec2-13-244-135-166.af-south-1.compute.amazonaws.com
}
Set-Alias treeolive_code Set-TreeoliveCode

function Set-TreeoliveCodeVokewasike {
    ssh -i "C:\Users\vokewasike\OneDrive\Treeolive Technologies\Documents\SSH\keys\treeolive-aws.pem" vokewasike@ec2-13-244-135-166.af-south-1.compute.amazonaws.com
}
Set-Alias treeolive_code_vokewasike Set-TreeoliveCodeVokewasike


# =================== Misc ====================

function Edit-Aliases {
    personal_repos && Set-Location -Path "aliases/" && code .
}
Set-Alias editaliases Edit-Aliases

# ---

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
