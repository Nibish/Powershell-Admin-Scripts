# List of remote computer names
$computers = @("xxx,"xxx")

 

# Script block to uninstall software
$uninstallScript = {
    $softwareDisplayName = "Nessus Agent (x64)"
    $wmicUninstallCommand = "wmic product where ""Name like '%$softwareDisplayName%'"" call uninstall /nointeractive"
    Invoke-Expression -Command $wmicUninstallCommand
}

 

# Loop through each remote computer and execute the script
foreach ($computer in $computers) {
    Write-Host "Uninstalling software on $computer..."
    
        Invoke-Command -ComputerName $computer -ScriptBlock $uninstallScript -ErrorAction SilentlyContinue
}
