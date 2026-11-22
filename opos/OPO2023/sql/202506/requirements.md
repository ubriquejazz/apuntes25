# Requisitos Funcionales

Este documento detalla los requisitos necesarios para el desarrollo de una base de datos destinada a la gestión de la Formación en Centros de Trabajo (FCT) en un centro de Formación Profesional. A partir de la información recopilada en la entrevista con el responsable de la FCT, se han identificado los procesos clave que deben ser gestionados por el sistema.

## Identificación de Actores

Los principales usuarios del sistema son:

1. Administradores: Gestionan la información de empresas, alumnos, acuerdos, horas trabajadas y calificaciones.
2. Tutores Docentes: Supervisan el progreso del alumno y registran evaluaciones.
3. Tutores Laborales: Acompañan al alumno en la empresa y proporcionan informes de desempeño.
4. Alumnos: Realizan las prácticas y registran su asistencia y actividades.

## Requisitos Funcionales

## 1 Gestión de Empresas
- RF-01: Registrar nuevas empresas colaboradoras con datos como nombre, CIF, dirección, contacto y sector.
- RF-02: Gestionar información de los responsables de cada empresa.
- RF-03: Consultar y actualizar información de empresas.

### 2 Gestión de Acuerdos de Colaboración
- RF-04: Registrar acuerdos entre el centro y las empresas, incluyendo fechas de inicio y fin, horas semanales y totales.
- RF-05: Permitir la consulta y actualización de acuerdos.
- RF-06: Gestionar la finalización o renovación de acuerdos.

### 3 Gestión de Alumnos y su Asignación
- RF-07: Registrar alumnos con datos personales y de contacto.
- RF-08: Asignar alumnos a empresas de acuerdo con criterios específicos.
- RF-09: Registrar y modificar las jornadas y horas de prácticas realizadas por cada alumno.
- RF-10: Consultar el historial de prácticas de un alumno.

### 4 Gestión de Tutores
- RF-11: Registrar tutores docentes y asignarlos a alumnos.
- RF-12: Registrar tutores laborales y vincularlos a empresas y alumnos.
- RF-13: Permitir el seguimiento del alumno por parte de ambos tutores.

### 5 Evaluación del Alumno
- RF-14: Registrar informes de seguimiento por parte del tutor laboral.
- RF-15: Permitir al tutor docente evaluar el desempeño del alumno.
- RF-16: Asignar calificaciones finales basadas en criterios de desempeño, asistencia y seguimiento.

### 6 Control de Asistencia y Horarios
- RF-17: Registrar diariamente las horas trabajadas por el alumno.
- RF-18: Permitir la modificación y corrección de registros de asistencia.
- RF-19: Generar reportes de cumplimiento de horas establecidas en el acuerdo.

## Requisitos No Funcionales
- RNF-01: La base de datos debe garantizar la integridad y seguridad de los datos.
- RNF-02: El sistema debe permitir múltiples accesos simultáneos con diferentes roles de usuario.
- RNF-03: Debe existir un sistema de copias de seguridad automatizadas.
- RNF-04: El tiempo de respuesta de las consultas debe ser óptimo incluso con una alta carga de datos.
- RNF-05: Cumplir con las normativas de protección de datos (RGPD).

## Restricciones
- El sistema debe ser accesible desde cualquier dispositivo con conexión a internet.
- Solo los administradores pueden modificar información crítica como acuerdos y calificaciones.
- La asignación de alumnos a empresas debe cumplir con los requisitos de compatibilidad establecidos por el centro.