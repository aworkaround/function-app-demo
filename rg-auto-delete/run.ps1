param($Timer)
Import-Module -Name 'Az.Resources' -Force

Get-AzResourceGroup | Where-Object { $_.Tags.env -NE 'prod' } | Remove-AzResourceGroup -Force
Write-Host "Done"
