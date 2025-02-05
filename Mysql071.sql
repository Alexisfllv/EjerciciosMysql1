-- control if con varias tablas 71

drop table if exists libros, editoriales;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 1,
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );
 
create table editoriales ( 
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo) 
 );
 
insert into editoriales (nombre) values ('Planeta');
insert into editoriales (nombre) values ('Emece');
insert into editoriales (nombre) values ('Paidos');


insert into libros (titulo, autor,codigoeditorial,precio)
values('Alicia en el pais de las maravillas','Lewis Carroll',1,23.5);
insert into libros (titulo, autor,codigoeditorial,precio)
values('Alicia a traves del espejo','Lewis Carroll',2,25);
insert into libros (titulo, autor,codigoeditorial,precio) 
values('El aleph','Borges',2,15);
insert into libros (titulo, autor,codigoeditorial,precio)
values('Matemática estas ahi','Paenza',1,10);

select * from libros;
select * from editoriales;


-- hay libros en cada una de las editoriales?

select e.nombre,
if (count(l.codigoeditorial)>0, 'Si','No') as hay
from editoriales as e
left join libros as l
on e.codigo = l.codigoeditorial
group by e.nombre;



-- usando case
select e.nombre ,
case count(l.codigoeditorial)
when 0 then 'No'
else 'Si' end as 'Hay'
from editoriales as e
left join libros as l
on e.codigo = l.codigoeditorial
group by e.nombre;


-- prob1 , alumnos , notas

drop table if exists alumnos , notas;


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


select a.documento,a.nombre,avg(nota),
case when avg(nota)<4 then 'reprobado'
when avg(nota)>=4 and avg(nota)<7 then 'regular'
else 'promocionado' end as condicion
from alumnos as a
join notas as n
on a.documento=n.documento
group by n.documento;


select a.documento,a.nombre,
if (avg(nota)>=4,'si','no') as aprobado
from alumnos as a
join notas as n
on a.documento=n.documento
group by n.documento;

select a.documento,a.nombre,
case count(*)
when 1 then '1 nota'
when 2 then '2 notas'
else 'mas de 2' end as 'cantidad de notas'
from alumnos as a
join notas as n
on a.documento=n.documento
group by n.documento 
order by 'cantidad de notas';
