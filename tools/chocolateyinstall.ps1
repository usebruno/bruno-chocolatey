$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v2.13.2/bruno_2.13.2_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = '65F7E8ACDF4AB95644E6867EA7AC9EFFF6520EB31D86379F4F82F6B5B2A06085'
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs











