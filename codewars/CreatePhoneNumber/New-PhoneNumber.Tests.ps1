# First 2 tests are code wars. Remaining tests exercise validation
BeforeAll {
    . "$PSScriptRoot/New-PhoneNumber.ps1"
}

Describe "Fixed Tests" {
	it "Should pass" {
		[int[]]$numbers = @(1, 2, 3, 4, 5, 6, 7, 8, 9, 0)
		New-PhoneNumber($numbers) | Should -Be "(123) 456-7890"
	}
	
	it "Should pass" {
		[int[]]$numbers = @(1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
		New-PhoneNumber($numbers) | Should -Be "(111) 111-1111"
	}

    it "Should handle arrays too big" {
        [int[]]$numbers = @(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
		New-PhoneNumber($numbers) | Should -Be ""
    }
    
    it "Should handle arrays too small" {
        [int[]]$numbers = @(1, 1)
        New-PhoneNumber($numbers) | Should -Be ""
    }

    it "Should handle arrays too big" {
        [int[]]$numbers = @(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
		New-PhoneNumber($numbers) | Should -Be ""
    }
    it "Should reject arrays containing numbers outside of range [0-9]" {
        [int[]]$numbers = @(1, 1, 1, 1, 1, 1, 1, 1, 1, 10)
		New-PhoneNumber($numbers) | Should -Be ""
    }
}
