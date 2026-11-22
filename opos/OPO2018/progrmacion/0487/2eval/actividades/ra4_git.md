# Desarrollo colaborativo con Git 

**Duración:** 9h, semanas hasta el 14/03 (evaluación)

## Objetivos

Comprender la importancia y los beneficios del control de versiones en el desarrollo de software.

Conocer la estructura y los conceptos fundamentales de los sistemas de control de versiones distribuidos, con énfasis en Git.

Aprender a utilizar las herramientas básicas de Git para la gestión de proyectos locales.

Familiarizarse con el uso de repositorios remotos para la colaboración y la gestión de proyectos en equipo.

## Criterios de evaluacion

f) Se ha realizado el control de versiones integrado en el entorno de desarrollo. 

h) Se han utilizado repositorios remotos para el desarrollo de código colaborativo. 

## Contenidos

Control de versiones. Estructura de las herramientas de control de versiones.

Repositorio. Herramientas de control de versiones. 

Uso integrado en el entorno de desarrollo: Repositorios remotos.

## Actividades

Exposición y Act.1: **Introducción al control de versiones**. 1h

- Discusión grupal sobre experiencias (si las hay) con la gestión de archivos y la colaboración.
- Presentación teórica con ejemplos prácticos.
- Breve comparación entre sistemas centralizados y distribuidos.

Exposición y Act.2: **Instalación y configuración de Git** . 1h

- Demostración paso a paso de la instalación en diferentes plataformas.
- Ejercicio práctico individual de configuración de Git. Verificación.

Exposición y Act.3: **Creación del primer repositorio local**. 1h

- Creación de un proyecto simple con algunos archivos.
- Ejercicio práctico de añadir archivos al área de preparación y verificar el estado.
- Creación de un archivo `.gitignore` para excluir archivos innecesarios.

Exposición y Act.4: **Realizando commits y explorando el historial** . 1h

- Ejercicio práctico de realizar varios commits con mensajes descriptivos.
- Exploración del historial de commits utilizando diferentes opciones de `git log`.
- Comparación de diferentes versiones de un archivo con `git diff`.

Exposición y Act.5: **Ramas (branches) en Git**. 1h

- Ejercicio práctico de crear y cambiar entre diferentes ramas.
- Simulación de trabajo en paralelo en diferentes ramas.

Exposición y Act.6: **Fusión (Merge) de ramas y resolución de conflictos** . 1h

- Ejercicio práctico de fusionar ramas que no generen conflicto.
- Ejercicio práctico de generar y resolver conflictos de fusión.

Exposición y Act.7: **Colaboración con Repositorios Remotos**. 2h

- Ejercicio práctico de enviar cambios a un repositorio remoto en GitHub
- Exploración de las funcionalidades de Git dentro del IDE y/o (GitHub Desktop)
- Ejercicio práctico de simular la colaboración entre dos "desarrolladores" (pueden ser dos estudiantes trabajando en el mismo repositorio).

**Evaluación** mediante examen (1 sesión)

---

NEAE A: Investigar sobre Bitbucket

NEAE A y C: Act. 1 a 6

NEAE TDAH (E): Act. 7 con pasos bien determinados; examen con extension de tiempo.



**Materiales:**

- Presentaciones teóricas. Ejercicios prácticos guiados.
- Acceso a un entorno de desarrollo con Git instalado.
- Acceso a una plataforma de repositorio remoto.







**Sesión 1: Introducción al Control de Versiones (60-90 minutos)**

- Contenido:
  - ¿Qué es el control de versiones y por qué es importante?
  - Problemas que resuelve el control de versiones (pérdida de cambios, colaboración, historial, etc.).
  - Tipos de sistemas de control de versiones: Centralizados vs. Distribuidos.
  - Introducción a Git: ¿Qué es y por qué es popular?
- Actividades:
  - Discusión grupal sobre experiencias (si las hay) con la gestión de archivos y la colaboración.
  - Presentación teórica con ejemplos prácticos.
  - Breve comparación entre sistemas centralizados y distribuidos.

**Sesión 2: Instalación y Configuración de Git (60-90 minutos)**

- Contenido:
  - Descarga e instalación de Git en diferentes sistemas operativos (Windows, macOS, Linux).
  - Configuración inicial de Git: nombre de usuario, correo electrónico.
  - Concepto de `git config`.
  - Primeros comandos: `git --version`, `git config --global user.name`, `git config --global user.email`.
