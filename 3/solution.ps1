$rucksacks = Get-Content .\input.txt

$sum = 0
$sum2 = 0
$count = 0

$i = 1
$a = [ordered]@{}
$indexes = @()
$indexes += 97..122
$indexes += 65..90

foreach ($index in $indexes) {
    $a.Add([char]$index, $i)
    $i++
}

foreach ($rucksack in $rucksacks) {

    $matchedCharacter = ""

    $count = $count + 1

    [int]$length = $rucksack.length

    [int]$rucksacklength = $length / 2

    $container1 = $rucksack.SubString(0, $($rucksacklength))
    $container2 = $rucksack.SubString($rucksacklength, $rucksacklength)

    for ($i = 0; $i -lt $rucksacklength; $i++) {

        $character = $container1[$i]

        if ($container2.contains($character)) {

            if ($matchedCharacter -eq $character) {

            }
            else {
                $sum += $a.$character
            }

            $matchedCharacter = $character


        }
    }
}

$sum

for ($i = 0; $i -lt (($rucksacks | Measure-Object).Count); $i += 3) {

    $matchedCharacter = ""

    $rucksack1 = $rucksacks[$i]
    $rucksack2 = $rucksacks[$i + 1]
    $rucksack3 = $rucksacks[$i + 2]

    [int]$length = $rucksack1.Length

    for ($c = 0; $c -lt $length; $c++) {

        $character = $rucksack1[$c]

        if ($rucksack2.contains($character)) {

            if ($rucksack3.contains($character)) {

                if ($matchedCharacter -eq $character) {

                }
                else {
                    $sum2 += $a.$character
                }

                $matchedCharacter = $character

            }


        }
    }


}

$sum2