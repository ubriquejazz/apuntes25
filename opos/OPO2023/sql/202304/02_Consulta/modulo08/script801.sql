-- File: script801
-- Desc: Consultas multitabla
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- listado de todos los productos y todos aquellos pedidos que de él se han hecho,
-- incluyendo el NOMBRE del cliente que lo realizó y el número de pedidos que este 
-- cliente ha realizado del producto.
SELECT descripcion, pedido_no, clientes.nombre, pedidos.unidades
FROM productos, pedidos, clientes
WHERE pedidos.producto_no = productos.producto_no  
AND pedidos.cliente_no = clientes.cliente_no;

SELECT p.descripcion, clientes.nombre, ifnull(pedidos.pedido_no,0) pedido
FROM productos p
    LEFT JOIN pedidos ON pedidos.producto_no = p.producto_no  
    LEFT JOIN clientes ON pedidos.cliente_no = clientes.cliente_no;

-- Select de los pedidos realizados antes del 1 de diciembre de 1999, como mínimo de 
-- 3 unidades, incluyendo los datos de los clientes que los efectuaron y la DESCRIPCION 
-- del producto solicitado.
SELECT productos.descripcion, clientes.nombre, unidades, p.fecha_pedido
FROM pedidos p
    JOIN productos ON p.producto_no = productos.producto_no  
    JOIN clientes ON p.cliente_no = clientes.cliente_no
WHERE p.fecha_pedido < '1999-12-01' AND p.unidades > 2;

-- qué cantidad de dinero se ha vendido de cada producto 
-- el número de pedidos realizado de cada uno de ellos.
SELECT p.producto_no item, p.pedido_no, p.unidades FROM pedidos p;

SELECT p.producto_no item, SUM(p.unidades)
FROM pedidos p GROUP BY item;

SELECT p.producto_no item, SUM(unidades), COUNT(p.pedido_no)
FROM pedidos p GROUP BY item;

SELECT p2.producto_no item, p2.precio_actual precio
FROM productos p2;

SELECT p.producto_no item,   
    COUNT(p.pedido_no) orders, SUM(p.unidades) units, 
    SUM(p.unidades) * productos.precio_actual total
FROM pedidos p 
    JOIN productos ON p.producto_no = productos.producto_no  
GROUP BY item;

-- datos de los empleados que tienen como jefe a alguno de los empleados
-- cuyo jefe directo es el PRESIDENTE de la empresa.
SELECT emp_no, director FROM empleados   
WHERE oficio = 'PRESIDENTE'; -- 7839

SELECT emp_no, director FROM empleados  
WHERE director = 7839; -- 7698, 7782

SELECT emp_no, director FROM empleados  
WHERE director IN (7698, 7782);

SELECT e.emp_no, empleados.emp_no
FROM empleados e
    JOIN empleados ON e.director = empleados.emp_no;

SELECT e1.apellido, e1.director,
    e2.emp_no, e2.apellido, e2.director,
    e3.emp_no, e3.oficio
FROM empleados e1
    JOIN empleados e2 ON e1.director = e2.emp_no
    JOIN empleados e3 ON e2.director = e3.emp_no; 

-- datos de los empleados cuyo oficio es DIRECTOR, incluyendo una columna con el sueldo 
-- (SALARIO + COMISION) que cobran los empleados que dependen de ellos.
SELECT e1.emp_no FROM empleados e1 WHERE e1.oficio = 'DIRECTOR';

SELECT e2.apellido, e2.dep_no, e1.apellido, e1.dep_no
FROM empleados e1 JOIN empleados e2 ON e2.oficio = 'DIRECTOR'
WHERE e2.emp_no != e1.emp_no AND e1.oficio != 'PRESIDENTE';

 




SELECT e2.apellido director, e1.apellido subordinado,
    e1.salario + ifnull(e1.comision,0) salario
FROM empleados e1
    JOIN empleados e2 ON e1.director = e2.emp_no
ORDER BY 1;

-- Recuperar los datos de los clientes (CLIENTE_NO, NOMBRE, LOCALIDAD) 
-- junto con la suma de pedidos y la suma de unidades que ha solicitado en ellos,
-- incluyendo aquellos clientes que no tengan pedidos / unidades = 0
SELECT c.nombre, c.localidad, 
    COUNT(pedidos.pedido_no) pedidos, 
    ifnull(SUM(pedidos.unidades),0) suma
FROM clientes c
    LEFT JOIN pedidos ON c.cliente_no = pedidos.cliente_no
GROUP BY c.cliente_no
ORDER BY 1;
