function max-rot($n)
{
    [int] $numDigits = Get-NumDigits $n
    [int] $result = $n

   return $result
}

function rotate($n) {
    [int] $length = Get-NumDigits $n
    [int] $leftMost = [math]::Floor( ($n / [math]::Pow(10, ($length -1))) )

    $highestPower = Get-NDigits $n 1
    $n = (($n - $highestPower) * 10) + $leftMost 
    return $n;
}

function Get-NDigits([int] $n, [int]$numDigitsToKeep) {
    [int] $length = Get-NumDigits $n

    [int] $pos = [int] [math]::Pow(10, ($length -$numDigitsToKeep))

    $result = [int] [math]::Floor( ($n / $pos) ) * $pos 

    return $result
}

function Get-NumDigits($n)
{
    [int] $result = 0
    [int] $powersOf10 = 1;
    while (($n % $powersOf10) -ne $n) {
        $result     += 1
        $powersOf10 *= 10
    }
    return $result
}
