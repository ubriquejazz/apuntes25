# Pruebas unitarias y automatización

**Duración:** 15h, todo el mes de abril (hasta el puente de mayo)

## Objetivos

* Comprender la importancia y fundamentos de las pruebas de software para asegurar la calidad del desarrollo.

* Conocer los tipos de pruebas y diseñar casos de prueba efectivos para una cobertura adecuada.

* Dominar las pruebas unitarias en Java con JUnit 5, incluyendo el aislamiento de dependencias con Mockito.

* Automatizar la ejecución de pruebas unitarias e interpretar la cobertura de código.

* Aplicar los conocimientos en un proyecto práctico, documentando incidencias y demostrando habilidades de prueba integral.

## Criterios de evaluación

* a) Se han identificado los diferentes tipos de pruebas. 
* b) Se han definido casos de prueba. 
* f) Se han efectuado pruebas unitarias de clases y funciones. 
* g) Se han implementado pruebas automáticas. 
* h) Se han documentado las incidencias detectadas. 
* i) Se han utilizado dobles de prueba para aislar los componentes durante las pruebas.

## Contenidos

**Fundamentos de Pruebas de Software:** Tipos de pruebas, importancia y ciclo de vida.

**Diseño de Casos de Prueba:** Técnicas para definir pruebas efectivas.

**Pruebas Unitarias con JUnit:** Estructura, asertos y pruebas avanzadas.

**Manejo de Dependencias con Mockito:** Creación y uso de dobles de prueba para aislamiento.

**Automatización de Pruebas:** Integración con herramientas de construcción (Maven/Gradle) y ejecución automática.

**Documentación de Incidencias:** Creación de informes de errores claros y concisos.

**Cobertura de Código:** Medición y análisis para mejorar la calidad de las pruebas (opcional)

## Actividades

Exposición y Act. 1: Introducción y tipos de pruebas (a). Definición de casos de prueba (b)

Exposición y Act. 2: Introducción a JUnit 5 y Primeras pruebas unitarias (f)

Exposición y Act.  3: Pruebas de excepciones y tiempos de espera (f)

Exposición y Act.  4: Introducción a los dobles de prueba. Mocking con Mockito (i)

Exposición y Act. 5: Integración de JUnit con herramientas de construcción Gradle (g)

Exposición y Act. 6: Automatización y cobertura de código

**Evaluación**: Desarrollo y prueba del proyecto práctico (b, f, g, h, i)
Para el resto de criterios se realiza un examen individual. 1h

---

NEAE A: Investigar 

NEAE A y C: Act. 4

NEAE TDAH (E): Act. 2 con pasos bien determinados; examen con extension de tiempo.





### 1. Fundamentos de las Pruebas de Software en Java

- **Sesión 1: Introducción y Tipos de Pruebas (Evaluación a)**
  - ¿Por qué son importantes las pruebas? Costos de los errores.
  - **Identificación de los diferentes tipos de pruebas:** unitarias, integración, sistema, aceptación. Discusión y ejemplos de cada tipo.
  - El ciclo de vida del desarrollo de software y las pruebas.
  - Introducción a las metodologías de prueba (ej: caja blanca, caja negra).
  - **Actividad (Evaluación a):** Ejercicio en grupo donde los estudiantes deben clasificar diferentes escenarios de prueba según el tipo al que pertenecen, justificando su elección.
- **Sesión 2: Diseño de Pruebas en Java**
  - Principios para diseñar pruebas efectivas.
  - **Actividad:** Análisis de requisitos simples de una función Java y discusión sobre posibles enfoques de prueba.
- **Sesión 3: Definición de Casos de Prueba (Evaluación b)**
  - ¿Qué es un caso de prueba? Elementos clave (ID, descripción, pasos, datos de entrada, resultado esperado).
  - Técnicas para la definición de casos de prueba (análisis de valores límite, partición de equivalencia).
  - **Actividad**: Dada una especificación sencilla de una función Java, los estudiantes deberán definir un conjunto de casos de prueba utilizando las técnicas aprendidas. Se revisarán y discutirán los casos propuestos.

