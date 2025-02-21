--  Borrar registros consultando otras tablas (delete - join) 80

drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial tinyint unsigned,
primary key(codigo)
);

create table editoriales(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key(codigo)
);

insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');

insert into libros values (1,'El aleph','Borges',2);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1);
insert into libros values (3,'Matematica estas ahi','Paenza',2);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2);

select * from libros;

select * from editoriales;

delete libros
from libros
inner join editoriales
on libros.codigoeditorial =editoriales.codigo
where editoriales.nombre = 'Emece';

select * from libros;


SELECT @@global.sql_safe_updates;

SET SQL_SAFE_UPDATES = 0;

-- prob 1, clientes,provincias

drop table if exists clientes, provincias;

create table clientes (
codigo int unsigned auto_increment,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint unsigned,
telefono varchar(11),
primary key(codigo)
);

create table provincias(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');
insert into provincias (nombre) values('Misiones');
insert into provincias (nombre) values('Salta');
insert into provincias (nombre) values('Buenos Aires');
insert into provincias (nombre) values('Neuquen');

insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
insert into clientes (nombre,domicilio,ciudad,codigoprovincia,telefono)
values ('Lopez Lucas', 'San Martin 1010', 'Posadas',5,'0457858745');


select * from provincias;

select * from clientes;

-- borrar registros de clientes donde los nombres de las provincias sean Santa Fe

delete clientes
from clientes
inner join provincias
on clientes.codigoprovincia = provincias.codigo
where provincias.nombre = 'Santa fe';

-- prob 2 carreras, materias,inscriptos

drop table if exists carreras, materias, inscriptos;


create table carreras(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
primary key(codigo)
);

create table materias(
codigo tinyint unsigned auto_increment,
codigocarrera tinyint unsigned,
nombre varchar(30),
profesor varchar(30),
primary key(codigo,codigocarrera)
);

create table inscriptos(
documento char(8) not null,
codigocarrera tinyint unsigned,
codigomateria tinyint unsigned,
año year
);

insert into carreras values(1,'Analista de sistemas');
insert into carreras values(2,'Diseñador web');

insert into materias values(1,1,'Programacion I','Alfredo Lopez');
insert into materias values(2,1,'Sistemas de datos I','Bernardo Garcia');
insert into materias values(3,1,'Ingles tecnico','Edit Torres');
insert into materias values(1,2,'Programacion basica','Alfredo Lopez');
insert into materias values(2,2,'Ingles I','Edit Torres');
insert into materias values(3,2,'Protocolos','Hector Juarez');

insert into inscriptos values('22333444',1,3,'2016');
insert into inscriptos values('23222222',1,2,'2016');
insert into inscriptos values('25000999',1,2,'2016');
insert into inscriptos values('25000999',2,1,'2016');
insert into inscriptos values('25000999',2,2,'2016');

select * from carreras;
select * from materias;
select * from inscriptos;

-- borrar los inscriptos con los codigos de materia y codigo carrera , se borren de inscriptos

delete inscriptos
from inscriptos
inner join materias as m
on inscriptos.codigomateria = m.codigo
inner join carreras as c
on inscriptos.codigocarrera = c.codigo 
and c.codigo = m.codigocarrera
where m.nombre = 'Sistemas de datos I';



-- materias = 6 -1 5
-- inscriptos = 5 -3 2
































