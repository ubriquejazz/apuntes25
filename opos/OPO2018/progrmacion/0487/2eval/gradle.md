# Rúbrica Gradle

Rubrica para la Act. 8.3 - Proyecto de 3 + 4 horas del Trimestre 2

| Criterio Específico                                          | Excelente (4 puntos)                                         | Bueno (3 puntos)                                             | Regular (2 puntos)                                           | Deficiente (1 punto)                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1. Importación del Proyecto en IntelliJ IDEA                 | El proyecto Gradle se importa en IntelliJ IDEA sin problemas, y el entorno se configura correctamente para la compilación y ejecución. | El proyecto se importa con mínima asistencia; la configuración requiere ajustes menores. | La importación o configuración del proyecto en IntelliJ IDEA presenta dificultades moderadas. | El estudiante no logra importar o configurar el proyecto en IntelliJ IDEA. |
| 2. Compilación, Ejecución y Empaquetado en IntelliJ IDEA     | El estudiante utiliza eficazmente las herramientas de IntelliJ IDEA (panel Gradle, menú Build, configuraciones de ejecución) para compilar, ejecutar y empaquetar la aplicación Java. | El estudiante compila, ejecuta y empaqueta la aplicación en IntelliJ IDEA, pero no utiliza todas las herramientas de manera óptima. | El estudiante logra compilar/ejecutar/empaquetar con asistencia, o con un uso limitado de las funcionalidades del IDE. | El estudiante tiene dificultades significativas para compilar, ejecutar o empaquetar la aplicación en IntelliJ IDEA. |
| 3. Comparación de Flujos de Trabajo (VS Code vs. IntelliJ IDEA) | La comparación es detallada, identificando claramente similitudes y diferencias en la interfaz, integración de Gradle y métodos de trabajo en ambos IDEs. | La comparación es correcta, identificando las principales similitudes y diferencias entre ambos entornos. | La comparación es superficial o incompleta, con algunas imprecisiones o faltas de detalle. | La comparación es mínima o no se realiza de forma significativa. |
| 4. Análisis de Ventajas/Desventajas y Experiencia de Usuario | El análisis es profundo, destacando ventajas y desventajas de cada IDE para el desarrollo Java/Gradle, y reflejando una comprensión crítica de la experiencia de usuario. | El análisis identifica algunas ventajas y desventajas relevantes de cada IDE. | El análisis es limitado, centrándose en aspectos superficiales o con poca profundidad. | No se realiza un análisis comparativo de ventajas/desventajas o experiencia de usuario. |
| 5. Identificación de Archivos Generados y Estructura del Proyecto | El estudiante localiza y describe con precisión los archivos generados (clases, JAR) y explica las diferencias en la estructura del proyecto entre ambos IDEs. | El estudiante localiza los archivos generados y tiene una comprensión básica de la estructura en ambos IDEs. | El estudiante tiene dificultades para localizar los archivos generados o comprender las diferencias estructurales. | El estudiante no logra identificar los archivos generados o la estructura del proyecto. |
| 6. Cumplimiento del Criterio (f) - Generación en Distintos Entornos | El trabajo demuestra claramente la capacidad de generar ejecutables a partir del mismo código fuente en dos entornos distintos (VS Code e IntelliJ IDEA), con un análisis comparativo exhaustivo. | El trabajo demuestra la generación en ambos entornos y una comparación adecuada, cumpliendo el criterio de forma satisfactoria. | La demostración de la generación en ambos entornos o la comparación es débil, cumpliendo el criterio de forma limitada. | El criterio (f) no se cumple de manera efectiva a través de esta actividad. |

## Act. 8.2: Desarrollo en VS Code

**Objetivo:** Los estudiantes aprenderán a configurar un proyecto Java con Gradle y lo utilizarán para compilar, ejecutar y empaquetar una aplicación, familiarizándose con la integración de herramientas de <u>automatización en un IDE ligero</u> como es Visual Studio Code.

**Recursos Necesarios:**

- **Visual Studio Code** con las extensiones Java Extension Pack (incluye Language Support for Java™ by Red Hat, Debugger for Java, Maven for Java, Project Manager for Java, y Test Runner for Java).
- **JDK (Java Development Kit)** instalado y configurado en la PATH del sistema.
- **Gradle** (se puede gestionar a través del Wrapper de Gradle que viene con los proyectos).
- Conocimientos básicos de Java.

**Descripción de la Actividad:**

