function elevate() { #Checks if powershell is open in administrator mode, if not will launch seperate window in admin and prompt for credentials. 
    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { 
        Start-Process -FilePath Powershell.exe -Verb RunAs -ArgumentList "-file $PSCommandPath -noexit -noprofile"
        exit
    }
}
function gpUpdatePC() { #runs group policy update
    gpupdate /force
}
function Start-Log() { #Starts logging to file
    $today = (Get-Date).ToString('MM-dd-yy')
    if (Test-Path -Path $dir\logs\$today){
        Start-Transcript -Path $dir\logs\$today\$pcName.txt -Append -IncludeInvocationHeader
    }
    else {
        Start-Transcript -Path $dir\logs\$today\$pcName.txt -Append
    }
}
function Stop-Log() { #stops logging
    $ErrorActionPreference="SilentlyContinue" 
    Stop-Transcript | Out-Null
    $ErrorActionPreference="Continue"
}
