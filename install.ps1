if(($PSVersionTable.PSVersion.Major) -lt 5) {
    Write-Output "PowerShell 5 or greater is required to run logaSaur."
    Write-Output "Upgrade PowerShell: https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell"
    break
}
if((Get-ExecutionPolicy) -gt 'RemoteSigned' -or (Get-ExecutionPolicy) -eq 'ByPass') {
    Write-Output "PowerShell requires an execution policy of 'RemoteSigned' to run logasaurus."
    Write-Output "To make this change please run:"
    Write-Output "'Set-ExecutionPolicy RemoteSigned -scope CurrentUser'"
    break
}
if(-not (test-path "./logasaurus")){
    start-bitstransfer -source https://github.com/nickatwork/logasaurus/logasaurus.zip
    Expand-Archive logasaur.zip
    new-item "./logasaurus/Private" -type Directory
    
}
cd logaSaur
if(-not (test-path "logasaurus.psd1")){
    import-module "./logasaurus.psd1"
}


