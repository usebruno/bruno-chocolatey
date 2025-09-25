$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v2.12.0/bruno_2.12.0_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = '74BFD0DFD07FEF1FFEC26347154F8CFF58AFDA4EB7F36F318AD0F33B0CAC6C53'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs








