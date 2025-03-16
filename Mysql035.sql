-- Agrupar registros (group by) 35
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


-- Problema 2 

drop table if exists visitas;

create table visitas(
numero int unsigned auto_increment,
nombre varchar(30) not null,
mail varchar(50),
pais varchar(20),
fecha date,
primary key(numero)
);

select * from visitas;

 insert into visitas (nombre,mail,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-10-10');
 insert into visitas (nombre,mail,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-10-10');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-10-11');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');

-- total de visitas
select 
count(*) as total_visitas
from
visitas; 

-- cantidad de visitas agrupadas por fecha
select fecha,
count(*) as total
from visitas
group by fecha;




-- cantidad de visitas agrupadas por nombre y mes
select nombre,month(fecha),
count(*) as cantidad
from visitas
group by nombre,month(fecha);


-- Problema 3 
drop table if exists empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
domicilio varchar(30),
fechaingreso date,
fechanacimiento date,
sueldobasico decimal(5,2) unsigned,
primary key(documento)
);

describe empleados;

insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldoBasico)
  values ('30154269','Oscar Mendez','m','Colon 1245','2004-06-23','1984-05-14',300);

-- contar cantindad de masculino y femenino de empleados
select 
sexo , count(sexo)
from empleados
where month(fechanacimiento)=5
group by sexo;


-- conocer la cantidad de empleados agrupados por anio de ingreso a la empresa
select 
year(fechaingreso),
count(*) as empleados
from empleados
group by fechaingreso;

-- Problema 4 Facturas
drop table if exists facturas;

create table facturas(
numero int(10) zerofill,
descripcion varchar(30),
precioporunidad decimal(5,2) unsigned,
cantidad tinyint unsigned
);

describe facturas;


 insert into facturas values(504,'escuadra 20 cm.',2.5,100);
 insert into facturas values(504,'escuadra 50 cm.',5,80);
 insert into facturas values(2002,'compas plastico',8,120);
 insert into facturas values(2002,'compas metal',15.4,100);
 insert into facturas values(2002,'escuadra 20 cm.',2.5,100);
 insert into facturas values(4567,'escuadra 50 cm.',5,200);

select * from facturas;
-- cuenta la cantidad de items por factura
select
numero as cantindadItems, 
count(*)
from facturas
group by numero;


-- sumar la cantidad de productos por facturas
select 
numero,
sum(cantidad) as cantidadProductos
from facturas
group by numero;

-- total de dinero de facturas

select
numero,
sum(precioporunidad * cantidad) as totalDinero
from facturas
group by numero;

