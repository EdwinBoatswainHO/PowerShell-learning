# These are the CodeWars tests
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
}
