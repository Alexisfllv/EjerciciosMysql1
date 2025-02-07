-- Insertar datos en una tabla buscando un valor en otra (insert - select) 75

drop tables if exists libros, editoriales;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  codigoeditorial tinyint unsigned,
  precio decimal(5,2) unsigned,
  primary key (codigo)
);

create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  domicilio varchar(30),
  primary key(codigo)
);

insert into libros values (1,'El aleph','Borges',2,23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,15);
insert into libros values (3,'Matematica estas ahi','Paenza',2,34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,12);

insert into editoriales values(1,'Planeta','San Martin 222');
insert into editoriales values(2,'Emece','San Martin 590');
insert into editoriales values(3,'Paidos','Colon 245');

-- insertar informacion al campo libros , con conexion a editoriales
insert into libros (titulo,autor,codigoeditorial,precio)
select 'Harry Potter y la camara secreta','J.K.Rowling',codigo,45.90
from editoriales
where nombre='Emece';

select * from libros;
select * from editoriales;

--

-- nuevo registro
insert into libros (titulo,autor,codigoeditorial,precio)
select 'CodeClean', 'RRW',codigo,65
from editoriales
where domicilio = 'Colon 245';

-- problema 1 , socios,inscriptos

drop table if exists socios,inscriptos;


create table socios(
  numero int unsigned auto_increment,
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  primary key(numero)
);

create table inscriptos(
  numerosocio int unsigned,
  deporte varchar(20),
  año year not null,
  cuota char(1), /*'s' o 'n', si esta paga o no*/
  primary key(numerosocio,deporte,año)
);

insert into socios values(23,'22333444','Juan Perez','Colon 123');
insert into socios values(56,'23333444','Ana Garcia','Sarmiento 984');
insert into socios values(102,'24333444','Hector Fuentes','Sucre 293');
insert into socios values(150,'25333444','Agustin Perez','Avellaneda 1234');
insert into socios values(230,'26333444','Maria Perez','Urquiza 283');
insert into socios values(231,'29333444','Agustin Perez','Urquiza 283');

insert into inscriptos values(23,'tenis','2015','s');
insert into inscriptos values(23,'tenis','2016','s');
insert into inscriptos values(23,'natacion','2015','s');
insert into inscriptos values(102,'tenis','2015','s');
insert into inscriptos values(102,'natacion','2016','s');

select * from socios;
select * from inscriptos;

-- 
insert into inscriptos (numerosocio,deporte,año,cuota)
select numero,'tenis','2016','s'
from socios
where documento='23333444';

 
--  2 condiciones
insert into inscriptos (numerosocio,deporte,año,cuota)
select numero,'basquet','2016','n'
from socios
where nombre='Agustin Perez' and
domicilio='Urquiza 283';

--
insert into inscriptos (numerosocio,deporte,año,cuota)
select numero,'natacion','2016','n'
from socios
where domicilio='Urquiza 283';

-- verificar

select s.nombre , i.deporte , i.año
from inscriptos as i
join socios as s
on i.numerosocio = s.numero;




-- prob 2 , libros,socios,prestamos

drop table if exists libros,socios,prestamos;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar (30),
  editorial varchar (15),
  primary key (codigo)
);

create table socios(
  numero int unsigned auto_increment,
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);

create table prestamos(
  codigolibro int unsigned not null,
  numerosocio int not null,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key(codigolibro,fechaprestamo)
);

insert into socios values(20,'20222000','Juan Perez','Colon 123');
insert into socios values(31,'25222111','Juan Perez','Sucre 34');
insert into socios values(52,'25333222','Ana Maria Lopez','Avellaneda 235');
insert into socios values(82,'28333222','Luisa Duarte','San Martin 877');
insert into socios values(90,'29333222','Carlos Fuentes','Rivadavia 864');

