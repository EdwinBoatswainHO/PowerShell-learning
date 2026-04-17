BeforeAll {
    . "$PSScriptRoot/max-rot.ps1"
}

Describe "rotate" {
    It "Should rotate numbers" {
        $ans = rotate 56789
        $ans | Should -be 67895
    }
}

Describe "Get-NumDigits" {
    It "Should count number of digits" {
        $ans = Get-NumDigits 123
        $ans | Should -be 3
    }
    It "Should work for a single digit" {
        $ans = Get-NumDigits 8
        $ans | Should -be 1
    }
}

Describe "Get-NDigits" {
    It "Should keep n digits to the left of a number" {
        $ans = Get-NDigits 123 2
        $ans | Should -be 120
        $ans = Get-NDigits 67895 3
        $ans | Should -be 67800
    }

    It "Should return zero if asked for zero digits" {
                $ans = Get-NDigits 123 0
                $ans | Should -be 0

    }
}

Describe "max-rot" {
  Context "Fixed Tests" {
    It "Should Pass Fixed Tests" {
      $ans = max-rot 38458215
      $ans | Should -Be 85821534
      $ans = max-rot 195881031
      $ans | Should -Be 988103115
      $ans = max-rot 16130873362142
      $ans | Should -Be 63873362142110
    } 
  }
}
