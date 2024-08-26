$ErrorActionPreference = 'Stop';
$software_name = "Open Rails"
$installPath = "${env:ProgramFiles(x86)}\$software_name"

Remove-Item -Recurse $installPath
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$software_name.lnk"

#Remove from Path
$Environment = [System.Environment]::GetEnvironmentVariable("Path", "User")
$Environment = $Environment.Replace("$installPath", "")
[System.Environment]::SetEnvironmentVariable("Path", $Environment, "User")