insert into libros values (15,'Manual de 1º grado','Moreno Luis','Emece');
insert into libros values (28,'Manual de 2º grado','Moreno Luis','Emece');
insert into libros values (30,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros values (35,'El aleph','Borges','Emece');
insert into libros values (36,'Aprenda PHP','Molina Marcos','Planeta');
insert into libros values (40,'Cervantes y el quijote','Borges','Paidos');
insert into libros values (46,'Aprenda Java','Molina Marcos','Planeta');

insert into prestamos values(15,20,'2016-07-10','2016-07-12');
insert into prestamos values(15,31,'2016-07-12','2016-07-15');
insert into prestamos values(15,20,'2016-07-18',null);
insert into prestamos values(28,20,'2016-07-15',null);
insert into prestamos values(30,20,'2016-07-20',null);
insert into prestamos values(35,31,'2016-07-20','2016-07-22');
insert into prestamos values(36,90,'2016-07-25','2016-07-26');


select * from socios;
select * from libros;
select * from prestamos;

-- ingresar un prestamo con el numero de socio
insert into prestamos
(codigolibro,numerosocio,fechaprestamo)
select 40,numero,'2026-09-15'
from socios
where documento = '25333222';

select * from prestamos;

-- ingresar un prestamo con el nombre autor y nombre socio

INSERT INTO prestamos (codigolibro, numerosocio, fechaprestamo, fechadevolucion)
SELECT 
    l.codigo AS codigolibro, 
    s.numero AS numerosocio, 
    '2013-09-12' AS fechaprestamo, 
    '2014-09-12' AS fechadevolucion
FROM libros l, socios s
WHERE l.codigo = 36
AND s.numero = 90;


select * from prestamos;


--
INSERT INTO prestamos (codigolibro, numerosocio, fechaprestamo)
SELECT l.codigo, s.numero, '2026-09-15'
FROM libros l, socios s
WHERE l.titulo = 'El aleph'  -- Buscas el libro
AND s.documento = '25333222'; -- Buscas el socio

select * from prestamos;

-- 
insert into prestamos (codigolibro,numerosocio,fechaprestamo)
select 35,numero,'2016-09-16'
from socios 
where nombre='Juan Perez' and
domicilio='Sucre 34';


select * from prestamos;

-- documento, nombre de los socios
select distinct s.documento,s.nombre
from socios as s
join prestamos as p
on s.numero=p.numerosocio
where fechadevolucion is null;

-- morosos

drop table if exists morosos;

create table morosos
select distinct s.documento,s.nombre
from socios as s
join prestamos as p
on s.numero=p.numerosocio
where fechadevolucion is null;

select * from morosos;

-- numero de socio , documento , nombre de todos los socios que no son deudores , 
-- no deudores
select s.numero,s.documento,s.nombre
from socios as s
left join morosos as m
on s.documento=m.documento
where m.documento is null;

--
insert into prestamos (codigolibro,numerosocio,fechaprestamo)
select 15,s.documento,'2016-07-28'
from socios as s
left join morosos as m
on s.documento=m.documento
where m.documento is null
and s.documento='20222000';

select * from prestamos;


-- es un dato moroso
insert into prestamos (codigolibro,numerosocio,fechaprestamo)
select 36,s.numero,'2016-07-28'
from socios as s
left join morosos as m
on s.documento=m.documento
where m.documento is null
and s.documento='29333222';

--
update prestamos
set fechadevolucion='2016-07-29'
where codigolibro=36 and
fechaprestamo='2016-07-28';


-- libro codigo , libro titulo 
-- con fecha de devolciion como nulo

select l.codigo,l.titulo
from libros as l
left join prestamos as p
on p.codigolibro=l.codigo
where p.fechaprestamo is not null and
fechadevolucion is null;

select * from prestamos;

-- librosausentes
drop table if exists librosausentes;

create table librosausentes
select l.codigo,l.titulo
from libros as l
left join prestamos as p
on p.codigolibro=l.codigo
where p.fechaprestamo is not null and
fechadevolucion is null;

select * from librosausentes;

-- mientras se null el libro de ausente se registra
insert into prestamos (codigolibro,numerosocio,fechaprestamo)
select l.codigo,82,'2016-09-17'
from libros as l
left join librosausentes as la
on la.codigo=l.codigo
where la.codigo is null and
l.codigo=36;

-- prob 3. , carreras,materias , inscriptos

drop table if exists carreras,materias,inscriptos;

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
año year,
cuota char(1),/* si esta paga o no*/
primary key (documento,codigocarrera,codigomateria,año)
);



insert into carreras values(1,'Analista de sistemas');
insert into carreras values(2,'Diseñador web');

insert into materias values(1,1,'Programacion I','Alfredo Lopez');
insert into materias values(2,1,'Sistemas de datos I','Bernardo Garcia');
insert into materias values(3,1,'Ingles tecnico','Edit Torres');
insert into materias values(1,2,'Programacion basica','Alfredo Lopez');
insert into materias values(2,2,'Ingles I','Edit Torres');
insert into materias values(3,2,'Protocolos','Hector Juarez');

insert into inscriptos values('22333444',1,1,'2015','s');
insert into inscriptos values('22333444',1,2,'2015','s');
insert into inscriptos values('22333444',1,3,'2016','n');
insert into inscriptos values('23222222',1,1,'2015','s');
insert into inscriptos values('23222222',1,2,'2016','s');
insert into inscriptos values('24555666',1,1,'2015','s');
insert into inscriptos values('24555666',2,1,'2015','s');
insert into inscriptos values('25000999',1,1,'2015','s');
insert into inscriptos values('25000999',1,2,'2015','s');
insert into inscriptos values('25000999',2,1,'2016','n');
insert into inscriptos values('25000999',2,2,'2016','s');

-- inscriptos sin codigo , nombre materia, nombre carrera

select i.documento,c.nombre,m.nombre,año,cuota
from inscriptos as i
join carreras as c
on c.codigo=i.codigocarrera 
join materias as m
on m.codigo=i.codigomateria and
m.codigocarrera=c.codigo;

select * from inscriptos;

-- insertar


insert into inscriptos (documento,codigocarrera,codigomateria,año,cuota)
select '30222333',c.codigo,m.codigo,'2018','s'
from carreras as c
join materias as m
on c.codigo=m.codigocarrera
where c.nombre='Diseñador web' and
m.nombre='Programacion basica';



select * from inscriptos;






















