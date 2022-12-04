$assignments = Get-Content .\input.txt

$count = 0
$count2 = 0

foreach ($assignment in $assignments) {

    $group1 = ($assignment -split(","))[0]
    $group2 = ($assignment -split(","))[1]

    [int]$group1fn = ($group1 -split("-"))[0]
    [int]$group1sn = ($group1 -split("-"))[1]

    [int]$group2fn = ($group2 -split("-"))[0]
    [int]$group2sn = ($group2 -split("-"))[1]

    if ($group1fn -le $group2fn -and $group1sn -ge $group2sn) {

        $count++

        #Write-Output "$group2 is inside $group1"

    }
    elseif ($group1fn -ge $group2fn -and $group1sn -le $group2sn) {

        $count++

        #Write-Output "$group1 is inside $group2"

    }

    if ($group1fn -in $group2fn..$group2sn -or $group1sn -in $group2fn..$group2sn -or $group2fn -in $group1fn..$group1sn -or $group2sn -in $group1fn..$group1sn) {

        $count2++

        #Write-Output "$group2 is inside $group1"

    }

}

$count
$count2


