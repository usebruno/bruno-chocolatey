$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v3.5.1/bruno_3.5.1_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = '4869BC652335CF687BDB0A4553E588669E4A651BB3A2D72882904B3ABD013C7A'
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs































