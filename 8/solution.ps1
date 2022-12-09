$trees = Get-Content .\input.txt

[int]$rows = ($trees | Measure-Object).Count
[int]$columns = ($trees[0]).Length
$total = 0
Write-Host -NoNewLine "Currently on row: "
for ($r = 1; $r -le ($rows - 1); $r++) {
    Write-Host -NoNewLine "$r"
    Write-Host "Currently on column: "
    for ($c = 1; $c -le ($columns - 1) ; $c++) {
        Write-Host -NoNewLine "$c"
        $subtotal = 0
    
        while ($subtotal -eq 0) {
            #Write-Output "In the loop for row $r and column $c"
            [int]$valueToCompare = $trees[$r][$c]
            #left
            for ($l = 0; $l -lt $c; $l++) {
                [int]$currentValue = $trees[$r][$l]
                #Write-Output $currentValue
                #Write-Output $valueToCompare

                if ($currentValue -lt $valueToCompare) {
                    $subtotal++
                    break;
                }

            }
            #right
            for ($l = ($columns - 1); $l -gt $c; $l--) {
                [int]$currentValue = $trees[$r][$l]

                #Write-Output $currentValue
                #Write-Output $valueToCompare

                if ($currentValue -lt $valueToCompare) {
                    $subtotal++
                    break;
                }

            }
            #up
            for ($l = 0; $l -lt $r; $l++) {
                [int]$currentValue = $trees[$l][$c]

                if ($currentValue -lt $valueToCompare) {
                    $subtotal++
                    break;
                }

            }

            #down
            for ($l = ($rows - 1); $l -gt $r; $l--) {

                #Write-Output $l
                #Write-Output $c
                [int]$currentValue = $trees[$l][$c]

                if ($currentValue -lt $valueToCompare) {
                    $subtotal++
                    break;
                }

            }
        }

        $total += $subtotal
    }


}

$total