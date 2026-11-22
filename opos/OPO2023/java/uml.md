# Diagrama UML

## Herencia

El supertipo agrupa atributos y metodos comunes. Entre el subtipo y el supertipo se establece la relacion:

    instancia subclase "IS A" superclase

Se representa con una flecha.

### Restricciones

- Una instancia de subtipo también es instancia del supertipo
- Una instancia no puede existir sólo por ser miembro de un subtipo: también debe ser miembro del supertipo
- Una instancia del supertipo puede no ser miembro de ningún subtipo

### Herencia disyunta o solapada

- *¿A cuántos subtipos puede pertenecer a la vez una instancia del supertipo?*

Se representa con un punto (disyunta)

**Ejemplo**: <u>vehiculo</u>, turismo o camion; <u>persona</u>, empleado y/o estudiante

### Herencia parcial o total

- *¿Toda instancia del supertipo es miembro de alguno de los subtipos?*

Se representa con un arco (total)

**Ejemplo**: <u>animal</u>, hemafrodita, macho o hembra; <u>alimento</u>: lacteo, fruta

## Asociaciones

Entre las clases se establece la relacion:

    superclase HAS "instancia(s)" de subclase

### Asociacion de tipo agregación

- Se representa con un rombo blanco (◇), relacion debil en existencia (solo).

**Ejemplo**: Un Departamento tiene Empleados, pero si el Departamento desaparece, los Empleados pueden seguir existiendo.

+-------------------------+        0..*       +---------------------+
|  Departamento   |-----------------|     Empleado    |
+--------------------------+                    +----------------------+

### Asociacion de tipo composición

- Se representa con un rombo negro (◆), relacion debil en identificacion.

**Ejemplo**: Una Casa tiene Habitaciones; si la Casa desaparece, también lo hacen sus Habitaciones.

---



### Impl. con ArrayList

En java se emplea el concepto de ArrayList:

```java
ArrayList<Integer> a = new ArrayList<Integer>();

a.add(67); a.add(78); a.add(10); a.add(4);

System.out.println("\nNúmeros en el orden original:");     
for (int numero: a) {
    System.out.println(numero);
}

System.out.println("\nNúmeros ordenados:"); 
Collections.sort(a);
for (int numero: a) {
    System.out.println(numero);
}
```

Encapsula el siguiente codigo con la clase Color:

```java
ArrayList<String> a = new ArrayList<String>();

a.add("rojo"); a.add("verde"); a.add("azul"); a.add("blanco"); a.add("amarillo");

System.out.println("Contenido de la lista: ");
for(int i=0; i < a.size(); i++) {
    System.out.println(a.get(i));
}
```

### Impl con HashMap

Un diccionario en java se denomina hashmap:

```java
HashMap<Integer, String> m = new HashMap<Integer, String>();

m.put(924, "Amalia Núñez");
m.put(921, "Cindy Nero");
m.put(700, "César Vázquez");
m.put(219, "Víctor Tilla");
m.put(537, "Alan Brito");
m.put(605, "Esteban Quito ");

System.out.println("Código\tNombre\n------\t-------------");
for (Map.Entry pareja: m.entrySet()) {
    System.out.print(pareja.getKey() + "\t");
    System.out.println(pareja.getValue());
}
```