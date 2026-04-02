function New-PhoneNumber([int[]]$numbers)
{
    $sz = $numbers.Length
    if ($sz -ne 10) {
        return ""
    }
    # What to do with numbers out of range?
    foreach ($number in $numbers) {
        if (($number -lt 0) -or ($number -gt 9)) {
            return ""
        }
    }

    # Use array slicing and join to build the string

    $areaCode  = $numbers[0..2] -join ''
    $firstPart = $numbers[3..5] -join ''
    $LastPart  = $numbers[6..9] -join ''

    return "($areaCode) $firstPart-$lastPart"
}
