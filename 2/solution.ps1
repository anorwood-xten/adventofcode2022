$advent2 = $(Get-Content .\input.txt) -replace (' ', '')

$reference = @{
    "A" = 1
    "B" = 2
    "C" = 3
    "X" = 1
    "Y" = 2
    "Z" = 3
}

$score = 0

foreach ($line in $advent2) {
    [string]$left = $line[0]
    [string]$right = $line[1]

    [int]$leftResult = $reference.($left)
    [int]$rightResult = $reference.($right)

    $roundScore = 0

    if (($leftResult - $rightResult) -eq -2) {
        $roundScore += $rightResult
    }
    elseif (($leftResult - $rightResult) -eq 2) {
        $roundScore = $rightResult + 6
    }
    elseif ($leftResult -lt $rightResult) {
        $roundScore = $rightResult + 6
    }
    elseif ($leftResult -eq $rightResult) {
        $roundScore = $rightResult + 3
    }
    elseif ($leftResult -gt $rightResult) {
        $roundScore += $rightResult
    }

    $score += $roundScore
}

Write-Output "Part 1: $score"

$newScore = 0

foreach ($line in $advent2) {
    [string]$left = $line[0]
    [string]$right = $line[1]

    [int]$leftResult = $reference.($left)
    [int]$rightResult = $reference.($right)

    $roundScore = 0

    if ($right -eq "X") { #lose

        if ($left -eq "A") {
            $roundScore = $reference.C
        }
        if ($left -eq "B") {
            $roundScore = $reference.A
        }
        if ($left -eq "C") {
            $roundScore = $reference.B
        }
    }
    elseif ($right -eq "Y") { #draw

        $roundScore = $leftResult + 3
    }
    elseif ($right -eq "Z") { #win

        if ($left -eq "A") {
            $roundScore = $reference.B + 6
        }
        if ($left -eq "B") {
            $roundScore = $reference.C + 6
        }
        if ($left -eq "C") {
            $roundScore = $reference.A + 6
        }
    }

    $newScore += $roundScore

}

Write-Output "Part 2: $newScore"