$profileContent = Get-Content -Path (Join-Path $PSScriptRoot "../Microsoft.PowerShell_profile.ps1") -Raw
$readmePath = Join-Path $PSScriptRoot "../README.md"

$template = @"
# Powershell Aliases

A collection of useful PowerShell aliases to boost productivity and streamline your command-line experience.

## Steps

### 1. Git clone the project.

Navigate to ``D:/Repositories/vokewasike`` and git clone the project in this directory.



`````` powershell
cd D:/Repositories/vokewasike
``````

`````` powershell
git clone git@github.com:vokewasike/aliases.git
``````

> ℹ️ **Note:** <br />
> Do not directly edit the aliases in this README file. Instead, edit the ``Microsoft.PowerShell_profile.ps1`` file and then run the ``update-readme.ps1`` script to update the aliases section in the README. <br />
> If you change the location of where you git clone the project, remember to update the relevant parts in the ``Microsoft.PowerShell_profile.ps1`` file as indicated in the comments that are in the file.

`````` powershell
cd scripts
``````

`````` powershell
./update-readme.ps1
``````

To link the profile to the PowerShell profile location, run the `link-profile.ps1` script _as an **administrator**_.

> ℹ️ **Note:** <br />
> Ensure you confirm the target location (edit the link-profile.ps1 script) before running the script.
> Ensure you run the script using administrator privileges.


`````` powershell
cd scripts
``````

`````` powershell
./link-profile.ps1
``````

`````` powershell
$profileContent
``````
"@

Set-Content -Path $readmePath -Value $template
