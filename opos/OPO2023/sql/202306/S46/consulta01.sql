-- Con operadores básicos de comparación
-- File: consulta01.sql
-- Date: sesion 46 (20230211)

-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select id from cliente where NOMBRE = "Adela" and APELLIDO1 = "Salas"; -- 2
select id, total, fecha from pedido where id_cliente = 2;

select p.id, p.total, p.fecha from pedido p, cliente c
where p.id_cliente = c.id and nombre = "Adela" and apellido1 = "Salas";

select p.id, p.total, p.fecha from pedido p inner join cliente c on p.id_cliente = c.id 
where nombre = "Adela" and apellido1 = "Salas";

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select id from comercial where NOMBRE = "Daniel" and APELLIDO2 = "Vega"; -- 1
select id, total, fecha from pedido where id_comercial = 1;
select count(*) as pedidos from pedido where id_comercial = 1;

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
select nombre, apellido1 from cliente where id = 1;

    --  id cliente con el pedido más caro en el año 2019.
    select max(total) from pedido where fecha BETWEEN '2019-01-01' AND '2019-12-31'; 
    select max(total) from pedido where year(fecha) = 2019; -- 2389.23
    select id_cliente from pedido where year(fecha) = 2019 and total = 2389.23; -- 1

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
select fecha, total from pedido P inner join cliente C on P.id_cliente = C.id
where nombre = 'Pepe' and apellido1 = 'Ruiz'
and total <= all(select total from pedido where id_cliente = P.id_cliente);

    -- id pedido de menor valor realizado por el cliente Pepe Ruiz 
    select id from cliente where nombre = 'Pepe' and apellido1 = 'Ruiz'; -- 8

    -- Test: misma fecha!!!
    select max(total), fecha from pedido where id_cliente = 8;
    select min(total), fecha from pedido where id_cliente = 8;

-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
select nombre, apellido1 from cliente where id = 1,2,3; 

    -- valor medio de los pedidos realizados durante 2017.
    select 

    -- clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
    select 