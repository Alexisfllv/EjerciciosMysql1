-- Varias tablas rigth join 65

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
  codigo tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  primary key(codigo)
 );
 
insert into editoriales (nombre) values('Paidos');
insert into editoriales (nombre) values('Emece');
insert into editoriales (nombre) values('Planeta');
insert into editoriales (nombre) values('Sudamericana');

insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('El Aleph','Borges',3,43.5,200);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Alicia en el pais de las maravillas','Lewis Carroll',2,33.5,100);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Aprenda PHP','Mario Perez',1,55.8,50);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Java en 10 minutos','Juan Lopez',1,88,150);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Alicia a traves del espejo','Lewis Carroll',1,15.5,80);
insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
values('Cervantes y el quijote','Borges- Bioy Casares',3,25.5,250);

-- select

select * from libros;

select * from editoriales;

select l.titulo,l.autor,e.nombre
from libros as l
left join editoriales as e
on l.codigoeditorial = e.codigo;


select l.titulo,l.autor,e.nombre
from editoriales as e
left join libros as l
on l.codigoeditorial = e.codigo;



select l.titulo,l.autor,e.nombre
from libros as l
right join editoriales as e
on l.codigoeditorial = e.codigo;


-- problema 1 , socios, inscriptos

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

-- 
select s.nombre, s.domicilio, i.deporte
from socios as s
left join inscriptos as i
on s.documento = i.documento;

-- mismo datos con rigth

select s.documento,nombre,i.deporte,i.año,i.matricula
from inscriptos as i
right join socios as s
on s.documento=i.documento;

-- date
insert into inscriptos values ('26333444','basquet','2016','n');

--
select nombre,i.documento,deporte,i.año,i.matricula
from socios as s
right join inscriptos as i
on s.documento=i.documento;
