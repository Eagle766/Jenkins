function Copy-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$SourcePath,

        [Parameter(Mandatory=$true)]
        [string]$DestinationPath
    )

    try {
        if (Test-Path $SourcePath) {
           Copy-Item -Path "$SourcePath\*" -Destination $DestinationPath -Recurse -Force
            Write-Host "File copied successfully from '$SourcePath' to '$DestinationPath'."
        } else {
            Write-Warning "Source file does not exist: $SourcePath"
        }
    }
    catch {
        Write-Error "Error copying file: $_"
    }
}

Copy-File -SourcePath "F:\File1" -DestinationPath "F:\File2"

