$moves = Get-Content .\input.txt

$1 = ("N","R","J","T","Z","B","D","F")
$2 = ("H","J","N","S","R")
$3 = ("Q","F","Z","G","J","N","R","C")
$4 = ("Q","T","R","G","N","V","F")
$5 = ("F","Q","T","L") 
$6 = ("N","G","R","B","Z","W","C","Q")
$7 = ("M","H","N","S","L","C","F")
$8 = ("J","T","M","Q","N","D")
$9 = ("S","G","P")

foreach ($move in $moves) {
    $splitMoves = $move -split(" ")

    $quantity = $splitMoves[1]
    $stack1 = $splitMoves[3]
    $stack2 = $splitMoves[5]

    $swap1 = Get-Variable "$(Get-Variable stack1 -ValueOnly)" -ValueOnly
    $swap2 = Get-Variable "$(Get-Variable stack2 -ValueOnly)" -ValueOnly


    for ($i=0; $i -lt $quantity; $i++) {
        
        $swap3 = @()
        $swap3 += $swap1[0]
        $swap3 += $swap2

        $swap1 = $swap1[1..$($swap1.length -1)]
        $swap2 = $swap3

    }

    Set-Variable -Name "$(Get-Variable stack1 -ValueOnly)" -Value $swap1
    Set-Variable -Name "$(Get-Variable stack2 -ValueOnly)" -Value $swap2


}

$finalString1 = ""

for ($i=1; $i -le 9; $i++) {
    $finalString1 += (Get-Variable "$i" -ValueOnly)[0]
}

$finalString1


$1 = ("N","R","J","T","Z","B","D","F")
$2 = ("H","J","N","S","R")
$3 = ("Q","F","Z","G","J","N","R","C")
$4 = ("Q","T","R","G","N","V","F")
$5 = ("F","Q","T","L") 
$6 = ("N","G","R","B","Z","W","C","Q")
$7 = ("M","H","N","S","L","C","F")
$8 = ("J","T","M","Q","N","D")
$9 = ("S","G","P")

foreach ($move in $moves) {
    $splitMoves = $move -split(" ")

    [int]$quantity = $splitMoves[1]
    $stack1 = $splitMoves[3]
    $stack2 = $splitMoves[5]

    $swap1 = Get-Variable "$(Get-Variable stack1 -ValueOnly)" -ValueOnly
    $swap2 = Get-Variable "$(Get-Variable stack2 -ValueOnly)" -ValueOnly

        
    $swap3 = @()
    $swap3 += $swap1[0..$($quantity -1)]
    $swap3 += $swap2

    if ($quantity -eq $($swap1.length)) {
        $swap1 = @()
    }
    else {
        $swap1 = $swap1[$($quantity)..$($swap1.length -1)]
    }
    $swap2 = $swap3

    Set-Variable -Name "$(Get-Variable stack1 -ValueOnly)" -Value $swap1
    Set-Variable -Name "$(Get-Variable stack2 -ValueOnly)" -Value $swap2
}

$finalString2 = ""

for ($i=1; $i -le 9; $i++) {
    $finalString2 += (Get-Variable "$i" -ValueOnly)[0]
}

$finalString2