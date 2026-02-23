# Invoke-ProcessAction
A simple but powerful PowerShell function to manage Windows processes. This tool allows you to Start, Stop, Restart, and get Info about processes using a single command. It also supports Pipeline input, meaning you can manage multiple processes at once.

PowerShell Process Manager
A simple but powerful PowerShell function to manage Windows processes. This tool allows you to Start, Stop, Restart, and get Info about processes using a single command. It also supports Pipeline input, meaning you can manage multiple processes at once.

Features
Verb-Noun Syntax: Follows professional PowerShell naming standards (Invoke-ProcessAction).

Validation: Prevents errors by checking if a process is already running before starting or stopping it.

Pipeline Support: Use the pipe operator (|) to pass process names into the function.

Colored Feedback: Uses different colors in the console to show success, warnings, or errors.

How to Use

1. Basic Commands
To check if Notepad is running:

PowerShell
Invoke-ProcessAction -ProcessName "notepad" -Action Info
To stop a process:

PowerShell
Invoke-ProcessAction -ProcessName "notepad" -Action Stop

2. Using the Pipeline
You can manage many processes at the same time by sending a list through the pipeline:

PowerShell
"notepad", "calc", "msedge" | Invoke-ProcessAction -Action Info

3. Restarting a Process
The restart action will stop the process (if it is running) and then start it again immediately:

PowerShell
Invoke-ProcessAction -ProcessName "notepad" -Action Restart
Parameters
$ProcessName: The name of the application (e.g., "notepad", "chrome").

$Action: Choose between Start, Stop, Restart, or Info.
