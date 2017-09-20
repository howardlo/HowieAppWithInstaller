$SolutionDir = "../"

# $cmd = '"C:\Program Files (x86)\WiX Toolset v3.11\bin\heat" dir "$SolutionDir/HowieConsoleApp/bin/Release/PublishOutput"  -dr APPLICATIONFOLDER -cg HowieConsoleAppComponents -gg -g1 -sf -srd  -var "TO-BE-REPLACED" -out "$SolutionDir/HowieConsoleAppInstaller/HowieConsoleApp.wxs"'

$x = date
"Generating HowieConsoleApp.wsx $x" > powershell-exec-log.txt

$heat_cmd = 'C:\Program Files (x86)\WiX Toolset v3.11\bin\heat'
$source = "$SolutionDir/HowieConsoleApp/bin/Release/PublishOutput"
$dest = "$SolutionDir/HowieConsoleAppInstaller/HowieConsoleApp.wxs"
$heat_flags = "-gg -g1 -sf -srd -dr APPLICATIONFOLDER -var ""to-be-replaced"""

& $heat_cmd dir "$source" -gg -g1 -sf -srd -sreg -cg HowieConsoleAppComponents -dr INSTALLFOLDER -out "$dest" >> powershell-exec-log.txt

$content = Get-Content -path $dest

$content -Replace 'Source="SourceDir\\', 'Source="../HowieConsoleApp/bin/Release/PublishOutput/' | Out-File $dest -Encoding "UTF8"

$x = date
"powershell made it to the end: $x" >> powershell-exec-log.txt