- Actividades:
  - Demostración paso a paso de la instalación en diferentes plataformas.
  - Ejercicio práctico individual de configuración de Git.
  - Verificación de la configuración.

**Sesión 3: Creación del Primer Repositorio Local y Seguimiento de Cambios (60-90 minutos)**

- Contenido:
  - Creación de un nuevo repositorio local con `git init`.
  - El área de trabajo, el área de preparación (staging area) y el repositorio.
  - Seguimiento de archivos: `git add`, `git status`.
  - Ignorar archivos: el archivo `.gitignore`.
- Actividades:
  - Creación de un proyecto simple con algunos archivos.
  - Ejercicio práctico de añadir archivos al área de preparación y verificar el estado.
  - Creación de un archivo `.gitignore` para excluir archivos innecesarios.

**Sesión 4: Realizando Commits y Explorando el Historial (60-90 minutos)**

- Contenido:
  - ¿Qué es un commit? La importancia de los mensajes de commit.
  - Realizando commits con `git commit`.
  - Visualización del historial de commits: `git log`.
  - Opciones útiles de `git log`: `--oneline`, `--graph`, `--author`, `--date`.
  - Visualización de las diferencias entre commits: `git diff`.
- Actividades:
  - Ejercicio práctico de realizar varios commits con mensajes descriptivos.
  - Exploración del historial de commits utilizando diferentes opciones de `git log`.
  - Comparación de diferentes versiones de un archivo con `git diff`.

**Sesión 5: Ramas (Branches) en Git: Creación y Gestión (60-90 minutos)**

- Contenido:
  - ¿Qué son las ramas y por qué son importantes?
  - Creación de nuevas ramas con `git branch`.
  - Listado de ramas con `git branch`.
  - Cambiar entre ramas con `git checkout`.
  - El concepto de la rama `main` (o `master`).
- Actividades:
  - Ejercicio práctico de crear y cambiar entre diferentes ramas.
  - Simulación de trabajo en paralelo en diferentes ramas.

**Sesión 6: Fusión (Merge) de Ramas y Resolución de Conflictos (60-90 minutos)**

- Contenido:
  - ¿Qué es la fusión (merge)?
  - Fusión de ramas con `git merge`.
  - Conflictos de fusión: ¿cuándo ocurren y cómo identificarlos?
  - Resolución manual de conflictos de fusión.
  - Herramientas del IDE para la resolución de conflictos.
- Actividades:
  - Ejercicio práctico de fusionar ramas que no generen conflicto.
  - Ejercicio práctico de generar y resolver conflictos de fusión.

**Sesión 7: Introducción a Repositorios Remotos (60-90 minutos)**

- Contenido:
  - ¿Qué son los repositorios remotos y para qué sirven?
  - Plataformas populares: GitHub, GitLab, Bitbucket.
  - Creación de un repositorio remoto en una plataforma.
  - Añadir un repositorio remoto a un proyecto local con `git remote add`.
  - Visualizar repositorios remotos con `git remote -v`.
- Actividades:
  - Creación de una cuenta en una plataforma de repositorio remoto (si no se tiene).
  - Creación de un repositorio remoto vacío.
  - Conexión de un repositorio local con el repositorio remoto creado.

**Sesión 8: Colaboración con Repositorios Remotos (60-90 minutos)**

- Contenido:
  - Enviar cambios al repositorio remoto con `git push`.
  - Obtener cambios del repositorio remoto con `git pull`.
  - El flujo de trabajo básico de colaboración (clonar, crear rama, modificar, commit, push, pull).
  - Concepto de "origin" y ramas remotas.
- Actividades:
  - Ejercicio práctico de enviar cambios a un repositorio remoto.
  - Ejercicio práctico de simular la colaboración entre dos "desarrolladores" (pueden ser dos estudiantes trabajando en el mismo repositorio).

**Sesión 9: Trabajo con Repositorios Remotos Avanzado y Herramientas Integradas (60-90 minutos)**

- Contenido:
  - Clonar un repositorio existente con `git clone`.
  - Uso de la interfaz de Git integrada en el IDE (ejemplos con el IDE que se esté utilizando).
  - Solicitudes de fusión (Pull Requests / Merge Requests): ¿qué son y cómo utilizarlas para la revisión de código?
  - Otras operaciones comunes con remotos: `git fetch`, `git branch -r`, `git checkout -t`.
- Actividades:
  - Ejercicio práctico de clonar un repositorio remoto existente.
  - Exploración de las funcionalidades de Git dentro del IDE.
  - Creación y gestión de una solicitud de fusión en la plataforma remota.
