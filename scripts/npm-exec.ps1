$PROGRAM = $MyInvocation.InvocationName

$DIR = $PWD.Path

while ((Test-Path (Join-Path $DIR -ChildPath "node_modules/.bin" -AdditionalChildPath $PROGRAM)) -eq $false) {
    $DIR = Split-Path -Path $DIR
    if ($DIR.Length -eq 0) {
        Write-Error "Local node program not found: $PROGRAM" -Category ObjectNotFound
        throw
    }
}

Invoke-Command {
    param($arglist)
    $RelativeProgramPath = Join-Path $DIR -ChildPath "node_modules/.bin" -AdditionalChildPath $PROGRAM | Resolve-Path -Relative
    Invoke-Expression "$RelativeProgramPath $arglist"
} -ArgumentList $ARGS -NoNewScope