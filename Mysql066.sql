-- Varias tablas , cross join 66


drop table if exists comidas, postres;

create table comidas(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
precio decimal(4,2) unsigned,
primary key (codigo)
);

create table postres(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
precio decimal(4,2) unsigned,
primary key (codigo)
);


insert into comidas values(1,'milanesa y fritas',3.4);
insert into comidas values(2,'arroz primavera',2.5);
insert into comidas values(3,'pollo',2.8);

insert into postres values(1,'flan',1);
insert into postres values(2,'porcion de torta',2.1);
insert into postres values(3,'gelatina',0.9);

-- select

select * from comidas;

select * from postres;

-- 1-1 2-2 3-3
-- Empleamos "cross join" para obtener el producto cartesiano de ambas tablas:
 
select c.*,p.*
from comidas as c
cross join postres as p;

--
select c.*,p.*
from comidas as c
join postres as p;


-- Para obtener el nombre del plato principal, del postre y el precio total de 
-- cada combinación (menú) tipeamos la siguiente sentencia:
select c.nombre,p.nombre,
c.precio+p.precio as total
from comidas as c
cross join postres as p;

-- drop table comidas;
drop table comidas;


-- Creamos la tabla "comidas" con la siguiente estructura:
create table comidas(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
rubro varchar(20),/*plato principal y postre*/
precio decimal (5,2) unsigned,
primary key(codigo)
);

insert into comidas values(1,'milanesa y fritas','plato principal',3.4);
insert into comidas values(2,'arroz primavera','plato principal',2.5);
insert into comidas values(3,'pollo','plato principal',2.8);
insert into comidas values(4,'flan','postre',1);
insert into comidas values(5,'porcion de torta','postre',2.1);
insert into comidas values(6,'gelatina','postre',0.9);

select * from comidas;

-- Podemos obtener la combinación de platos principales con postres
-- empleando un "cross join" con una sola tabla:
select c1.nombre,c1.precio,c2.nombre,c2.precio
from comidas as c1
cross join comidas as c2
where c1.rubro='plato principal' and
c2.rubro='postre';


-- Si queremos el monto total de cada combinación:
select c1.nombre,c2.nombre,
c1.precio+c2.precio as total
from comidas as c1
cross join comidas as c2
where c1.rubro='plato principal' and
c2.rubro='postre';


-- problemas , guardias tareas

drop table if exists guardias , tareas;

create table guardias(
documento char(8),
nombre varchar(30),
sexo char(1), /* 'f' o 'm' */
domicilio varchar(30),
primary key (documento)
);

create table tareas(
codigo tinyint unsigned auto_increment,
domicilio varchar(30),
descripcion varchar(30),
horario char(2), /* 'AM' o 'PM'*/
primary key (codigo)
);

insert into guardias values('22333444','Juan Perez','m','Colon 123');
insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas (domicilio,descripcion,horario)
values('Colon 1111','vigilancia exterior','AM');
insert into tareas (domicilio,descripcion,horario)
values('Urquiza 234','vigilancia exterior','PM');
insert into tareas (domicilio,descripcion,horario)
values('Peru 345','vigilancia interior','AM');
insert into tareas (domicilio,descripcion,horario)
values('Avellaneda 890','vigilancia interior','PM');

-- select

select * from guardias;
select * from tareas;

-- nombre, t.domicilio,descripcion
select g.nombre , t.domicilio,t.descripcion
from guardias as g
cross join tareas as t;

select nombre,t.domicilio,descripcion
from guardias
cross join tareas as t;

select nombre,t.domicilio,descripcion
from guardias
join tareas as t;

-- problema 2 , equipos

drop table if exists equipos;


create table equipos(
nombre varchar(30),
barrio varchar(20),
domicilio varchar(30),
entrenador varchar(30)
);


insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

select * from equipos;


select e1.nombre,e2.nombre,e1.barrio as 'sede'
from equipos as e1
cross join equipos as e2
where e1.nombre<>e2.nombre;


select e1.nombre,e2.nombre,e1.barrio as 'sede'
from equipos as e1
inner join equipos as e2
where e1.nombre<>e2.nombre;

-- problemas 3. , tabla clientes

drop table if exists clientes;

create table clientes(
  nombre varchar(30),
  domicilio varchar(30),
  sexo char(1),
  edad tinyint
 );


insert into clientes (nombre,sexo,edad) values('Juan Perez','m',45);
insert into clientes (nombre,sexo,edad) values('Ana Lopez','f',50);
insert into clientes (nombre,sexo,edad) values('Federico Herrero','m',30);
insert into clientes (nombre,sexo,edad) values('Mariano Juarez','m',35);
insert into clientes (nombre,sexo,edad) values('Maria Torres','f',36);
insert into clientes (nombre,sexo,edad) values('Ines Duarte','f',55);
insert into clientes (nombre,sexo,edad) values('Alejandra Figueroa','f',40);

select * from clientes;

-- inner join
select c1.nombre,c1.edad,c1.sexo, c2.nombre,c2.edad,c2.sexo
from clientes as c1
join clientes as c2
where c1.sexo='f' and c2.sexo='m';

-- cross join
select c1.nombre,c1.edad,c1.sexo, c2.nombre,c2.edad,c2.sexo
from clientes as c1
cross join clientes as c2
 where c1.sexo='f' and c2.sexo='m';
 
--
select c1.nombre,c1.edad,c1.sexo, c2.nombre,c2.edad,c2.sexo
from clientes as c1
cross join clientes as c2
where c1.sexo='f' and c2.sexo='m' and
c2.edad - c1.edad between -10 and 10; 
