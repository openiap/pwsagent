
# Read environment variable payloadfile
$payloadfile = $env:payloadfile

# If file exists
if (Test-Path $payloadfile) {
    # Read Content of payloadfile as JSON
    $payload = Get-Content $payloadfile | ConvertFrom-Json
} else {
    # Create new payload
    $payload = @{
    }
}

# Does payload contain findme?
if ($payload.findme) {
    Write-Host "Found findme with value $($payload.findme)"
    $payload.findme = "Test"
} else {
    Write-Host "Did not find findme, adding it"
    # add findme to payload
    $payload | Add-Member -MemberType NoteProperty -Name findme -Value "Hello World"

}

Write-Host "Hi mom"

# Upadte payloadfile
$payload | ConvertTo-Json | Set-Content $payloadfile


