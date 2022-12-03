$nl = [System.Environment]::NewLine
$items = ($(Get-Content .\input.txt | Out-String) -split "$nl$nl")

$sums = foreach ($item in $items) {
    $i = 0
    $item = $item -split "$nl"
foreach ($number in $item) {
    $i = $i + $number
}
Write-Output $i
}
$sums | sort-object -Descending | Select-Object -First 1 #Part 1
$sums | sort-object -Descending | Select-Object -First 3 | Measure-Object -Sum #Part 2