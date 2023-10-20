#Starts Trellix Audit Manager
$Computers = "xxxx"
 

foreach ($Computer IN $Computers) {
    Start-Service TrellixAuditManager
    Invoke-Command -ComputerName $Computer -ScriptBlock {Start-Process "C:\Program Files\McAfee\Agent\cmdagent.exe" -ArgumentList "/p"} -ErrorAction Stop
}
