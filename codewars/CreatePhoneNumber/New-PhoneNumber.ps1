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

    # return string in the correct format after validation

    return "($($numbers[0])$($numbers[1])$($numbers[2])) " +
           "$($numbers[3])$($numbers[4])$($numbers[5])-" +
           "$($numbers[6])$($numbers[7])$($numbers[8])$($numbers[9])"
}
