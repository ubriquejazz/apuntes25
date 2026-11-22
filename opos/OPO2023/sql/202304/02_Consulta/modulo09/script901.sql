-- File: script901
-- Desc: Consultas dentro de otras instrucciones
-- Date: 2023.03.06
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Crea tabla EMP_CLI con los campos EMP_NO y APELLIDO de la tabla EMPLEADOS 
-- y los campos CLIENTE_NO y NOMBRE de la tabla CLIENTES, 
-- relacionando los empleados con sus respectivos clientes (VENDEDOR_NO)
SELECT cliente_no, nombre, e.apellido, vendedor_no
FROM clientes c 
    JOIN empleados e ON e.emp_no = c.vendedor_no;

CREATE TABLE EMP_CLI AS
SELECT cliente_no, nombre, e.apellido, vendedor_no
FROM clientes c 
    JOIN empleados e ON e.emp_no = c.vendedor_no;

-- Corregir en la tabla PEDIDOS el número de cliente que ha realizado el pedido 
-- con número 1010 para que sea el de EDICIONES SANZ.
select cliente_no from clientes where nombre = "EDICIONES SANZ"; -- 105
update pedidos set cliente_no = (105) where pedido = 1010;

-- Update en la tabla CLIENTES la columna DEBE con el importe total 
-- de los pedidos realizados por cada cliente
SELECT p.cliente_no, SUM(p.unidades * productos.precio_actual) 
FROM pedidos p, productos 
WHERE p.producto_no = productos.producto_no
GROUP BY 1;

SELECT nombre, debe FROM clientes c WHERE debe = (
    SELECT ifnull(SUM(p.unidades * productos.precio_actual),0)
    FROM pedidos p, productos 
    WHERE c.cliente_no = p.cliente_no AND p.producto_no = productos.producto_no
    );

UPDATE clientes c SET debe = (
    SELECT ifnull(SUM(p.unidades * productos.precio_actual),0)
    FROM pedidos p, productos 
    WHERE c.cliente_no = p.cliente_no AND p.producto_no = productos.producto_no
    );

-- Update el STOCK_DISPONIBLE de los PRODUCTOS restando la suma de las 
-- UNIDADES solicitadas en los diferentes pedidos de ese producto.
select producto_no, sum(unidades) from pedidos group by 1;

UPDATE productos SET stock_disponible = 40;

UPDATE productos e
SET stock_disponible = stock_disponible - (SELECT 
        IFNULL(SUM(p.unidades),0) FROM pedidos p
        WHERE p.producto_no = e.producto_no
        GROUP BY p.producto_no);

select producto_no, stock_disponible from productos;

-- vista CLI_PED que muestre los datos ordenados alfabéticamente de los clientes y sus pedidos actuales.
-- Los campos que precisamos son NOMBRE, PEDIDO_NO, PRODUCTO_NO y DESCRIPCION.
CREATE VIEW CLI_PED AS
SELECT c.nombre, p.pedido_no, q.producto_no, q.descripcion
FROM pedidos p
    JOIN productos q ON p.producto_no = q.producto_no
    JOIN clientes c ON p.cliente_no = c.cliente_no
ORDER BY 1;

-- vista V_EMPLEADOS con los datos de todos los empleados y los clientes que tienen asignados, 
-- incluyendo aquellos empleados que no tienen ningún cliente. 
CREATE VIEW V_EMPLEADOS AS
SELECT emp_no, e.apellido, oficio, cliente_no, nombre
FROM empleados e
    LEFT JOIN clientes c ON e.emp_no = c.vendedor_no;