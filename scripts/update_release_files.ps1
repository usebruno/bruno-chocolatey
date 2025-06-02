param(
    [Parameter(Mandatory=$true)]
    [string]$Version,
    [Parameter(Mandatory=$true)]
    [string]$TargetRepo
)

# Create/update tools directory
$toolsDir = "tools"
if (-not (Test-Path $toolsDir)) {
    New-Item -ItemType Directory -Force -Path $toolsDir
}

# Get the .exe file
$exePath = Get-ChildItem ./choco-repo/dist -Filter *.exe | Select-Object -First 1
$checksum = Get-FileHash $exePath -Algorithm SHA256 | Select-Object -ExpandProperty Hash

# Create chocolateyinstall.ps1
@"
`$ErrorActionPreference = 'Stop'
`$toolsDir = "`$(Split-Path -Parent `$MyInvocation.MyCommand.Definition)"
`$url = 'https://github.com/$TargetRepo/releases/download/v$Version/$(Split-Path $exePath.Name -Leaf)'

`$packageArgs = @{
    packageName    = '`$env:ChocolateyPackageName'
    fileType      = 'exe'
    url           = `$url
    softwareName  = 'Bruno*'
    checksum      = '$checksum'
    checksumType  = 'sha256'
    silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
"@ | Out-File -FilePath "$toolsDir/chocolateyinstall.ps1" -Encoding UTF8

# Create nuspec file
@"
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://schemas.microsoft.com/packaging/2015/06/nuspec.xsd">
    <metadata>
        <id>bruno</id>
        <title>Bruno</title>
        <version>$Version</version>
        <authors>Anoop M D</authors>
        <owners>Anoop M D</owners>
        <summary>Opensource IDE For Exploring and Testing Api's</summary>
        <description><![CDATA[Bruno is a new and innovative API client, aimed at revolutionizing the status quo represented by Postman and similar tools out there.
        Bruno stores your collections directly in a folder on your filesystem. We use a plain text markup language, Bru, to save information about API requests.
        You can use git or any version control of your choice to collaborate over your API collections.
        Bruno is offline-only. There are no plans to add cloud-sync to Bruno, ever. We value your data privacy and believe it should stay on your device.]]>
        <projectUrl>https://www.usebruno.com</projectUrl>
        <tags>bruno api-client rest-client graphql-client foss</tags>
        <copyright>Copyright (c) $((Get-Date).Year) Bruno Software Inc.</copyright>
        <licenseUrl>https://github.com/$TargetRepo/blob/main/license.md</licenseUrl>
        <requireLicenseAcceptance>false</requireLicenseAcceptance>
        <iconUrl>https://cdn.jsdelivr.net/gh/usebruno/bruno@main/assets/images/logo-transparent.png</iconUrl>
        <releaseNotes>https://github.com/$TargetRepo/releases/tag/v$Version</releaseNotes>
        <docsUrl>https://docs.usebruno.com</docsUrl>
        <projectSourceUrl>https://github.com/$TargetRepo</projectSourceUrl>
        <packageSourceUrl>https://github.com/usebruno/bruno-chocolatey</packageSourceUrl>
        <dependencies>
            <dependency id="chocolatey-core.extension" version="1.3.3" />
        </dependencies>
    </metadata>
    <files>
        <file src="tools\**" target="tools" />
    </files>
</package>
"@ | Out-File -FilePath "bruno.nuspec" -Encoding UTF8
