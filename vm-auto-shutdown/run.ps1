# VM Shutdown
param($Timer)
Import-Module -Name 'Az.Compute' -Force

Stop-AzVM -ResourceGroupName 'virtual-machines' -Name 'demo-vm' -Force
Write-Host "Done"
