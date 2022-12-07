$tree = Get-Content .\input.txt

$currentfolder= $null
$currentfolder = @('/')
$folders=@{}

foreach ($branch in $tree) {

    if ($branch -match '^\$\ cd.*') {

        if ($branch -eq '$ cd /') {
            $currentfolder = @('/')
            $currentfolder.count
        }

        elseif ($branch -notmatch "\.\."){
            $currentfolder += $branch.split(' ')[-1]

        }

        elseif ($branch -match '\.\.') {
            $currentfolder = $currentfolder[0..($currentfolder.count -2)]
            
        }

    }

    elseif ($branch -match '^[0-9]') {
        foreach ($number in (0..($currentfolder.count-1))) {
            $folders[(($currentfolder)[0..$number] -join '')] += [int]($branch.split(' ')[0])
        }
    }
}

foreach ($folder in $folders.GetEnumerator()) {

    $name = $folder | Select-Object -expandproperty Name

    if($folders[$name] -le 100000) {
        $totalsum += $folders[$($folder.name)]
    }
}

$totalsum

$totalSpace = 70000000
$usedSpace = $folders.GetEnumerator() | Sort-Object value -Descending | Select-Object -First 1 | Select-Object -ExpandProperty value 

$currentFreeSpace = $totalSpace - $usedSpace
$spaceRequired = 30000000

$difference = $spaceRequired - $currentFreeSpace

$folders.GetEnumerator() | where-object {value -ge $difference} | Sort-Object value -Descending | Select-object -First 1 -ExpandProperty Value