
$ErrorActionPreference = 'Stop';
$checksum = "450702aac92dbfb68a2b1b4a4be5b24eea19e41c4496f7eccfc98ea19abc64b2f493d3e607c2ac5aab3754830f633ef3ab069325fe0a099cf78a012e9e6b0c65"
$repository = "openrails/openrails"
$software_name = "Open Rails"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/$env:ChocolateyPackageVersion/OpenRails-$env:ChocolateyPackageVersion.zip"
$toolsDir = "${env:ProgramFiles(x86)}\$software_name"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $download_url
  softwareName   = $software_name
  checksum       = $checksum
  checksumType   = 'sha512'
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

$exe_path = "$toolsDir\OpenRails.exe"
Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyPath -PathToInstall $toolsDir -PathType "User"

Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$software_name.lnk" -TargetPath "$exe_path"

Update-SessionEnvironment
