-- Borrar registros buscando coincidencias en otras tablas (delete - join) 81

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
insert into editoriales values(4,'Plaza & Janes');

insert into libros values (1,'El aleph','Borges',2);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1);
insert into libros values (3,'Matematica estas ahi','Paenza',2);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2);
insert into libros values (6,'Aprenda PHP','Mario Molina',9);

select * from libros;

select * from editoriales;

-- eliminar los libros registrados donde las editoriales no existan

delete libros
from libros
left join editoriales
on libros.codigoeditorial = editoriales.codigo
where editoriales.codigo is null;


select * from libros;


-- prob 1 , deportes,profesor,inscriptos


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
año year not null,
cuota char(1), /*'s' o 'n', si esta paga o no*/
primary key(numerosocio,deporte,año)
);

insert into profesores values(1,'Alfredo Perez','Sarmiento 984');
insert into profesores values(2,'Betina Molina','Sucre 356');
insert into profesores values(3,'Carlos Garcia','Urquiza 209');
insert into profesores values(4,'Daniel Morales','Salta 1234');

insert into deportes values(1,'tenis',1);
insert into deportes values(2,'natacion',2);
insert into deportes values(3,'basquet',3);
insert into deportes values(4,'futbol',1);

insert into inscriptos values(102,1,'2016','s');
insert into inscriptos values(102,2,'2016','s');
insert into inscriptos values(104,2,'2016','s');
insert into inscriptos values(104,3,'2016','s');
insert into inscriptos values(106,1,'2016','s');
insert into inscriptos values(109,2,'2016','s');

select * from profesores;

select * from deportes;

select * from inscriptos;

-- valores inscriptos registrados son los unicos 
delete deportes
from deportes
left join inscriptos as i
on deportes.codigo = i.deporte
where i.deporte is null;

-- borrar profesores que no dictan ningun deporte
delete profesores
from profesores
left join deportes as d
on d.profesor = profesores.codigo
where d.profesor is null;