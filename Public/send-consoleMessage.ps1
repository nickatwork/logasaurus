function send-ConsoleMessage {
    param(
        [string]$messageverbose,
        [string]$logLevel,
        [int32]$logNumber,
        [switch]$test
        )
    
    $dateme = flavorflav
    #$msg = "level=[$logLevel] host='$sourcehost' time='$dateme' source='$sourceName' script='$recipe' msg='$messageverbose' number=$logNumbers"
    $msg = "$dateme     level=[$logLevel] host='$sourcehost' source='$sourceName' script='$recipe' msg='$messageverbose' number=$logNumbers"
    if($logConsole){
        write-host "$msg"
    }
    if($logEvents){
        #add-content
    }
}

Export-ModuleMember -function send-ConsoleMessage