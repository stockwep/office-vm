<# Custom Script for Windows to install Office from Azure Storage using the staging folder created by the deployment script #>

param (
    [string]$LibraryLocation,
    [string]$LibraryLocationSASToken,
    [string]$OfficeISO,
    [string]$OfficePID
)

# Working directory
$dest = "C:\WindowsAzure\OfficeDeployment"

# Get ISO
$source = $LibraryLocation + "/$OfficeISO" + $LibraryLocationSASToken
New-Item -Path $dest -ItemType directory

# Use WebClient as Invoke-WebRequest causes OutOfMemoryException for large files.
$webClient = new-object System.Net.WebClient
$webClient.DownloadFile($source, "$dest\$OfficeISO.iso")

$iso = "$dest\$OfficeISO.iso"

# Mount ISO
$isoImage = Mount-DiskImage $iso -PassThru
$isoDriveLetter = (Get-Volume -DiskImage $isoImage).DriveLetter
$isoRoot = (Get-PSDrive $isoDriveLetter).Root

# Generate config.xml
$config = @"
<Configuration Product="ProPlusr">
    <Display Level="none" CompletionNotice="no" SuppressModal="yes" AcceptEula="yes" />  
    <Setting Id="SETUP_REBOOT" Value="Never" />
    <PIDKEY Value="$OfficePID" />
</Configuration>
"@

Add-Content $dest\config.xml $config

# Run Office installer
$installer = $isoRoot+"setup.exe"
$configSwitch = "$dest\config.xml"
# Use Wait flag to ensure office installer has completed before continuing.
$process = Start-Process -FilePath $installer -ArgumentList $configSwitch -Wait -PassThru

# Clean up
Dismount-DiskImage $iso
Remove-Item $dest -Recurse -Force