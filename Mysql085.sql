-- SubConsultas 85


-- una consulta que esta dentro de una consulta , con valor resultante de la consulta principal se puede hacer un filtro
-- de una nueva consulta a esa misma

drop table if exists clientes,pedidos;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(70)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);


select * from pedidos;
select * from clientes;

INSERT INTO clientes (nombre, email) VALUES 
('Juan Pérez', 'juan@gmail.com'),
('Ana López', 'ana@gmail.com'),
('Carlos Díaz', 'carlos@yahoo.com');

INSERT INTO pedidos (id_cliente, total) VALUES 
(2, 150.00), -- Pedido de Juan
(1, 200.00), -- Otro pedido de Juan
(2, 50.00),  -- Pedido de Ana
(3, 300.00); -- Pedido de Carlos

-- where

select nombre from clientes
where id in 
(select id_cliente from pedidos where total >100);

-- select
select nombre,
(select count(*) from pedidos where pedidos.id_cliente = clientes.id) 
as total_pedidos
from clientes;

-- from
select avg(total) from 
(select total from pedidos where total >100)
as subtabla;

-- clientes con pedidos mayores a 100
select nombre from clientes
where id in
(select id_cliente from pedidos where total >200);

-- 
SELECT * FROM clientes WHERE id IN (1, 3);
