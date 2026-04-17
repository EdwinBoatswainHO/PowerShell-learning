function max-rot($n)
{
    [int64] $result = $n
    [int64] $length = Get-NumDigits $n
    for ([int64] $i = 0; $i -lt $length - 1; $i++) {
        $reserved = Get-NDigits $n $i
        Write-Host $i, $reserved
        $rest = $n - $reserved
        $rotated = rotate $rest
        $temp = $reserved + $rotated
        if ($temp -gt $result) {
            $result = $temp
        }
        Write-Host $temp
        $n = $temp
    }

    return $result
}

function rotate($n) {
    [int64] $length = Get-NumDigits $n
    [int64] $leftMost = [math]::Floor( ($n / [math]::Pow(10, ($length -1))) )

    $highestPower = Get-NDigits $n 1
    $n = (($n - $highestPower) * 10) + $leftMost 
    return $n;
}

function Get-NDigits([int64] $n, [int64]$numDigitsToKeep) {
    [int64] $length = Get-NumDigits $n

    [int64] $pos = [int64] [math]::Pow(10, ($length -$numDigitsToKeep))

    $result = [int64] [math]::Floor( ($n / $pos) ) * $pos 

    return $result
}

function Get-NumDigits($n)
{
    [int64] $result = 0
    [int64] $powersOf10 = 1;
    while (($n % $powersOf10) -ne $n) {
        $result     += 1
        $powersOf10 *= 10
    }
    return $result
}
