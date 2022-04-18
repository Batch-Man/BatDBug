@Echo off
cls

Set "Path=%Path%;%cd%;"
Set "_FilePath=%cd%"

Pushd "..\Src"
Start /b /wait BatDBug "%_FilePath%\Lex_upgrades.bat"
pause