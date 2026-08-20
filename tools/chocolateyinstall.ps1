$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v4.1.0/bruno_4.1.0_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = 'C4FA1FD54BE2328570858F13D28804278C9EC9A9F592FB4F71598476CB0E7623'
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs



































