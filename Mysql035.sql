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


-- problema 2 academia

 create table inscripciones(
  nombre varchar(30),
  documento char(8),
  fechainscripto date,
  pago decimal(5,2) unsigned not null
 );
 
 describe inscripciones;

 insert into inscripciones values('PHP básico', '22333444','2006-08-10',50);
 insert into inscripciones values('PHP básico', '23333444','2006-08-10',50);
 insert into inscripciones values('PHP básico', '24333444','2006-08-11',30);
 insert into inscripciones values('PHP experto', '25333444','2006-08-11',0);
 insert into inscripciones values('PHP experto', '26333444','2006-08-12',200);
 insert into inscripciones values('JavaScript básico', '22333444','2006-08-10',100);
 insert into inscripciones values('Operador de PC', '27333444','2006-08-12',10);
 insert into inscripciones values('Operador de PC', '28333444','2006-08-13',50);
 insert into inscripciones values('Operador de PC', '29333444','2006-08-14',40);
 insert into inscripciones values('Operador de PC', '30333444','2006-08-14',0);
 insert into inscripciones values('Diseño web', '29333444','2006-08-14',200);
 insert into inscripciones values('Diseño web', '30333444','2006-08-14',0);
 
 select count(*) from inscripciones;
 
-- calcule la cantidad de inscriptos para el curso de "Operador de PC": 

select count(*) as cantidad_grupos
from inscripciones
where nombre = 'Operador de PC';

-- Calcule la suma recaudada por los pagos de los cursos el día "2006-08-10":

select sum(pago) as sumas
from inscripciones
where fechainscripto = '2006-08-10';

-- Calcule el promedio de los pagos de los inscriptos:

select avg(pago) as promedioPagos
FROM c;

-- Muestre el máximo y el mínimo valor de pago, sin considerar quienes no pagan
select 
max(pago) as maximopago,
min(pago) as minpago
from inscripciones
where pago >0;

-- Vea en cuántos cursos se inscribió el alumno con documento "22333444" y cuánto abonó en total:
select count(*) , sum(pago)
from inscripciones
where documento = '22333444';


-- Ejercicio 3 tabla Peliculas

CREATE TABLE peliculas(
codigo int auto_increment primary key,
titulo varchar(30) not null,
actor varchar(30) ,
duracion int unsigned,
check (duracion <=200) );

describe peliculas;

insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra ','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara ','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo,actor,duracion)
  values('Un oso rojo',null,100);
 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',110);
 insert into peliculas (titulo,actor,duracion)
  values('Mrs. Johns','Richard Gere',180);


-- duracion mas grande de la pelicula
select max(duracion) from peliculas;

select actor,titulo 
from peliculas
order by duracion desc
limit 1;

-- promedio duracion de peliculas
select avg(duracion) as duracion_promedio
from peliculas;

-- cantidad con el titulo que empiecen con Harry
select count(*) 
from peliculas
where titulo like 'Harry%';

-- total de minutos de las peliculas donde actual Richard Gere
select Sum(duracion)
from peliculas
where actor= 'Richard Gere';

drop table if exists autos;

create table autos(
patente char(6) primary key,
marca varchar(20),
modelo char(4),
precio decimal(8,2) unsigned
);

describe autos;

 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);


-- muestre el carro mas caro y mas barato
select 
max(precio) as caro,
min(precio) as barato
from autos; 

-- el carro mas caro de 1990
select max(precio)
from autos
where modelo = '1990';


-- promedio de los precios de los autos Fiat 128
select avg(precio)
from autos
where marca = 'Fiat 128';

-- calcule el valor en dinero de todos los autos renault con modelo menores a 1995
select 
sum(precio) as valor_total
from autos
where marca like 'Renault%'
and
modelo < 1995;

drop table if exists facturas;

create table facturas(
numero int(10) zerofill,
descripcion varchar(30),
preciooprtunidad decimal(5,2) unsigned,
cantidad tinyint unsigned);

 insert into facturas values(504,'escuadra 20 cm.',2.5,100);
 insert into facturas values(504,'escuadra 50 cm.',5,80);
 insert into facturas values(2002,'compas plastico',8,120);
 insert into facturas values(2002,'compas metal',15.4,100);
 insert into facturas values(2002,'escuadra 20 cm.',2.5,100);
 insert into facturas values(4567,'escuadra 50 cm.',5,200);

-- la cantidad de items de la factura numero 2002
select count(*)
from facturas
where numero = '2002';


-- sumar cantidad de numero  = 2002
select sum(cantidad)
from facturas
where numero = '2002';

-- muestre el total en dinero d ela factura = 504

select sum(cantidad * preciooprtunidad)
from facturas
where numero = '504';

