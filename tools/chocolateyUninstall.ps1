$ErrorActionPreference = 'Stop'

$packageName = 'bruno'
$softwareName = 'Bruno*'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | % {
    $file = $_.UninstallString
    if ($file) {
      Write-Host "$($packageName) will be uninstalled from $file"
      Uninstall-ChocolateyPackage -PackageName $packageName 
                                -FileType 'exe' 
                                -SilentArgs '/S' 
                                -File $file
    }
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)$($_.DisplayVersion)"}
}
