$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v3.5.0/bruno_3.5.0_x64_win.exe'

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = 'F948A2FC20C9D32A79CBFAF8B8AE28B42E06AA0CD3086DE13C3FCAC35C27BC0B'
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs






























