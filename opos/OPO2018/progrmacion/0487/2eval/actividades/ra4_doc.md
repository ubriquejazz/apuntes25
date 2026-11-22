# Documentación y analizadores de codigo

**Duración:** 6h, semana antes de navidad y la de después 10/01 (FFEOE)

## Objetivos

* Utilizar las herramientas integradas en el entorno de desarrollo para generar documentación clara y concisa de las clases implementadas.

* Emplear un analizador de código estático para identificar posibles errores, malas prácticas o áreas de mejora en el código fuente.
* Comprender y modificar las opciones de configuración de un analizador de código para adaptarlo a las necesidades específicas del proyecto.

## Criterios de evaluación

* g) Se han utilizado herramientas del entorno de desarrollo para documentar las clases.

* c) Se ha revisado el código fuente usando un analizador de código.

* d) Se han identificado las posibilidades de configuración de un analizador de código.

## Contenidos

<u>Documentación</u>. Comentarios tipo docstrings en Python. Plugin en VSCode para generar template automatico. Prueba con el metodo clase.--doc--()

<u>Analizadores de código</u>. Tutorial de [pylint](https://docs.pylint.org/tutorial.html). Plugin en VSCode para ver problemas en tiempo real mientras se teclea el codigo.

## Actividades

Exposición y Act. 1: **Introducción a Docstrings en Visual Studio**. 1.5h

1. Tarea A: El profesor/a introduce el concepto de documentación automática y realiza una demostración práctica de cómo utilizar la herramienta en VS para generar documentación a partir de un ejemplo en Python sencillo.
2. Tarea B: Los alumnos trabajan con un fragmento de código proporcionado y añaden comentarios y etiquetas de documentación siguiendo las indicaciones del profesor/a.
3. Resultado: Los alumnos exploran la documentación generada por la herramienta y analizan la información que se incluye (descripción de clases, métodos, parámetros, valores de retorno, etc.).

Exposición y Act. 2: **Introducción al análisis estático de código Pylint**. 1h

1. Tarea A: El profesor/a presenta el analizador de código que se va a utilizar, explicando su interfaz y las categorías de problemas que analiza.
2. B1: Los alumnos ejecutan el analizador de código sobre un proyecto de ejemplo (posiblemente el mismo de la sesión anterior).
3. B2: En grupos pequeños, analizan los resultados del análisis, identificando los problemas reportados y tratando de comprender las explicaciones proporcionadas por el analizador.
4. Resultado: Identificar los tipos de problemas que un analizador de código puede detectar 

**Evaluación** mediante examen (0.5h)

---

NEAE A: Investigar sobre la documentación automática en Java (Javadocs)
Estudiar la importancia de integrar el análisis de código en el flujo de trabajo de desarrollo. 

NEAE A y C: Act. 1

NEAE TDAH (E): Act. 1 con pasos bien determinados; examen con extension de tiempo.







**Sesión 1: Introducción a la Documentación en el Entorno de Desarrollo**

- Objetivos Específicos:
  - Conocer las herramientas de documentación automática disponibles en el entorno de desarrollo utilizado (por ejemplo, Javadoc en Java, Docstrings en Python).
  - Comprender la importancia de la documentación para la mantenibilidad y colaboración en proyectos de software.
  - Aprender a escribir comentarios y etiquetas de documentación de forma efectiva.
- Actividades:
  1. **Presentación y Demostración:** El profesor/a introduce el concepto de documentación automática y realiza una demostración práctica de cómo utilizar la herramienta del entorno de desarrollo para generar documentación a partir de un ejemplo de código sencillo.
  2. **Ejercicio Práctico Guiado:** Los alumnos/as trabajan con un fragmento de código proporcionado y añaden comentarios y etiquetas de documentación siguiendo las indicaciones del profesor/a.
  3. **Exploración Personal:** Los alumnos/as exploran la documentación generada por la herramienta y analizan la información que se incluye (descripción de clases, métodos, parámetros, valores de retorno, etc.).
  4. **Debate Grupal:** Se discute en grupo la utilidad de la documentación y las buenas prácticas para escribir documentación clara y útil.

**Sesión 2: Introducción al Análisis Estático de Código**

- Objetivos Específicos:
  - Comprender el concepto de análisis estático de código y su utilidad para la calidad del software.
  - Familiarizarse con la interfaz y el funcionamiento básico de un analizador de código específico.
  - Identificar los tipos de problemas que un analizador de código puede detectar (errores potenciales, problemas de estilo, vulnerabilidades, etc.).
- Actividades:
  1. **Presentación del Analizador:** El profesor/a presenta el analizador de código que se va a utilizar, explicando su interfaz y las categorías de problemas que analiza.
  2. **Primera Ejecución:** Los alumnos/as ejecutan el analizador de código sobre un proyecto de ejemplo (posiblemente el mismo de la sesión anterior o uno nuevo).
  3. **Análisis de Resultados:** En grupos pequeños, los alumnos/as analizan los resultados del análisis, identificando los problemas reportados y tratando de comprender las explicaciones proporcionadas por el analizador.
  4. **Corrección de Problemas:** Los alumnos/as intentan corregir algunos de los problemas identificados en el código, volviendo a ejecutar el analizador para verificar si se han solucionado.

**Sesión 3: Configuración y Uso Avanzado del Analizador de Código**

- Objetivos Específicos:
  - Identificar las diferentes opciones de configuración disponibles en el analizador de código.
  - Aprender a modificar la configuración del analizador para adaptarlo a las necesidades específicas de un proyecto (por ejemplo, ignorar ciertas reglas, establecer niveles de severidad).
  - Comprender la importancia de integrar el análisis de código en el flujo de trabajo de desarrollo.
- Actividades:
  1. **Exploración de la Configuración:** Los alumnos/as investigan las opciones de configuración del analizador de código, consultando la documentación o la interfaz del programa.
  2. **Ejercicio de Configuración:** Se plantea un escenario en el que es necesario modificar la configuración del analizador para adaptarlo a un conjunto de reglas de codificación específicas o para ignorar ciertos tipos de advertencias en un contexto particular. Los alumnos/as implementan estas modificaciones.
  3. **Análisis con Configuración Personalizada:** Los alumnos/as ejecutan el analizador con la configuración modificada sobre un proyecto y comparan los resultados con los obtenidos anteriormente.
  4. **Discusión Final:** Se debate sobre las ventajas e inconvenientes de personalizar la configuración del analizador y sobre cómo integrar el análisis de código de forma efectiva en el proceso de desarrollo para mejorar la calidad del software.
