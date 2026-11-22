# Solucion UNICA

## Definición de Tablas y Atributos 

### Tabla: alumnos

Del alumno se desea saber:
- id_alumno: Identificador único del alumno.
- nombre: Nombre del alumno.
- apellidos: Apellidos del alumno.
- dni: Documento de identidad del alumno.
- fecha_nacimiento: Fecha de nacimiento del alumno.
- telefono: Número de teléfono del alumno.
- email: Correo electrónico del alumno.
- ciclo: Ciclo formativo al que pertenece el alumno (ej. DAW, SMR).
- curso: Curso académico en el que está matriculado (ej. 2º DAW). 

### Tabla: empresas

De la empresa colaboradora se desea saber:
- id_empresa: Identificador único de la empresa.
- nombre: Nombre de la empresa.
- cif: Código de identificación fiscal.
- direccion: Dirección completa de la empresa.
- telefono: Número de contacto de la empresa.
- email: Correo electrónico de contacto.
- sector: Sector de actividad de la empresa.

### Tabla: tutores_docentes

Del tutor docente se desea saber:
- id_tutor_docente: Identificador único del tutor docente.
- nombre: Nombre del tutor docente.
- apellidos: Apellidos del tutor docente.
- email: Correo electrónico institucional del tutor.
- telefono: Número de contacto del tutor. 

### Tabla: tutores_laborales

Del tutor laboral se desea saber:
- id_tutor_laboral: Identificador único del tutor laboral.
- nombre: Nombre del tutor laboral.
- apellidos: Apellidos del tutor laboral.
- email: Correo electrónico del tutor laboral.
- telefono: Número de contacto del tutor laboral. 

---

### Tabla: acuerdos

Del acuerdo de colaboración se desea saber:
- id_acuerdo: Identificador único del acuerdo.
- fecha_inicio: Fecha de inicio del acuerdo.
- fecha_fin: Fecha de finalización del acuerdo.
- horas_totales: Número total de horas de la FCT en la empresa. 

### Tabla: asistencias

De la asistencia del alumno en la empresa se desea saber:
- id_asistencia: Identificador único del registro de asistencia.
- fecha: Fecha de la jornada de prácticas.
- hora_entrada: Hora de entrada del alumno.
- hora_salida: Hora de salida del alumno.
- horas_trabajadas: Número de horas trabajadas ese día. 

### Tabla: evaluaciones

De la evaluación del alumno se desea saber:
- id_evaluacion: Identificador único de la evaluación.
- nota_final: Calificación final de la FCT del alumno.
- observaciones: Comentarios adicionales sobre el desempeño del alumno.

## Definición de Relaciones

Aquí tienes las relaciones existentes entre las tablas del sistema, detallando la cardinalidad de cada una:

### Relación entre alumnos y tutores_docentes
- Un tutor docente puede supervisar a varios alumnos.
- Un alumno solo puede tener un tutor docente asignado. 
### Relación entre alumnos y empresas
- Una empresa puede recibir a varios alumnos en prácticas.
- Un alumno realiza sus prácticas en una única empresa. 
### Relación entre empresas y tutores_laborales
- Una empresa puede tener varios tutores laborales asignados.
- Un tutor laboral solo puede pertenecer a una empresa. 
### Relación entre tutores_laborales y alumnos
- Un tutor laboral puede supervisar a varios alumnos dentro de su empresa.
- Un alumno solo tiene un tutor laboral en la empresa donde realiza la FCT. 
### Relación entre empresas y acuerdos
- Una empresa puede tener varios acuerdos de colaboración con el centro educativo en distintos periodos.
- Cada acuerdo pertenece a una única empresa. 
### Relación entre alumnos y asistencias
- Un alumno registra su asistencia diariamente durante su período de FCT.
- Cada registro de asistencia pertenece a un único alumno.

### Relación entre alumnos, tutores_docentes y tutores_laborales en evaluaciones
- Un alumno tiene una única evaluación final por parte de su tutor laboral.
- El tutor docente valida dicha evaluación.
- Un tutor laboral puede evaluar a varios alumnos.
- Un tutor docente puede validar la evaluación de varios alumnos