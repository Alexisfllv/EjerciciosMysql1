DROP TABLE IF EXISTS visitantes;


CREATE TABLE visitantes(
nombre VARCHAR(30),
edad TINYINT UNSIGNED,
sexo CHAR(1),
domicilio VARCHAR(30),
ciudad VARCHAR (20),
telefono VARCHAR(11),
motocompra DECIMAL (6,2)UNSIGNED
);

DESCRIBE visitantes;

-- INSERT
INSERT INTO visitantes
(nombre,edad,sexo,domicilio,ciudad,telefono,motocompra)
VALUES
('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50),
('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0),
('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25),
('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0),
('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20),
('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25),
('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50),
('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0),
('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48),
('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

SELECT * FROM visitantes;

Select count(*) from visitantes;

-- cantidad de visitantes de cada ciudad
SELECT ciudad , COUNT(*)
FROM visitantes
GROUP BY ciudad;

-- cantidad de visitantes con telefono que no son nulos
SELECT ciudad,COUNT(telefono) 
FROM visitantes
GROUP BY  ciudad;

-- cantidad de visitantes con telefono que no son nulos 2
SELECT ciudad , COUNT(telefono)
FROM visitantes
WHERE telefono is not null
GROUP BY ciudad;

-- el total de compras agrupadas por sexo
SELECT sexo , SUM(motocompra)
FROM visitantes
GROUP BY sexo;

-- obtener el valor maximo de compra por sexo
SELECT sexo , MAX(motocompra)
FROM visitantes
GROUP BY sexo;

-- obtener el valor minimo de compra por sexo
SELECT sexo , MIN(motocompra)
FROM visitantes
GROUP BY sexo;

-- aplicar ambos por ser el mismo group
SELECT sexo, MIN(motocompra),MAX(motocompra)
FROM visitantes
GROUP BY sexo;

-- v2
SELECT sexo, 
       MIN(motocompra) AS minimo_motocompra, 
       MAX(motocompra) AS maximo_motocompra
FROM visitantes
GROUP BY sexo;

-- obtener el promedio por ciudad
SELECT ciudad , AVG(motocompra)
FROM visitantes
GROUP BY ciudad;

-- obtener registros y agupados en ciuidad y sexo
SELECT ciudad,sexo, COUNT(*)
FROM visitantes
GROUP BY ciudad,sexo;

-- ciudad que no sea cordoba
SELECT ciudad,COUNT(*) FROM visitantes
WHERE ciudad <> 'cordoba'
GROUP BY ciudad;


-- PROBLEMA A RESOLVER
-- TABLA CLIENTES

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes(
codigo int unsigned auto_increment,
nombre VARCHAR(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar(20),
telefono varchar(11),
primary key(codigo)
);


describe clientes;

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
  
  SElect * from clientes;

-- 1
select count(*) from clientes;

-- 2
select count(*) from clientes
where telefono is not null;

-- 3
select  ciudad,provincia ,count(*) as cantidad  from clientes
group by ciudad ,provincia;




