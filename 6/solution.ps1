$string = Get-Content .\input.txt

$index = 0

$length = $string.Length

while ($length -ge $($index + 1)) {

    $substring = @()
    
    $substring = $string[($index)..($index+3)]

    $uniqueCount = ($substring | Sort-Object | Get-Unique | Measure-Object).Count

    if ($uniqueCount -eq 4) {
        Write-Output "$($index + 4)"
        Break
    }

    $index = $index + 1
}

$index = 0

while ($length -ge $($index + 1)) {

    $substring = @()

    $substring = $string[($index)..($index+13)]

    $uniqueCount = ($substring | Sort-Object | Get-Unique | Measure-Object).Count

    if ($uniqueCount -eq 14) {
        Write-Output "$($index + 14)"
        Break
    }

    $index = $index + 1
}
