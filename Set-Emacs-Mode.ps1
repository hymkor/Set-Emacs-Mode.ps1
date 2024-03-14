<# PowerShell の編集モードを永続的にEmacs-Mode にする

単に$profile に

```
Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs
```

を書き出すだけ

+ PowerShell 5.1
    + `powershell -ex RemoteSigned -File EmacsMode.ps1`
+ PowerShell 7.4
    + `pwsh EmacsMode.ps1`

powershell とpwsh では、$profile の場所が違うので、それぞれで行うこと
#>

if ( (Get-Module | Where-Object { $_.Name -eq "PSReadLine" }).Count -ge 1 ){
    if ( (Get-PSReadlineOption).EditMode -eq "Emacs" ){
        Write-Host "Emacs-mode is already set up"
    } else {
        Write-Output "Set-PSReadLineOption -EditMode Emacs" |
            Out-File -Encoding ASCII -Append $profile
    }
    exit 0
}

$profileDir = (Split-Path -Path $profile)
if ( -not (Test-Path $profileDir ) ){
    New-Item $profileDir -ItemType Directory
}

Write-Output "Import-Module PSReadline`r`nSet-PSReadLineOption -EditMode Emacs" |
    Out-File -Encoding ASCII -Append $profile