1. **Configuración del Entorno Java en VS Code:**
   - Los estudiantes se asegurarán de tener el **Java Extension Pack** instalado en VS Code.
   - Verificarán que un **JDK** compatible esté configurado en VS Code.
2. **Creación de un Proyecto Java con Gradle:**
   - Utilizarán el comando `gradle init` en el terminal integrado de VS Code para crear un nuevo proyecto Java. Seleccionarán un tipo de proyecto `application` y el DSL de Groovy o Kotlin (Groovy es común para empezar).
   - Explorarán la estructura de carpetas generada por Gradle (`src/main/java`, `src/test/java`, `build.gradle`).
3. **Desarrollo de la Aplicación Java:**
   - Crearán una aplicación Java simple (ej. un programa que realice operaciones básicas, gestione una pequeña lista, o simule un escenario sencillo). Este será el "mismo código fuente" que se usará en la siguiente actividad.
4. **Uso de Gradle en VS Code para Automatización:**
   - **Compilación:** Ejecutarán la tarea `gradle build` desde el terminal de VS Code para compilar el proyecto. Observarán la generación de los archivos `.class`.
   - **Ejecución:** Utilizarán la tarea `gradle run` para ejecutar la aplicación directamente desde el terminal.
   - **Empaquetado:** Ejecutarán la tarea `gradle jar` o `gradle assemble` para crear un archivo JAR ejecutable de la aplicación, que es la forma empaquetada del "ejecutable". Observarán dónde se genera este archivo (`build/libs`).
   - Opcional: Configurarán tareas de VS Code (`tasks.json`) para invocar comandos de Gradle directamente desde la paleta de comandos o atajos de teclado.

## Act. 8.3: Desarrollo en IntelliJ IDEA y Comparativa

**Objetivo:** Los estudiantes replicarán el proceso de la Actividad 8.2 en IntelliJ IDEA, importando el mismo proyecto Gradle. Esto les permitirá comparar las características y el flujo de trabajo de dos IDEs diferentes para el mismo tipo de proyecto y herramienta de automatización.

**Recursos Necesarios:**

- **IntelliJ IDEA Community Edition** instalado.
- El proyecto Java/Gradle creado en la Actividad 1.
- El mismo **JDK** utilizado en la Actividad 1 (para asegurar la compatibilidad).

**Descripción de la Actividad:**

1. **Importación del Proyecto Gradle en IntelliJ IDEA:**
   - Los estudiantes abrirán IntelliJ IDEA e importarán el proyecto Gradle existente (creado en VS Code). IntelliJ IDEA debería reconocer automáticamente el `build.gradle` y configurar el proyecto.
2. **Exploración de IntelliJ IDEA para Proyectos Gradle:**
   - Observarán cómo IntelliJ IDEA organiza el proyecto, sus <u>paneles específicos</u> para Gradle, la estructura de dependencias y las tareas de Gradle disponibles en la interfaz gráfica.
   - Compararán la interfaz y la experiencia de usuario con VS Code.
3. **Compilación, Ejecución y Empaquetado en IntelliJ IDEA:**
   - **Compilación:** Utilizarán la interfaz gráfica de IntelliJ IDEA (ej. el panel de Gradle o el menú `Build`) para compilar el proyecto.
   - **Ejecución:** Ejecutarán la aplicación directamente desde IntelliJ IDEA, ya sea a través del botón de ejecución, el panel de Gradle o creando una configuración de ejecución.
   - **Empaquetado:** Usarán las funcionalidades de IntelliJ IDEA o invocarán la tarea `gradle jar` (o `assemble`) desde el terminal integrado de IntelliJ para empaquetar la aplicación.
4. **Comparación de Características y Análisis de Diferencias:**
   - Los estudiantes elaborarán un breve informe o tabla comparativa que destaque:
     - **Similitudes:** Qué tareas de Gradle se ejecutan igual, qué configuración de JDK es similar.
     - **Diferencias en el Flujo de Trabajo:** Cómo se realizan las acciones de compilar, ejecutar y empaquetar en cada IDE (terminal vs. GUI).
     - **Integración de Gradle:** Nivel de integración de Gradle en cada IDE (VS Code como editor extensible vs. IntelliJ como IDE completo con soporte nativo).
     - **Ventajas/Desventajas:** Cuáles son las fortalezas de cada entorno para el desarrollo Java con Gradle.
     - **Visualización de Archivos Generados:** Dónde se encuentran los archivos `.class` y el JAR empaquetado en la estructura del proyecto en cada caso.