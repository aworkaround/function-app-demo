# VM Start
param($Timer)
Import-Module -Name 'Az.Compute' -Force

Start-AzVM -ResourceGroupName 'virtual-machines' -Name 'demo-vm'
Write-Host "Done"