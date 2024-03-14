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
