-- File: consulta02.sql
-- Date: sesion 46 (20230211)
Webgrafía:
https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#subconsultas-en-la-cl%C3%A1usula-having

-- ---------------
-- 2. Subconsultas
-- ---------------
-- Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
select * from pedido where total >= ALL(SELECT total FROM pedido);

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
select * from cliente where id not in (SELECT id_cliente from pedido);

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
select * from comercial where id not in (SELECT id_comercial from pedido);

-- ------------------------------
-- 3 Subconsultas con IN y NOT IN 
-- ------------------------------
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT

-- --------------------------------------
-- 4 Subconsultas con EXISTS y NOT EXISTS 
-- --------------------------------------
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS)
SELECT
