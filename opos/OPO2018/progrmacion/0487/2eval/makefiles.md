# Rúbrica makefiles

Rubrica para la Act. 7.3 - Proyecto de 5h en el Trimestre 2

| Criterio Específico                                          | Excelente (4 puntos)                                         | Bueno (3 puntos)                                             | Regular (2 puntos)                                           | Deficiente (1 punto)                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1. Configuración del VS Code y Compilador                    | El entorno de VS Code está perfectamente configurado con las extensiones y el compilador C/C++ es accesible, sin asistencia. | El entorno y compilador están configurados con mínima asistencia. | El entorno y compilador requieren asistencia moderada para ser configurados. | El estudiante no logra configurar el entorno o el compilador de manera funcional. |
| 2. Creación y Estructura de Archivos Fuente                  | Los archivos fuente en C y C++ están bien organizados y demuestran una clara comprensión de la modularidad y las dependencias (ej. .h y .c/.cpp). | Los archivos fuente están creados correctamente, con una organización aceptable y gestión de dependencias básica. | Los archivos fuente muestran problemas de organización o gestión de dependencias. | Los archivos fuente son incorrectos o la estructura no permite la gestión de dependencias. |
| 3. Desarrollo del Makefile (Sintaxis y Reglas)               | El Makefile es robusto, utiliza variables adecuadas, incluye reglas explícitas para la compilación modular y el enlazado, y su sintaxis es impecable. | El Makefile es funcional, aunque podría optimizarse en el uso de variables o la claridad de las reglas. | El Makefile es parcialmente funcional, con errores de sintaxis o lógica que requieren corrección. | El Makefile es incorrecto o no funcional.                    |
| 4. Gestión de Dependencias (Automatización de Recompilación) | La gestión de dependencias está implementada eficazmente, y make recompila solo los archivos necesarios tras modificaciones, demostrando plena comprensión. | La gestión de dependencias funciona, aunque en algunos escenarios podría recompilar más de lo necesario. | La gestión de dependencias es limitada o requiere intervención manual para funcionar correctamente. | La gestión de dependencias no está implementada o no funciona. |
| 5. Automatización y Limpieza (clean target)                  | La automatización completa del proceso de compilación es evidente. La regla clean es eficiente y elimina todos los archivos generados correctamente. | La automatización es clara, y la regla clean funciona en la mayoría de los casos. | La automatización o la regla clean tienen deficiencias o requieren pasos adicionales. | La automatización es mínima o la regla clean no funciona o está ausente. |
| 6.  Cumplimiento del Criterio (e) -Generación Exitosa de Ejecutables Multi-Lenguaje | Se generan ejecutables funcionales tanto para C como para C++ (e inter-lenguaje si se optó por ello) sin errores, demostrando un dominio completo del proceso. | Se generan ejecutables funcionales para C y C++, con errores menores o que requirieron poca depuración. | Solo se logran generar ejecutables para un lenguaje, o la generación presenta errores significativos. | No se logra generar ningún ejecutable funcional.             |
| 7. Uso del Terminal Integrado de VS Code                     | El estudiante utiliza el terminal de VS Code de forma fluida para ejecutar comandos make y verificar resultados. | El estudiante utiliza el terminal de VS Code para make con mínima asistencia. | El estudiante requiere asistencia para usar el terminal o ejecutar comandos. | El estudiante no logra usar el terminal para compilar el proyecto. |

## Enunciado

**Objetivo:** Los estudiantes aprenderán a compilar y generar ejecutables a partir de código fuente en C y C++ utilizando Makefiles, gestionando dependencias, automatizando la compilación y realizando la limpieza de archivos generados, todo dentro de **Visual Studio Code**. Esto demostrará la capacidad del IDE para manejar múltiples lenguajes y herramientas de compilación de manera avanzada.

**Recursos Necesarios:**

- **Visual Studio Code** con las extensiones adecuadas (ej. `C/C++` de Microsoft).
- **Compilador C/C++:** MinGW (Windows), GCC (Linux) o Clang (macOS) instalados y configurados en la PATH del sistema.
- Conocimientos básicos de C y C++.

### Descripción de la Actividad:

1. **Configuración del Entorno C/C++ en VS Code:**
   - Asegúrense de tener las extensiones de C/C++ instaladas en VS Code.
   - Verifiquen que el compilador de C/C++ esté correctamente configurado y accesible desde el **terminal integrado de VS Code**.
   - Opcional: Configuren un `tasks.json` básico en VS Code para compilar un único archivo C o C++ sin Makefile, como punto de partida para entender la compilación manual.
2. **Creación de Archivos Fuente y Dependencias:**
   - Creen un conjunto de archivos de código fuente que incluyan dependencias entre ellos:
     - `main.c` (o `main.cpp`): El archivo principal que llamará a funciones de otros módulos.
     - `modulo.h`: Un archivo de cabecera con la declaración de una función.
     - `modulo.c` (o `modulo.cpp`): La implementación de la función declarada en `modulo.h`.
   - Opcional: Pueden crear un programa que utilice ambos lenguajes (ej. C++ llamando a una función de C) para demostrar una integración más compleja.
3. **Desarrollo de Makefiles con Gestión de Dependencias y Automatización:**
   - **Makefile Principal:** Creen un `Makefile` principal que:
     - Defina variables para el compilador (`CC`, `CXX`), banderas de compilación (`CFLAGS`, `CXXFLAGS`) y bibliotecas (`LDFLAGS`).
     - Contenga reglas para compilar cada archivo `.c` o `.cpp` a su correspondiente archivo objeto (`.o`).
     - Defina una regla para enlazar todos los archivos objeto y generar el ejecutable final (ej. `mi_programa.exe` o `mi_programa`).
     - **Gestión de Dependencias:** Incluya dependencias explícitas para que `make` recompila automáticamente solo los archivos que han cambiado o cuyos archivos de cabecera (`.h`) han sido modificados. Esto se logra listando los archivos `.o` como dependientes de los `.c/.cpp` y sus `.h` correspondientes.
     - **Automatización de la Compilación:** La estructura del Makefile en sí misma automatizará la compilación. Observen cómo un simple comando `make` puede orquestar todo el proceso.
4. **Implementación de la Limpieza (Clean Target):**
   - Añadan una regla `clean` al Makefile que permita eliminar todos los archivos generados durante la compilación (archivos `.o`, ejecutables, etc.).
   - Demuestren su uso ejecutando `make clean` en el terminal.
5. **Compilación y Ejecución desde VS Code:**
   - Abran el **terminal integrado de VS Code**.
   - Utilicen el comando `make` para compilar todo el proyecto y generar el ejecutable.
   - Modifiquen un archivo fuente o de cabecera y ejecuten `make` de nuevo para observar cómo `make` solo recompila lo necesario (**gestión de dependencias**).
   - Ejecuten el programa generado desde el mismo terminal.
   - Finalmente, ejecuten `make clean` para limpiar el directorio de compilación.
