$signals = Get-Content ./input.txt

$cycle = 1
$x = 1
$strength = 0
$alreadySet = $false
$rowCycle = 0
$r = 1

foreach ($signal in $signals) {

    $instruction = ($signal).Split(' ')[0]
    $move = ($signal).Split(' ')[1]

    if ($null -eq (Get-Variable -name "row$r")) {
    Set-Variable -Name "row$r" -Value ""
    }

    if ($instruction -eq "noop") {
        if (($x - 1)..($x + 1) -contains $rowCycle) {
            Set-Variable -Name "row$r" -Value ($(Get-Variable -Name "row$r" -ValueOnly) + "#")
        }
        else {
            Set-Variable -Name "row$r" -Value ($(Get-Variable -Name "row$r" -ValueOnly) + ".")
        }
        $cycle++
        $rowCycle++

        if ($rowCycle -eq 40) {
            $rowCycle = 0
            $r = $r + 1
        }
    }
    elseif ($instruction -eq "addx") {
    
        for ($i = 1; $i -le 2; $i++) {

            if (($x - 1)..($x + 1) -contains $rowCycle) {
                Set-Variable -Name "row$r" -Value ($(Get-Variable -Name "row$r" -ValueOnly) + "#")
            }
            else {
                Set-Variable -Name "row$r" -Value ($(Get-Variable -Name "row$r" -ValueOnly) + ".")

            }

            $cycle = $cycle + 1
            $rowCycle++

            if ($rowCycle -eq 40) {
                $rowCycle = 0
                $r = $r + 1
            }

            if ($i -eq 2) {
                $x = $x + $move 
            }

            if ($cycle -in (20, 60, 100, 140, 180, 220)) {
                $strength += $x * $cycle
                $alreadySet = $true
                "x is $x, cycle is $cycle, the current strength is $($x * $cycle) and the total strength now is $strength"
            }

        }

        

        
    }

    if ($cycle -in (20, 60, 100, 140, 180, 220) -and !$alreadySet) {
        $strength += $x * $cycle
        "x is $x, cycle is $cycle, the current strength is $($x * $cycle) and the total strength now is $strength"
    }

    $alreadySet = $false

    
}



$strength

$row1
$row2
$row3
$row4
$row5
$row6

$row1 = $null
$row2 = $null
$row3 = $null
$row4 = $null
$row5 = $null
$row6 = $null