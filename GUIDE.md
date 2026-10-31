# Install Guide

Details that the [README](README.md) leaves out: what the setup scripts do, how to install by hand, and how to remove everything.

## What the setup script does

The script makes two changes:

1. It copies `docker-lda.sh` (or `docker-lda.ps1`) and its help script to `~/.config/docker-lda/` (or `$XDG_CONFIG_HOME/docker-lda/`).
2. It adds a single source line to your shell profile (`~/.bashrc` or `$PROFILE`).

Older versions put the files directly in `~/`. Run the script again to upgrade that install: it removes the old files and the old source line.

Read the source before you run it: [setup.sh](setup.sh), [setup.ps1](setup.ps1).

## Manual install

**Bash:**

```bash
mkdir -p ~/.config/docker-lda

curl -sL https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda.sh \
  -o ~/.config/docker-lda/docker-lda.sh

curl -sL https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda-help.sh \
  -o ~/.config/docker-lda/docker-lda-help.sh && chmod +x ~/.config/docker-lda/docker-lda-help.sh

echo 'source ~/.config/docker-lda/docker-lda.sh' >> ~/.bashrc
source ~/.bashrc
```

**PowerShell:**

```powershell
New-Item -ItemType Directory -Path "$HOME\.config\docker-lda" -Force | Out-Null

iwr -useb https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda.ps1 `
  -OutFile "$HOME\.config\docker-lda\docker-lda.ps1"

iwr -useb https://raw.githubusercontent.com/rockberpro-dev/docker-lda/main/docker-lda-help.ps1 `
  -OutFile "$HOME\.config\docker-lda\docker-lda-help.ps1"

Add-Content -Path $PROFILE -Value "`n. `"$HOME\.config\docker-lda\docker-lda.ps1`""
. $PROFILE
```

## Uninstall

**Bash:**

```bash
sed -i '/\/docker-lda\/docker-lda\.sh/d' ~/.bashrc
rm -r ~/.config/docker-lda
```

**PowerShell:**

```powershell
$content = Get-Content $PROFILE | Where-Object { $_ -notlike '*\docker-lda\docker-lda.ps1*' }
Set-Content $PROFILE $content
Remove-Item "$HOME\.config\docker-lda" -Recurse
```

## Files

[setup.sh](setup.sh) · [setup.ps1](setup.ps1) · [docker-lda.sh](docker-lda.sh) · [docker-lda-help.sh](docker-lda-help.sh) · [docker-lda.ps1](docker-lda.ps1) · [docker-lda-help.ps1](docker-lda-help.ps1)
