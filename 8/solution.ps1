$trees = Get-Content .\input.txt

[int]$rows = ($trees | Measure-Object).Count
[int]$columns = ($trees[0]).Length
$total = 0
$maxScenicScore = 0
for ($r = 0; $r -le ($rows - 1); $r++) {

    for ($c = 0; $c -le ($columns - 1) ; $c++) {

        if ($r -eq 0 -or $r -eq ($rows - 1) -or $c -eq 0 -or $c -eq ($columns - 1 )) {
            $total = $total + 1
        }
        else {
            $valueToCompare = [int]::Parse($trees[$r][$c])

            $visible = 0
        
            #left
            $highestLeftTree = 0
            $left = 0
            $leftScore = 0
            $leftMaxReached = 0

            for ($l = ($c - 1); $l -ge 0; $l--) {
                $currentValue = [int]::Parse($trees[$r][$l])

                if ($currentValue -ge $highestLeftTree) {
                    $highestLeftTree = $currentValue
                }
                if ($currentValue -lt $valueToCompare -and $leftMaxReached -eq 0) {
                    $leftScore++
                }
                elseif ($currentValue -ge $valueToCompare -and $leftMaxReached -eq 0) {
                    $leftScore ++
                    $leftMaxReached = 1
                }
            }

            if ($highestLeftTree -lt $valueToCompare) {
                $left = 1
            }
            #right

            $highestRightTree = 0
            $right = 0
            $rightScore = 0
            $rightMaxReached = 0

            for ($l = ($c + 1); $l -le ($columns - 1); $l++) {
                $currentValue = [int]::Parse($trees[$r][$l])
                #Write-Output "Value to Compare: $valueToCompare"
                #Write-Output "CurrentValue: $currentValue"
                #Write-Output "Row to consider: $l"
                #Write-Output "Right Max Reached: $rightMaxReached"

                if ($currentValue -ge $highestRightTree) {
                    $highestRightTree = $currentValue
                }

                if ($currentValue -lt $valueToCompare -and $rightMaxReached -eq 0) {
                    #Write-Output "$currentValue is less than $valueToCompare, adding 1 to score"
                    #$rightMaxReached
                    $rightScore++
                }
                elseif ($currentValue -ge $valueToCompare -and $rightMaxReached -eq 0) {
                    #Write-Output "$currentValue is equal to or greater than $valueToCompare, adding 1 to score and adding no more"
                    $rightScore ++
                    $rightMaxReached = 1
                }

            }

            if ($highestRightTree -lt $valueToCompare) {
                $right = 1
            }
            #up

            $highestUpTree = 0
            $up = 0
            $upScore = 0
            $upMaxReached = 0

            for ($l = ($r - 1); $l -ge 0; $l--) {
                $currentValue = [int]::Parse($trees[$l][$c])

                if ($currentValue -ge $highestUpTree) {
                    $highestUpTree = $currentValue
                }

                if ($currentValue -lt $valueToCompare -and $upMaxReached -eq 0) {
                    $upScore++
                }
                elseif ($currentValue -ge $valueToCompare -and $upMaxReached -eq 0) {
                    $upScore ++
                    $upMaxReached = 1
                }

            }

            if ($highestUpTree -lt $valueToCompare) {
                $up = 1
            }

            #down
            $highestDownTree = 0
            $down = 0
            $downScore = 0
            $downMaxReached = 0

            for ($l = ($r + 1); $l -le ($rows - 1); $l++) {
                $currentValue = [int]::Parse($trees[$l][$c])

                if ($currentValue -ge $highestDownTree) {
                    $highestDownTree = $currentValue
                }

                if ($currentValue -lt $valueToCompare -and $downMaxReached -eq 0) {
                    $downScore++
                }
                elseif ($currentValue -ge $valueToCompare -and $downMaxReached -eq 0) {
                    $downScore ++
                    $downMaxReached = 1
                }

            }

            $currentScenicScore = $leftScore * $rightScore * $upScore * $downScore

            if ($highestDownTree -lt $valueToCompare) {
                $down = 1
            }

            if ($down -eq 1 -or $up -eq 1 -or $left -eq 1 -or $right -eq 1) {
                $total = $total + 1
                #Write-Output "$valueToCompare, in row $r and column $c, is visible"
            }

            if ($maxScenicScore -lt $currentScenicScore) {
                Write-Output "Changing maxScenicScore for row $r and column $c"
                $maxScenicScore = $currentScenicScore
            }


        }
    }


}

$total
$maxScenicScore