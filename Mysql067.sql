-- Varias tablas (natural join) 67

drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40) not null,
autor varchar(30) not null default 'Desconocido',
codigoeditorial tinyint unsigned not null,
precio decimal(5,2) unsigned,
cantidad tinyint unsigned default 0,
primary key (codigo)
);

create table editoriales(
codigoeditorial tinyint unsigned auto_increment,
nombre varchar(20) not null,
primary key(codigoeditorial)
);

--
insert into editoriales (nombre) values('Planeta');
insert into editoriales (nombre) values('Emece');
insert into editoriales (nombre) values('Paidos');
insert into editoriales (nombre) values('Sudamericana');

insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('El Aleph','Borges',1,43.5,200);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Alicia en el pais de las maravillas','Lewis Carroll',2,33.5,100);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Martin Fierro','Jose Hernandez',1,55.8,50);

-- select

select * from editoriales;
select * from libros;

-- relacional las columnas que tienen el mismo nombre ,tipo de dato ,en ambas tablas
select titulo,nombre
from libros as l
natural join editoriales as e;

-- es igual a 
select titulo,nombre
from libros as l
join editoriales as e
on l.codigoeditorial=e.codigoeditorial;


-- left join
select nombre,titulo
from editoriales as e
natural left join libros as l;



select nombre,titulo
from editoriales as e
left join libros as l
on e.codigoeditorial=l.codigoeditorial;


-- problemas , natural join , 1 socios , inscriptos


drop table if exists socios,inscriptos;

create table socios(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);

create table inscriptos(
documento char(8) not null, 
deporte varchar(15) not null,
año year,
matricula char(1), /*si esta paga ='s' sino 'n'*/
primary key(documento,deporte,año)
);


insert into socios values('22333444','Juan Perez','Colon 234');
insert into socios values('23333444','Maria Lopez','Sarmiento 465');
insert into socios values('24333444','Antonio Juarez','Caseros 980');
insert into socios values('25333444','Marcelo Pereyra','Sucre 349');

insert into inscriptos values ('22333444','natacion','2015','s');
insert into inscriptos values ('22333444','natacion','2016','n');
insert into inscriptos values ('23333444','natacion','2015','s');
insert into inscriptos values ('23333444','tenis','2016','s');
insert into inscriptos values ('23333444','natacion','2016','s');
insert into inscriptos values ('24333444','tenis','2016','n');
insert into inscriptos values ('24333444','basquet','2016','n');

select * from socios;
select * from inscriptos;

-- join normal con natural join

select s.nombre , i.*
from socios as s
natural join inscriptos as i;

-- join 
select nombre,i.*
from socios as s
join inscriptos as i
on s.documento=i.documento;

-- natural left join
select nombre,i.*
from socios as s
natural left join inscriptos as i;

-- left join
select nombre,i.*
from socios as s
left join inscriptos as i
on s.documento=i.documento;


-- rigth join
select nombre,i.*
from inscriptos as i
natural right join socios as s;

