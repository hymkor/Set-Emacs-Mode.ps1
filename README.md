Set-Emacs-Mode.ps1
==================

PowerShell の編集モードを永続的にEmacs-Mode にする。

単に$profile に

```
Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs
```

を書き出すだけ。

使い方
------

書き込み可能なディレクトリで、スクリプトをダウンロード：

```
curl -O https://raw.githubusercontent.com/hymkor/Set-Emacs-Mode.ps1/master/Set-Emacs-Mode.ps1
```

実行：

+ PowerShell 5.1 の場合：
    1. `powershell -ex RemoteSigned -File Set-Emacs-Mode.ps1`
    2. `powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"`
+ PowerShell 7.4 の場合：
    + `pwsh Set-Emacs-Mode.ps1`

powershell とpwsh では、$profile の場所が違うので、それぞれで行うこと

だがしかし
---------

1. PowerShell の中から手作業で `notepad $profile`
2. `Import-Module PSReadline` , `Set-PSReadLineOption -EditMode Emacs` をコピペ
3. `powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"`

の方が早いな、こりゃ