### 2. Pruebas Unitarias en Profundidad con JUnit

- **Sesión 4: Introducción a JUnit 5 y Primeras Pruebas Unitarias (Evaluación f)**
  - Configuración del entorno con JUnit.
  - Conceptos básicos de JUnit: anotaciones (`@Test`, etc.).
  - Estructura de un caso de prueba JUnit.
  - **Actividad (Evaluación f):** Creación de las primeras pruebas unitarias con JUnit para funciones Java simples, verificando su correcto funcionamiento con diferentes entradas.
- **Sesión 5: Asertos y Pruebas Unitarias Avanzadas (Evaluación f)**
  - Exploración de los diferentes tipos de asertos.
  - Pruebas con datos parametrizados.
  - **Actividad (Evaluación f):** Ampliación de las pruebas unitarias, utilizando diversos asertos y pruebas parametrizadas para cubrir un rango más amplio de escenarios para las funciones probadas.
- **Sesión 6: Pruebas de Excepciones y Tiempos de Espera (Evaluación f)**
  - Cómo probar el lanzamiento de excepciones esperadas.
  - Pruebas con límites de tiempo.
  - **Actividad (Evaluación f):** Escritura de pruebas unitarias que verifican el manejo de excepciones y el rendimiento de las funciones bajo prueba.
- **Sesión 7: Introducción a los Dobles de Prueba (Evaluación i)**
  - La necesidad de aislar componentes en las pruebas unitarias.
  - Introducción a los diferentes tipos de dobles de prueba: *dummies*, *stubs*, *spies*, *mocks*.
  - **Actividad (Evaluación i):** Discusión sobre cuándo y por qué utilizar cada tipo de doble de prueba en diferentes escenarios.
- **Sesión 8: Mocking con Mockito (Evaluación i)**
  - Uso de Mockito para crear y configurar mocks.
  - Verificación de interacciones con los mocks (`verify`).
  - **Actividad (Evaluación i):** Implementación de pruebas unitarias utilizando Mockito para simular dependencias de las clases bajo prueba, demostrando el aislamiento de componentes

### 3. Automatización de Pruebas y Documentación de Incidencias

**Sesión 9: Integración de JUnit con Herramientas de Construcción (Evaluación g)**

- Configuración de la ejecución de pruebas JUnit en Maven o Gradle.
- Ejecución automática de pruebas desde la línea de comandos.
- **Actividad ():** Configuración de un proyecto Java con Maven/Gradle y demostración de la ejecución automática de las pruebas unitarias creadas.

**Sesión 10: Automatización y Cobertura de Código (ampliacion)**

- Beneficios de la automatización de pruebas unitarias.
- Introducción a la cobertura de código y su importancia.
- Integración de herramientas de cobertura (ej: JaCoCo) en el proyecto.
- **Actividad (opcional):** Ejecución automática de pruebas y generación de reportes de cobertura para evaluar la efectividad de las pruebas implementadas.



### 4. Proyecto Práctico Java con JUnit y Mockito

- **Sesión 13-15: Desarrollo y Prueba del Proyecto Práctico (Evaluación b, f, g, h, i)**
  - Desarrollo colaborativo o individual de un proyecto Java.
  - **Definición de casos de prueba (Evaluación b)** para las funcionalidades desarrolladas.
  - **Implementación de pruebas unitarias (Evaluación f)** exhaustivas utilizando JUnit.
  - **Implementación de pruebas automáticas (Evaluación g)** integrando la ejecución de pruebas en el proceso de construcción.
  - **Documentación de las incidencias detectadas (Evaluación h)** durante el desarrollo y las pruebas.
  - **Utilización de dobles de prueba (Evaluación i)** con Mockito para aislar las unidades probadas.
