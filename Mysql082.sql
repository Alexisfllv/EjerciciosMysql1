-- Borrar registros en cascada (delete - join) 82


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


-- BORRAR EDITORIAL EMECE y todos los libros relacionados a esa editorial

delete libros,editoriales
from libros
inner join editoriales
on libros.codigoeditorial = editoriales.codigo
where editoriales.nombre = 'Emece';

-- prob 1 , pacientes, obrassociales

drop table if exists pacientes,obrassociales;

create table pacientes(
documento char(8),
nombre varchar(30),
domicilio varchar(30),
codigoobrasocial tinyint unsigned
);

create table obrassociales(
codigo tinyint unsigned auto_increment,
nombre varchar(15),
domicilio varchar(30),
primary key(codigo)
);


insert into obrassociales values (1,'PAMI','Colon 345');
insert into obrassociales values (2,'IPAM','Sucre 98');
insert into obrassociales values (3,'OSDOP','Avellaneda 267');

insert into pacientes values('22333444','Juan Lopez','Guemes 235',1);
insert into pacientes values('23444555','Analia Juarez','Avellaneda 367',1);
insert into pacientes values('24555666','Juan Lopez','Guemes 235',2);
insert into pacientes values('25666777','Jose Ferrero','Urquiza 312',3);
insert into pacientes values('26777888','Hhector Garcia','Caseros 411',3);
insert into pacientes values('27888999','Susana Duarte','Peru 211',3);


select * from pacientes;

select * from obrassociales;

delete pacientes,obrassociales
from pacientes
inner join obrassociales
on pacientes.codigoobrasocial = obrassociales.codigo
where obrassociales.nombre = 'PAMI';


-- prob 2 , deportes , profesores,inscriptos

drop table if exists deportes,profesores,inscriptos;

create table deportes(
codigo tinyint unsigned auto_increment,
nombre varchar(20) not null,
profesor tinyint unsigned,
primary key(codigo)
);
 
create table profesores(
codigo tinyint unsigned auto_increment,
nombre varchar(30), 
domicilio varchar(30),
primary key(codigo)
);

create table inscriptos(
numerosocio int unsigned,
deporte tinyint unsigned,
año year not null
);

insert into profesores values(1,'Alfredo Perez','Sarmiento 984');
insert into profesores values(2,'Betina Molina','Sucre 356');
insert into profesores values(3,'Carlos Garcia','Urquiza 209');
insert into profesores values(4,'Daniel Morales','Salta 1234');

insert into deportes values(1,'tenis',1);
insert into deportes values(2,'natacion',2);
insert into deportes values(3,'basquet',3);
insert into deportes values(4,'futbol',1);

insert into inscriptos values(102,1,'2016');
insert into inscriptos values(102,2,'2016');
insert into inscriptos values(104,2,'2016');
insert into inscriptos values(104,3,'2016');
insert into inscriptos values(106,1,'2016');
insert into inscriptos values(109,2,'2016');


select * from profesores;
select * from deportes;
select * from inscriptos;

delete deportes,i
from deportes
inner join inscriptos as i
on deportes.codigo = i.deporte
where deportes.nombre = 'tenis';


delete deportes,profesores,inscriptos
from profesores 
inner join deportes
on profesores.codigo = deportes.codigo
inner join inscriptos
on deportes.codigo = inscriptos.deporte
where profesores.nombre = 'Carlos Garcia';

























