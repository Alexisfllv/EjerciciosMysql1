-- Crear tabla a partir de otras (create - insert - join) 74

drop table if exists libros, editoriales,cantidadporeditorial;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned,
  precio decimal(5,2) unsigned,
  primary key (codigo)
);

create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key(codigo)
);


insert into editoriales (nombre) values('Emece');
insert into editoriales (nombre) values('Planeta');
insert into editoriales (nombre) values('Paidos');

insert into libros values (1,'El aleph','Borges',1,23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',2,15);
insert into libros values (3,'Matematica estas ahi','Paenza',1,34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,12);
insert into libros values (6,'Aprenda PHP','Mario Molina',3,21.8);
insert into libros values (7,'Aprenda Java','Mario Molina',3,55.4);
insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll',1,18);
insert into libros values (9,'Antologia poetica','Borges',3,47.9);

select * from editoriales;
select * from libros;

-- cantidadporeditorial = tabla libros y editoriales;
drop table if exists cantidadporeditorial;

create table cantidadporeditorial
select 
e.nombre,
count(*) as cantidad
from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo    	
group by e.nombre;

select * from cantidadporeditorial;

-- prob 1 socios , deportes , inscriptos

drop table if exists socios,deportes,inscriptos;

create table socios(
documento char(8) not null,
nombre varchar(30) not null,
primary key(documento)
);

create table deportes(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
primary key(codigo)
);

create table inscriptos(
documento char(8) not null,
codigodeporte tinyint unsigned,
año year not null,
cuota char(1), /*'s' o 'n', si esta paga o no*/
primary key(documento,codigodeporte,año)
);

insert into socios values('22333444','Juan Perez');
insert into socios values('23333444','Ana Garcia');
insert into socios values('24333444','Hector Fuentes');
insert into socios values('25333444','Marta Molina');

insert into deportes (nombre) values('tenis');
insert into deportes (nombre) values('natacion');
insert into deportes (nombre) values('basquet');
insert into deportes (nombre) values('voley');

insert into inscriptos values('22333444',1,'2015','s');
insert into inscriptos values('22333444',1,'2016','s');
insert into inscriptos values('22333444',2,'2015','s');
insert into inscriptos values('24333444',1,'2015','s');
insert into inscriptos values('24333444',2,'2016','s');
insert into inscriptos values('25333444',1,'2015','s');
insert into inscriptos values('25333444',1,'2016','s');
insert into inscriptos values('25333444',3,'2016','s');

select * from socios;
select * from deportes;
select * from inscriptos;


-- cuantos socios se han inscripto en cada deporte cada anio , considerando solo los deportes que tienen inscripciones
-- cantidad socios,cada anio,

select d.nombre , s.nombre , i.año, i.cuota
from inscriptos as i
inner join socios as s
on i.documento = s.documento
inner join deportes as d
on i.codigodeporte = d.codigo;

-- tabla datosinscriptos

create table datosinscriptos
select 
d.nombre as nombredeporte ,
s.nombre as nombresocio, 
i.año , 
i.cuota
from inscriptos as i
inner join socios as s
on i.documento = s.documento
inner join deportes as d
on i.codigodeporte = d.codigo;

select * from datosinscriptos;


-- cuantas veces se ha inscripto un socio en algun deporte
select s.nombre , count(i.documento)
from socios as s
left join inscriptos as i
on s.documento = i.documento
left join deportes as d
on i.codigodeporte = d.codigo
group by s.nombre;

-- table sociosdeporte
drop table if exists sociosdeporte;

create table sociosdeporte
select 
s.nombre as 'nombre socio',
count(i.documento) as 'n. inscripto'
from socios as s
left join inscriptos as i
on s.documento = i.documento
left join deportes as d
on i.codigodeporte = d.codigo
group by s.nombre;

select * from sociosdeporte;

-- prob 2 .  cursos , inscriptciones

drop table if exists cursos, inscripciones;

create table cursos(
codigo tinyint unsigned auto_increment,
tema varchar(20) not null,
dias set ('lunes','martes','miercoles','jueves','viernes','sabado') not null,
horario enum ('AM','PM') not null,
clases tinyint unsigned,
fechainicio date,
costo decimal(5,2) unsigned,
primary key(codigo)
);
 
create table inscripciones(
documento char(8) not null,
codigocurso tinyint unsigned not null,
pago char(1), /*'s' si pagó 'n' si no pagó*/
primary key(documento,codigocurso)
);

insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('PHP básico','lunes,martes,miercoles','AM',18,'2016-08-07',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('PHP básico','lunes,martes,miercoles','PM',18,'2016-08-14',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('PHP básico','sabado','AM',18,'2016-08-05',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('PHP avanzado','martes,jueves','AM',20,'2016-08-01',350);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('JavaScript','lunes,martes,miercoles','PM',15,'2016-09-11',150);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('Paginas web','martes,jueves','PM',10,'2016-08-08',250);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('Paginas web','sabado','AM',10,'2016-08-12',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('Paginas web','lunes,viernes','AM',10,'2016-08-21',200);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('Paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2016-09-18',180);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('Paginas web','lunes,viernes','PM',10,'2016-09-25',280);
insert into cursos (tema, dias,horario,clases,fechainicio,costo)
values('JavaScript','lunes,martes,viernes,sabado','PM',12,'2016-09-18',150);

insert into inscripciones values ('22333333',1,'s');
insert into inscripciones values ('22333333',5,'s');
insert into inscripciones values ('22333333',6,'n');
insert into inscripciones values ('23333444',4,'s');
insert into inscripciones values ('23333444',5,'s');
insert into inscripciones values ('23333444',7,'s');
insert into inscripciones values ('24333555',11,'s');
insert into inscripciones values ('25333666',3,'n');
insert into inscripciones values ('25333666',7,'n');
insert into inscripciones values ('26333777',1,'s');
insert into inscripciones values ('26333777',11,'s');
insert into inscripciones values ('26333777',10,'s');


select * from cursos;
select * from inscripciones;


-- muestra cantidad de inscriptos por temas

select
c.tema,
count(i.documento)
from cursos as c
left join inscripciones as i
on c.codigo = i.codigocurso
group by tema; 

-- temas
drop table if exists temas;

create table temas
select
c.tema,
count(i.documento) as cantidad
from cursos as c
left join inscripciones as i
on c.codigo = i.codigocurso
group by tema; 

select * from temas;

-- join , de tabla curso e inscripciones , 
-- tema , cantdad de inscriptos , monto recaudado por tema de curso
select 
c.tema , 
c.costo , 
count(i.codigocurso) as cantidad,
count(i.codigocurso)* c.costo as total
from cursos as c
join inscripciones as i
on c.codigo = i.codigocurso
where i.pago = 's'
group by c.tema,c.costo;


-- recaudacion

create table recaudacion
select 
c.tema , 
c.costo , 
count(i.codigocurso) as cantidad,
count(i.codigocurso)* c.costo as total
from cursos as c
join inscripciones as i
on c.codigo = i.codigocurso
where i.pago = 's'
group by c.tema,c.costo;

select * from recaudacion;


-- prob 3 , libros , prestamos

drop table if exists libros , prestamos;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar (30),
  editorial varchar (15),
  primary key (codigo)
 );

create table prestamos(
  codigolibro int unsigned not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key(codigolibro,fechaprestamo)
 );

insert into libros values (15,'Manual de 1º grado','Moreno Luis','Emece');
insert into libros values (28,'Manual de 2º grado','Moreno Luis','Emece');
insert into libros values (30,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros values (35,'El aleph','Borges','Emece');
insert into libros values (45,'Aprenda PHP','Mario Molina','Planeta');

insert into prestamos
values(15,'22333444','2016-07-10','2016-07-12');
insert into prestamos
values(15,'22333444','2016-07-20','2016-07-21');
insert into prestamos (codigolibro,documento,fechaprestamo)
values(15,'23333444','2016-07-25');
insert into prestamos (codigolibro,documento,fechaprestamo)
values(30,'23333444','2016-07-28');
insert into prestamos (codigolibro,documento,fechaprestamo)
values(28,'25333444','2016-08-10');
insert into prestamos
values(45,'28333444','2016-08-10','2016-08-12');
insert into prestamos (codigolibro,documento,fechaprestamo)
values(45,'25333444','2016-09-10');


-- titulos libros , no devueltos , mas de un mes prestado o  menos

select
l.titulo,
if (adddate(p.fechaprestamo,30)<current_date(), 'si','no')as 'Mas de un 1 mes'
from libros as l
join prestamos as p
on l.codigo = p.codigolibro
where p.fechadevolucion is null;


-- prestados

drop table if exists prestados;

create table prestados
select
l.titulo,
if (adddate(p.fechaprestamo,30)<current_date(), 'si','no')as 'Mas de un 1 mes'
from libros as l
join prestamos as p
on l.codigo = p.codigolibro
where p.fechadevolucion is null;

select * from prestados;


