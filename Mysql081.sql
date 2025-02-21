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


-- prob 2 , alumnos, aprobados

drop table if exists alumnos,aprobados;

create table alumnos(
legajo int(3) unsigned,
nombre varchar(30)
);
 
create table aprobados(
legajo int(3) unsigned,
promedio decimal(4,2) unsigned
);


insert into alumnos values(123,'Juan Perez');
insert into alumnos values(223,'Marta Molina');
insert into alumnos values(343,'Patricia Vargas');
insert into alumnos values(456,'Hector Fuentes');
insert into alumnos values(467,'Alfredo Lopez');
insert into alumnos values(678,'Carla Juarez');

insert into aprobados values(223,9.4);
insert into aprobados values(456,6);
insert into aprobados values(467,4.5);
insert into aprobados values(678,7.8);

select * from alumnos;
select * from aprobados;

-- eliminar alumnos que no se encuentrar en la tabla aprobados

delete alumnos
from alumnos 
left join aprobados as ap
on alumnos.legajo = ap.legajo
where ap.legajo is null;



SET SQL_SAFE_UPDATES = 0;

-- prob 3 , socios,morosos

drop table if exists socios, morosos;

create table socios(
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);
   
create table morosos(
documento char(8),
fecha date
);

insert into socios values(234,'Juan Lopez','Colon 345');
insert into socios values(345,'Ana Ferrero','Caseros 98');
insert into socios values(456,'Juan Perez','Urquiza 356');
insert into socios values(567,'Karina Torres','Peru 743');
insert into socios values(678,'Juan Lopez','Avellaneda 234');
insert into socios values(789,'Laura Juarez','Sarmiento 765');

insert into morosos values(345,'2016-08-10');
insert into morosos values(567,'2016-09-24');
insert into morosos values(789,'2016-10-06');

select * from socios;
select * from morosos;

-- borrar de la tabla socios los sociosmorosos

delete socios
from socios
inner join morosos as m
on socios.documento = m.documento;




























