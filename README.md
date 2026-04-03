</> Markdown

🇪🇸 [Leer en español](README_ES.md)

# MySQL Workbench Service Launcher

Windows Batch script to run MySQL Workbench by starting the required service only when needed and stopping
it after use.

---

## Problem

Windows starts the `MYSQL84` service at system startup, even when MySQL Workbench is not going to be used.  
This leads to unnecessary resource consumption and slower system startup.

---

## Solution

The script automates the workflow:

1. Starts the `MYSQL84` service  
2. Launches MySQL Workbench  
3. Waits until the application is closed  
4. Stops the service automatically  

---

## Result

- Reduced resource usage  
- Cleaner system startup  
- Fully automated workflow  

---

## Requirements

Before using the script, the `MYSQL84` service must be disabled from automatic startup in Windows.

---

## Usage Note

Before using the script, the `MYSQL84` service must be disabled
in Windows Services.

This ensures the system always starts with the service stopped,
allowing the script to fully control its lifecycle (start and stop).

This approach avoids the need for additional validation in the code
and keeps the script logic simple within a controlled environment.

---

## Limitations

This script is designed for a controlled environment and personal use.  
It does not include validation for service state or advanced error handling.

---

## Technologies

- Windows Batch  
- Windows Services  
- MySQL Workbench  

---

## Script

```bat
@ECHO OFF
CLS
NET START MYSQL84
TIMEOUT /T 5 >NUL
ECHO Waiting for MySQLWorkbench to close...
START "" /WAIT MySQLWorkbench.exe
TIMEOUT /T 5 >NUL
NET STOP MYSQL84