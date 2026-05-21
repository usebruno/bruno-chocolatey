$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v3.4.1/bruno_3.4.1_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = '28519218F953A95DEDF7527AC80D6670F3B63A6E619585DB8EA8A215F9CF45EE'
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs




























