@ECHO OFF
CLS
NET START MYSQL84
TIMEOUT /T 5 >NUL
ECHO Esperando el cierre de MySQLWorkbench para detener el servicio...
START "" /WAIT MySQLWorkbench.exe
ECHO Cerrando MySQLWorkbench...
TIMEOUT /T 5 >NUL
NET STOP MYSQL84