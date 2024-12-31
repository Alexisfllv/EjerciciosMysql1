
DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(60) not null,
autor VARCHAR(30),
editorial VARCHAR(15),
precio DECIMAL(5,2) UNSIGNED
);

DESCRIBE libros;

INSERT INTO libros (titulo,autor,editorial,precio)
VALUES
('El aleph','Borges','Planeta',15),
('Martin Fierro','Jose Hernandez','Emece',22.20),
('Antologia poetica','Borges','Planeta',40),
('Aprenda PHP','Mario Molina','Emece',18.20),
('Cervantes y el quijote','Borges','Paidos',36.40),
('Manual de PHP', 'J.C. Paez', 'Paidos',30.80),
('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00),
('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00),
('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);

SELECT * FROM libros;

-- CANTIDAD DE LIBROS POR EDITORIAL
SELECT editorial, COUNT(*) 
FROM libros
GROUP BY editorial;

-- CANTIDAD DE LIBROS POR EDITORIAL , PERO SOLO CONTANDO QUE SEAN MAYORES A 2
SELECT editorial, COUNT(*) 
FROM libros
GROUP BY editorial
HAVING COUNT(*)>2;

-- EL PROMEDIO DE LOS PRECIOS DE LOS LIBROS AGRUPADOS POR EDITORIAL
SELECT editorial , AVG(precio) 
FROM libros
GROUP BY editorial;

-- EL PROMEDIO DE SOLO QUIENES SUPEREN LOS 25 precio
SELECT editorial , AVG(precio)
FROM libros
GROUP BY editorial
HAVING AVG(precio)>25;


-- REGISTROS AGRUPADOS POR EDITORIAL SIN TENER EN CUENTA LA EDITORIAL planeta
SELECT editorial, COUNT(*)
FROM libros
WHERE editorial<> 'Planeta'
GROUP BY editorial;

SELECT editorial, COUNT(*)
FROM libros
GROUP BY editorial
HAVING editorial<>'Planeta';

-- Cantidad de libros , sin tener en cuenta los que tienen precio nulo ,
-- agrupados por editorial , rechanzando los de editorial planeta

select 
editorial,
count(*) as cantidadLibros
from libros
WHERE precio is not null
group by editorial
having editorial <> "Planeta";

-- promedio de precios agrupados por editorial , 
-- de las editoriales que tienen mas de 2 libros

select 
editorial,
avg(precio) as precios
from libros
group by editorial
having count(*) >2;

-- mayor valor de los libros , agrupados por editorial , luego seleccionar las filas
-- que tengan un valor mayor o igual a 30

select
editorial,
max(precio)
from libros
group by editorial
having max(precio) >= 30;

-- alias
select
editorial,
max(precio) as mayor
from libros
group by editorial
having mayor >= 30;

-- Problema 1 Clientes

drop table if exists clientes;

create table clientes(
codigo int unsigned auto_increment,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar(20),
telefono varchar(11),
primary key (codigo)
);

describe table clientes;

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


select * from clientes;

-- obtenga el total de registros agrupados por provincia
select
count(*) as registros,
provincia
from clientes
group by provincia;

-- obtenga el total de registros agrupados por ciudad y provincia
select
count(*) as registros,
ciudad,
provincia
from clientes
group by ciudad,provincia;

-- obtenga el total de los registeros agrupados por ciudad y provincia sin considerar los que tienen
-- menos de 2 clientes

select
count(*) as registros,
ciudad,
provincia
from clientes
group by ciudad,provincia
having registros >1;

-- obtenga el total de los registros sin telefono nulo
-- agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes

select
count(*) as registros,
ciudad,
provincia
from clientes
where telefono is not null
group by ciudad,provincia
having registros >1;

-- problema 2 Visitantes

drop table if exists visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint unsigned,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
telefono varchar(11),
montocompra decimal(6,2)
);

describe visitantes;

 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

select * from visitantes;

select count(*) from visitantes;

-- obtengan el total de las compras agrupadas por ciudad y sexo

select 
sum(montocompra),
ciudad,
sexo
from visitantes
group by ciudad,sexo;

-- Obtenga el total de las compras agrupadas por ciudad y sexo 
-- considerando las sumas superiores a 50 pesos

select 
sum(montocompra) as sumaCompra,
ciudad,
sexo
from visitantes
group by ciudad,sexo
having sumaCompra >50;

-- muestre el monto mayor de compra agrupada por ciudad
-- siempre que el valor supere los 30 pesos
-- solo visitantes con telefono no nulo
select
max(montocompra) as mayor,
ciudad
from visitantes
where telefono is not null
group by ciudad
having mayor >30;

-- agrupa por ciudad y muestre cada grupo ciudad el total de visitantes
-- suma de sus compras y el promedio de compras

select
count(*) as totalVisitantes,
ciudad,
sum(montocompra),
avg(montocompra)
from visitantes
group by ciudad;

drop table if exists visitas;

create table visitas(
numero int unsigned auto_increment,
nombre varchar(30) not null,
mail varchar(50),
pais varchar(20),
puntaje tinyint unsigned,
primary key (numero)
);

describe visitas;


 insert into visitas (nombre,mail,pais,puntaje)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina',9);
 insert into visitas (nombre,mail,pais,puntaje)
  values ('Gustavo Gonzalez','GustavoGGonzalez@yahoo.com','Chile',8);
 insert into visitas (nombre,mail,pais,puntaje)
  values ('Juancito','JuanJosePerez@hotmail.com','Mexico',5);
 insert into visitas (nombre,mail,pais,puntaje)
  values ('Fabiola Martinez','MartinezFabiolaM@hotmail.com','Chile',9);
 insert into visitas (nombre,mail,pais,puntaje)
  values ('Fabiola Martinez',null,'Peru',8);
 insert into visitas (nombre,mail,pais,puntaje)
  values ('Mariana Torres','MarianitaTorres','Peru',7);

select * from visitas;


-- muestre el promedio de los puntajes agrupados por pais
-- solo aquellos paises que tiene mas de 1 visita

select
count(*) as visitas,
avg(puntaje),
pais
from visitas
group by pais
having visitas >1;


 select pais, avg(puntaje) from visitas
 group by pais
 having count(*)>=2;

-- muestre el promedio de los puntajes agrupados por pais
-- considerando solo aquellos paises cuyo promedio es mayor a 8

select
avg(puntaje) as promedioPuntaje,
pais as Pais
from visitas
group by pais
having promedioPuntaje >8;


-- problema 3 empleados

drop table if exists empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char (1),
domicilio varchar(30),
fechaIngreso date,
fechaNacimiento date,
sueldoBasico decimal(5,2),
primary key (documento)
);

describe empleados;

 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('30000222','Luis LUque','m','Urquiza 456','1980-09-01','1980-03-29',700);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
 insert into empleados (documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico)
  values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);

select * from empleados;
-- cada mes solo los de ese mes
-- queremos cuantos empleados cumples anios el los meses de agosto a diciembre

select 
count(*) as empleados,
month(fechanacimiento) as mes
from empleados
group by mes
having mes >=8 and mes <=12;

-- conocer la cantidad de empleados agrupados por fecha de ingreso a la empresa
-- solo de las fechas posteriores a 1990-02-01

select
count(*) as empleadoss,
fechaingreso
from empleados
group by fechaingreso
having fechaingreso > "1990-02-01";



