$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v2.1.0/bruno_2.1.0_x64_win.exe'

$packageArgs = @{
  packageName    = '$env:ChocolateyPackageName'
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Bruno*'
  checksum      = '21BCA77A8D241432196B14C2BBB5F895491A50CB4BD144CA609B9221614AA662'
  checksumType  = 'sha256'
  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
