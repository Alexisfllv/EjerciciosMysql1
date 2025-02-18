-- Actualización en cascada (update - join)  79

drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial tinyint unsigned,
precio decimal(5,2) unsigned,
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
insert into editoriales values(4,'Plaza & Janes');

insert into libros values (1,'El aleph','Borges',2,44.20);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,12.33);
insert into libros values (3,'Matematica estas ahi','Paenza',2,9.99);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,17.22);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,23.56);

select * from editoriales;

select * from libros;

-- cambiar numero de codigo a  por nombre
update libros as l
inner join editoriales as e
on l.codigoeditorial = e.codigo
set l.codigoeditorial = 9, e.codigo=9
where e.nombre = 'Emece';

select * from libros;

select * from editoriales;



-- prob 1 - clientes,provincias

drop table if exists clientes,provincias;

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


insert into provincias (nombre)
values('Cordoba');
insert into provincias (nombre)
values('Santa Fe');
insert into provincias (nombre)
values('Corrientes');
insert into provincias (nombre)
values('Misiones');
insert into provincias (nombre)
values('Salta');
insert into provincias (nombre)
values('Buenos Aires');
insert into provincias (nombre)
values('Neuquen');

insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');


select * from provincias;
select * from clientes;

update clientes as c
join provincias as p
on c.codigoprovincia=p.codigo
set c.codigoprovincia=10, p.codigo=10
where p.nombre='Cordoba';


-- prob 2 , alumnos,notas

drop table if exists alumnos,notas;

create table alumnos(
documento char(8) not null,
nombre varchar(30),
primary key(documento)
);

create table notas(
documento char(8) not null,
nota decimal(4,2) unsigned
);

insert into alumnos values('22333444','Juan Perez');
insert into alumnos values('23555666','Marina Herrero');
insert into alumnos values('24000333','Daniel Juarez');
insert into alumnos values('25222111','Hector Paz');

insert into notas values('22333444',7);
insert into notas values('23555666',8);
insert into notas values('24000333',3);
insert into notas values('25222111',7);
insert into notas values('22333444',7);
insert into notas values('23555666',9);
insert into notas values('24000333',4);
insert into notas values('22333444',6);
insert into notas values('23555666',10);
insert into notas values('24000333',3);
insert into notas values('25222111',9);
insert into notas values('23555666',10);

select * from alumnos;
select * from notas;

update alumnos as a
inner join notas as n
on a.documento = n.documento
set a.documento = '22333445' , n.documento = '22333445'
where a.documento = '22333444';


select * from alumnos;






















