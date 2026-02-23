function Invoke-ProcessAction {
    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
        [string]$ProcessName,

        [Parameter(Position=1, Mandatory=$true)]
        [ValidateSet("Start", "Stop", "Restart", "Info")]
        [string]$Action
    )

    process {
        # This block runs for every process name sent through the pipeline
        $isRunning = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

        switch ($Action) {
            "Start" {
                if ($isRunning) { 
                    Write-Host "'$ProcessName' is already running." -ForegroundColor Yellow 
                }
                else { 
                    Start-Process $ProcessName 
                    Write-Host "Started '$ProcessName'." -ForegroundColor Green
                }
            }

            "Stop" {
                if (-not $isRunning) { 
                    Write-Host "'$ProcessName' is not running." -ForegroundColor Cyan 
                }
                else { 
                    Stop-Process -Name $ProcessName -Force
                    Write-Host "Stopped '$ProcessName'." -ForegroundColor Red
                }
            }

            "Restart" {
                if ($isRunning) { Stop-Process -Name $ProcessName -Force }
                Start-Process $ProcessName
                Write-Host "Restarted '$ProcessName'." -ForegroundColor Green
            }

            "Info" {
                if (-not $isRunning) { 
                    Write-Host "'$ProcessName' is not running." -ForegroundColor Cyan 
                }
                else { 
                    $isRunning | Select-Object Name, Id, CPU, WorkingSet
                }
            }
        }
    }
}