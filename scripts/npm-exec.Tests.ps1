Describe 'Test npm-exec.test.ps1' {
    BeforeAll {

    }
    
    AfterAll {
 
    }

    Context 'Post executing New-Script' {
        It 'Should have command accessible' {
            $Results = Get-Command .\npm-exec.ps1 | Select-Object -ExpandProperty CommandType
            $Results | Should -Be 'ExternalScript'
        }
    }

    Context 'Post executing New-Script' {
        It 'Should have command accessible' {
            $Results = .\npm-exec.ps1 start
            $Results | Should -Be 'ExternalScript'
        }
    }
}

