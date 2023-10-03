using namespace System.Net
param($Request, $TriggerMetadata)
Import-Module -Name 'Az.Compute' -Force

$Action = $Request.Query.Action
$VmId = $Request.Query.VmId

if (-not $Action) {
    $Action = $Request.Body.Action
}
if (-not $VmId) {
    $VmId = $Request.Body.VmId
}

if (-not $VmId) {
    $VmId = '/subscriptions/f9d00b01-8c10-46ac-a9a2-6feec286a0ea/resourceGroups/virtual-machines/providers/Microsoft.Compute/virtualMachines/demo-vm'
}

if ($Action -eq 'Restart') {
    $Body = Restart-AzVM -Id $VmId -ErrorAction SilentlyContinue
}
elseif ($Action -eq 'Stop') {
    $Body = Stop-AzVM -Id $VmId -ErrorAction SilentlyContinue
}
elseif ($Action -eq 'Start') {
    $Body = Start-AzVM -Id $VmId -ErrorAction SilentlyContinue
}
else {
    $Body = @{
        Status = 'Failed'
        Error  = 'No Action provided'
    }
}

if ($Body.Status -EQ 'Succeeded') {
    $StatusCode = [HttpStatusCode]::OK
}
else {
    $StatusCode = [HttpStatusCode]::BadRequest
}

Write-Host "Done"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = $StatusCode
        Body       = $Body | ConvertTo-Json -Depth 5 -Compress
    })
