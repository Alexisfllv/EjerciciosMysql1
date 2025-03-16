-- claves foraneas 63

drop table libros, editoriales;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned default 0,
  primary key (codigo)
 );
 
 
create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  primary key(codigo)
);

describe libros ;

describe editoriales;


--
insert into editoriales values(2,'Emece');
insert into editoriales values(15,'Planeta');
insert into editoriales values(23,'Paidos');

insert into libros values(1,'El aleph','Borges',23,4.55,10);
insert into libros values(2,'Alicia en el pais de las maravillas','Lewis Carroll',2,11.55,2);
insert into libros values(3,'Martin Fierro','Jose Hernandez',15,7.12,4);


select * from libros;

select * from editoriales;


select l.codigo,l.titulo,l.autor,e.nombre
from libros as l join editoriales as e
on l.codigoeditorial = e.codigo;

--

select l.titulo,e.nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo;
  
  
-- problemas 1  , clientes provincias

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

insert into provincias(codigo,nombre) values(1,'Cordoba');
insert into provincias(codigo,nombre) values(2,'Santa Fe');
insert into provincias(codigo,nombre) values(30,'Misiones');
insert into provincias(codigo,nombre) values(13,'Salta');
insert into provincias(codigo,nombre) values(15,'Buenos Aires');
insert into provincias(codigo,nombre) values(20,'Neuquen');


insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Ramos Betina', 'San Martin 999', 'Bahia Blanca',15,'4223366');
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Lucas', 'San Martin 1010', 'Posadas',30,'0457858745');


select * from clientes;

select * from provincias;

-- join 
select c.nombre,c.ciudad,p.nombre
from clientes as c
join provincias as p
on c.codigoprovincia = p.codigo;


-- enlace tablas
select c.nombre,c.ciudad,p.nombre
from clientes as c
left join provincias as p
on c.codigoprovincia=p.codigo;


describe clientes;

 alter table clientes
  modify codigoprovincia char(1);

-- left join 
select c.nombre,c.ciudad,p.nombre
from clientes as c
left join provincias as p
on c.codigoprovincia=p.codigo;

SELECT c.nombre, c.ciudad, p.nombre
FROM clientes AS c
LEFT JOIN provincias AS p
ON c.codigoprovincia = p.codigo;

-- add
insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
values ('Lopez Lucas', 'San Martin 1010', 'Posadas',99,'0457858745');


-- inner join 
SELECT c.nombre, c.ciudad, p.nombre
FROM clientes AS c
JOIN provincias AS p
ON c.codigoprovincia = p.codigo;


-- left join 
SELECT c.nombre, c.ciudad, p.nombre
FROM clientes AS c
LEFT JOIN provincias AS p
ON c.codigoprovincia = p.codigo;



-- problema 2 , 

drop table if exists provincias , clientes;

CREATE TABLE provincias (
    codigo TINYINT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY (codigo)
);
CREATE TABLE clientes (
    codigo INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    codigoprovincia TINYINT UNSIGNED,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigoprovincia) REFERENCES provincias(codigo)
);

-- Insertar provincias
INSERT INTO provincias (nombre) VALUES ('Cordoba');
INSERT INTO provincias (nombre) VALUES ('Santa Fe');
INSERT INTO provincias (nombre) VALUES ('Buenos Aires');

-- Insertar clientes
INSERT INTO clientes (nombre, codigoprovincia) VALUES ('Lopez Marcos', 1);
INSERT INTO clientes (nombre, codigoprovincia) VALUES ('Perez Ana', 1);
INSERT INTO clientes (nombre, codigoprovincia) VALUES ('Ramos Betina', 3);
INSERT INTO clientes (nombre, codigoprovincia) VALUES ('Gomez Pedro', NULL);

-- solo datos propios que se unen

select c.nombre,p.nombre 
from clientes as c
inner join provincias as p
on c.codigoprovincia = p.codigo;

-- todo los datos de la tabla 1
select c.nombre,p.nombre 
from clientes as c
left join provincias as p
on c.codigoprovincia = p.codigo;

-- todos los datos de la tabla 2
SELECT c.nombre AS cliente, p.nombre AS provincia
FROM clientes AS c
RIGHT JOIN provincias AS p
ON c.codigoprovincia = p.codigo;

-- todos los registos de ambas tablas si no hay concidencia da null
-- SELECT c.nombre AS cliente, p.nombre AS provincia
-- FROM clientes AS c
-- FULL OUTER JOIN provincias AS p
-- ON c.codigoprovincia = p.codigo;
 
 
-- todas las combinaciones posibles 1 x 2 
SELECT c.nombre AS cliente, p.nombre AS provincia
FROM clientes AS c
CROSS JOIN provincias AS p;


-- problema 3  / deportes , inscriptos

drop table if exists inscriptos,deportes;

create table deportes(
  codigo tinyint unsigned,
  nombre varchar(20),
  profesor varchar(30),
  primary key(codigo)
 );
 
create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint unsigned not null,
  año year,
  matriculapaga char(1),/* 's' si está paga, 'n' si no está paga*/
  primary key(documento,codigodeporte,año)
 );
 
insert into deportes values(1,'Tenis','Juan Lopez');
insert into deportes values(2,'Natacion','Maria Lopez');
insert into deportes values(3,'Basquet','Antonio Juarez');

insert into inscriptos values ('22333444',2,'2005','s');
insert into inscriptos values ('22333444',2,'2006','n');
insert into inscriptos values ('23333444',2,'2005','s');
insert into inscriptos values ('23333444',1,'2005','s');
insert into inscriptos values ('23333444',1,'2006','s');
insert into inscriptos values ('24333444',2,'2006','n');
insert into inscriptos values ('24333444',3,'2006','n');

select * from deportes;

select * from inscriptos;

select i.documento,i.codigodeporte,i.año,i.matriculapaga,d.nombre
from inscriptos as i
inner join deportes as d
on i.codigodeporte = d.codigo;

--
alter table deportes modify codigo char(1);

update deportes set codigo=left(nombre,1);

select * from deportes;

SET SQL_SAFE_UPDATES = 0;


-- no sale porque no hay comparacion a encontrar
select d.nombre,i.*
from deportes as d
join inscriptos as i
on d.codigo=i.codigodeporte;

