Set-Emacs-Mode.ps1
==================

PowerShell の編集モードを永続的にEmacs-Mode にする。

単に$profile に

```
Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs
```

を書き出すだけ。

+ PowerShell 5.1
    + `powershell -ex RemoteSigned -File EmacsMode.ps1`
+ PowerShell 7.4
    + `pwsh EmacsMode.ps1`

powershell とpwsh では、$profile の場所が違うので、それぞれで行うこと
