param(
    [int]$ProcessId,
    [string]$NewName
)

function Set-ProcessCommandLine {
    param(
        [int]$ProcessId,
        [string]$CommandLine
    )

    $process = Get-WmiObject -Query "SELECT * FROM Win32_Process WHERE ProcessId = $ProcessId"
    $process.CommandLine = $CommandLine
    $process.Put()
}

Set-ProcessCommandLine -ProcessId $ProcessId -CommandLine $NewName
