
</> Markdown

# 🇪🇸 README_ES.md

```md
🇬🇧 [Read in English](README.md)

# Launcher de MySQL Workbench con control de servicio

Script en Batch para ejecutar MySQL Workbench iniciando el servicio necesario solo cuando se utiliza y
deteniéndolo al cerrar la aplicación.

---

## Problema

Windows inicia el servicio `MYSQL84` al arrancar el sistema, aunque no se vaya a utilizar MySQL Workbench.  
Esto provoca consumo innecesario de recursos y ralentiza el inicio.

---

## Solución

El script automatiza el proceso:

1. Inicia el servicio `MYSQL84`  
2. Abre MySQL Workbench  
3. Espera al cierre de la aplicación  
4. Detiene el servicio automáticamente  

---

## Resultado

- Menor consumo de recursos  
- Inicio del sistema más limpio  
- Automatización completa del flujo de trabajo  

---

## Requisitos

Antes de usar el script, el servicio `MYSQL84` debe configurarse manualmente para que no se inicie con Windows.

---

## Nota de uso

Antes de utilizar el script, es necesario configurar el servicio
`MYSQL84` como deshabilitado en los servicios de Windows.

De este modo, el sistema siempre arranca con el servicio detenido,
lo que permite que el script controle completamente su ciclo de vida
(inicio y parada).

Esta decisión evita la necesidad de añadir validaciones adicionales
en el código y mantiene la lógica del script simple en un entorno
controlado.

---

## Limitaciones

Script pensado para uso personal en entorno controlado.  
No incluye validación del estado del servicio ni manejo avanzado de errores.

---

## Tecnologías

- Windows Batch  
- Servicios de Windows  
- MySQL Workbench  

---

## Script

```bat
@ECHO OFF
CLS
NET START MYSQL84
TIMEOUT /T 5 >NUL
ECHO Esperando el cierre de MySQLWorkbench...
START "" /WAIT MySQLWorkbench.exe
TIMEOUT /T 5 >NUL
NET STOP MYSQL84