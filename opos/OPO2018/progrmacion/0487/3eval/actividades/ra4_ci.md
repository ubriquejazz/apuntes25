# Refactorización, pruebas e integración continua 

**Duración:**  9h, semanas hasta el 21/05

## Objetivos

* Comprender los principios y la importancia de la refactorización para mejorar el diseño y la mantenibilidad del código sin alterar su comportamiento.

* Identificar y aplicar los patrones de refactorización más comunes utilizando las herramientas proporcionadas por el entorno de desarrollo.

* Elaborar pruebas unitarias efectivas que sirvan como base y salvaguarda durante el proceso de refactorización.

* Comprender los fundamentos y beneficios de la integración continua (CI) y aprender a utilizar herramientas para su implementación.

* Integrar las prácticas de refactorización y pruebas automatizadas en un flujo de trabajo de integración continua para el proyecto de desarrollo.

## Criterios de evaluacion

* a) Se han identificado los patrones de refactorización más usuales.
* b) Se han elaborado las pruebas asociadas a la refactorización.

* e) Se han aplicado patrones de refactorización con las herramientas que proporciona el entorno de desarrollo

* i) Se han utilizado herramientas para la integración continua del código.

## Contenidos

Refactorización. Concepto. Limitaciones.

Patrones de refactorización más usuales.

Refactorización y pruebas. Herramientas de ayuda a la refactorización.

Integración continua. Herramientas.

## Actividades

#### A. Pruebas de refactorizacion 2h

* **OBJ**: Comprender los principios y la importancia de la refactorización para mejorar el diseño y la mantenibilidad del código sin alterar su comportamiento.

* **OBJ**: Identificar y aplicar los patrones de refactorización más comunes utilizando las herramientas proporcionadas por el entorno de desarrollo.

**Sesión 1: Introducción a la Refactorización**. Patrones de Refactorización Comunes (a)

- ¿Qué es la refactorización? Objetivos y beneficios. Cuándo y por qué refactorizar.
- Análisis de código con "mal olor" y discusión sobre posibles mejoras sin alterar el comportamiento.

- **Identificación de los patrones de refactorización más usuales:** Extract Method, Inline Method, Rename Variable, Rename Method, Introduce Parameter Object, Move Method, Move Field, Extract Class, Replace Temp with Query. Descripción, motivación y ejemplos de cada patrón.
- Estudio de casos prácticos donde se identifican oportunidades para aplicar patrones de refactorización específicos.

**Sesión 2: Refactorización y Pruebas: Un Ciclo Indisoluble (b)**

- La necesidad de tener pruebas sólidas antes de refactorizar.
- Estrategias para probar el código refactorizado.
- **Act. 12.1**: Dada una pieza de código a refactorizar, los estudiantes deberán escribir pruebas unitarias que cubran su comportamiento actual antes de aplicar cualquier refactorización.

#### B. Desarrollo practico 2h

- **OBJ**: Elaborar pruebas unitarias efectivas que sirvan como base y salvaguarda durante el proceso de refactorización.

**Sesión 3-4: Aplicación Práctica de Patrones de Refactorización (e)**

- Aplicación de patrones con las herramientas que proporciona el entorno de desarrollo.
- Uso de las funcionalidades de refactorización automática del IDE (IntelliJ IDEA, VS Code, etc.).
- Práctica guiada de la aplicación de los patrones vistos sobre el proyecto Java con JUnit y Mockito.
- Refactorización de métodos, variables, clases y la estructura del código.
- **Act 12.2:** Sesiones prácticas donde los estudiantes refactorizan partes específicas del proyecto, utilizando las herramientas del IDE y siguiendo las buenas prácticas.

#### C. Integración Continua del código 1h

* **OBJ**: Comprender los fundamentos y beneficios de la integración continua (CI) y aprender a utilizar herramientas para su implementación.
* **OBJ**: Integrar las prácticas de refactorización y pruebas automatizadas en un flujo de trabajo de integración continua para el proyecto de desarrollo.

**Sesión 5: Introducción a la Integración Continua (i)**

- ¿Qué es la Integración Continua? Objetivos y beneficios. Flujo de trabajo típico de CI.
- Componentes clave: control de versiones, servidor de CI, ejecución de pruebas automatizadas, informes.
- **Act. 12.3:** Investigación y presentación breve de diferentes herramientas de CI disponibles (Jenkins, GitLab CI, GitHub Actions, Travis CI).



**Evaluación**: Desarrollo y prueba del proyecto práctico en la configuración del pipeline de CI para el proyecto, realizando commits y observando la ejecución automática del proceso.

---

NEAE A: Investigar 

NEAE A y C: Act. 12.2

NEAE TDAH (E): Act. 12.4 con pasos bien determinados; examen con extension de tiempo.





