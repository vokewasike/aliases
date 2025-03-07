# PowerShell Aliases

A collection of useful PowerShell aliases to boost productivity and streamline your command-line experience.

## Prerequisites

- Windows PowerShell or PowerShell Core
- Git
- Administrator privileges (for creating symlinks)
- Visual Studio Code (or your preferred text editor)

## Setup Instructions

1. Clone the repository:
   ``` powershell
   git clone git@github.com:vokewasike/aliases.git
   cd aliases
   ```

2. Create and configure environment variables:
   - Copy `.env.example` to `.env`
   - Edit `.env` and set your personal paths and configurations
   - Never commit your `.env` file as it may contain sensitive information
     ``` properties
     TEXT_EDITOR=code
     REPO_PATH=D:/Your/Repos/Path
     ...
     ```

3. Generate the PowerShell profile:
   ``` powershell
   cd powershell/scripts
   ./generate-profile.ps1
   ```

4. Link the profile (requires **administrator** privileges):
   ``` powershell
   ./link-profile.ps1
   ```

5. To remove the profile link when needed:
   ``` powershell
   ./unlink-profile.ps1
   ```

## Available Aliases

### Repository Navigation
- `repos` - Navigate to repositories root
- `personal_repos` - Navigate to personal repositories
- `treeolive_repos` - Navigate to work repositories

### Common Folders
- `downloads`, `desktop`, `docs`, `pics`, `vids`, `music` - Quick navigation to user folders
- `editaliases` - Open aliases repository in configured text editor

### Python & Django
- `installreq` - Install Python requirements
- `startproject`, `startapp` - Django project management
- `runserver` - Start Django development server
- `makemigrations`, `migrate` - Database migrations
- And more...

### Utility Commands
- `la` - List all files (including hidden)
- `touch` - Create new files or update timestamps

## Usage Examples

### Navigation
```powershell
repos                 # Go to repositories root
personal_repos        # Go to personal repositories
downloads            # Go to Downloads folder
docs                # Go to Documents folder
```

### Python/Django
```powershell
installreq           # Install Python requirements
startproject mysite  # Create new Django project
startapp blog       # Create new Django app
runserver          # Run Django development server
```

### SSH Commands
```powershell
treeolive_code      # SSH into server as treeolive user
treeolive_code_vokewasike  # SSH into server as vokewasike user
```

### File Transfer (SCP)
```powershell
# Basic usage: Copy file to remote home directory
scpto "local-file.txt"

# Copy to specific remote directory
scpto "local-file.txt" "~/project/uploads/"

# Copy with different user
scpto "local-file.txt" "~/" "different_user"

# Copy multiple files using wildcards
scpto "*.jpg" "~/images/"
scpto "project/*.pdf" "~/documents/"

# Copy entire directories
scpto "local-folder/*" "~/remote-folder/"

# Copy specific file types recursively
scpto "src/**/*.js" "~/backend/src/"

# Real-world examples
scpto "dist/app.zip" "/var/www/deployments/"
scpto "configs/*.json" "~/app/config/"
scpto "images/*" "~/public/uploads/" "webuser"
```

### Utility Commands
```powershell
la                  # List all files including hidden
touch newfile.txt   # Create new file or update timestamp
editaliases         # Open aliases repo in configured editor
```

## Customization

Edit the `.env` file to customize paths and settings according to your needs.
