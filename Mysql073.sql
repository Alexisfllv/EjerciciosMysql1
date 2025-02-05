-- Crear tabla a partir de otra (create - insert) 73

drop table if exists libros, editoriales;

create table libros (
codigo int unsigned auto_increment,
titulo varchar(40) not null,
autor varchar(30) not null default 'Desconocido',
editorial varchar(20) not null,
precio decimal(5,2) unsigned,
primary key (codigo)
);

describe libros;

insert into libros values (1,'El aleph','Borges','Emece',23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);
insert into libros values (3,'Matematica estas ahi','Paenza','Emece',34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez','Paidos',43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez','Planeta',12);
insert into libros values (6,'Aprenda PHP','Mario Molina','Paidos',21.8);
insert into libros values (7,'Aprenda Java','Mario Molina','Paidos',55.4);
insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll','Emece',18);
insert into libros values (9,'Antologia poetica','Borges','Paidos',47.9);

select * from libros;

-- crear tabla editoriales e insertar informacion

create table editoriales
select distinct editorial as nombre
from libros;

describe editoriales;
select * from editoriales;
-- crear tabla cantidadporeditorial 

create table cantidadporeditorial
select editorial as nombre , count(*) as cantidad
from libros
group by editorial;

describe cantidadporeditorial;

select * from cantidadporeditorial;


-- prob 1 , facturas

drop table if exists facturas;

create table facturas(
numero int(10) zerofill auto_increment,
numeroitem smallint unsigned not null,
descripcion varchar(30),
precioporunidad decimal(5,2) unsigned,
cantidad tinyint unsigned,
primary key (numero,numeroitem) 
);


insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(100,1,'escuadra 20 cm.',2.50,20);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(100,2,'escuadra 50 cm.',5,30);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(100,3,'goma lapiz-tinta',0.35,100);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(102,1,'lapices coloresx6',4.40,50);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(102,2,'lapices coloresx12',8,60);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(255,1,'lapices coloresx24',12.35,100);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(567,1,'compas plastico',12,50);
insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
values(567,2,'compas metal',18.90,80);


select * from facturas;

-- guardar la inf en tabla montofacturas

select numero,sum(precioporunidad * cantidad) as total
from facturas
group by numero;

drop table if exists montofacturas;

create table montofacturas
select numero,sum(precioporunidad*cantidad) as total
from facturas
group by numero;

select * from montofacturas;

-- prob 2 , tabla empleados

drop table if exists empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
domicilio varchar(30),
fechaingreso date,
primary key(documento)
);

insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('22333111','Juan Perez','m','Colon 123','1990-02-01');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('30000234','Alberto Soto','m','Peru 232','2003-08-15');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23');
insert into empleados (documento,nombre,sexo,domicilio,fechaingreso)
values ('30154269','Oscar Mendez','m','Colon 1245','2004-06-23');

select * from empleados;

-- ingresos cantidad de empleados,

select year(fechaingreso),count(*)
from empleados
group by year(fechaingreso);

-- tabla ingresos con la consulta a la tabla empleados
create table ingresos
select year(fechaingreso) as anio,
count(*) as cantidad
from empleados
group by year (fechaingreso);

select * from ingresos;


-- prob 3 , inscriptos

drop table if exists inscriptos;

create table inscriptos(
documento char(8) not null,
deporte varchar(20) not null,
año year not null,
cuota char(1), /*'s' o 'n', si esta paga o no*/
primary key(documento,deporte,año)
);

insert into inscriptos values('22333444','tenis','2015','s');
insert into inscriptos values('22333444','tenis','2016','s');
insert into inscriptos values('22333444','natacion','2015','s');
insert into inscriptos values('24333444','tenis','2015','s');
insert into inscriptos values('24333444','natacion','2016','s');
insert into inscriptos values('25333444','tenis','2015','s');
insert into inscriptos values('25333444','tenis','2016','s');
insert into inscriptos values('25333444','basquet','2016','s');

select * from inscriptos;

-- cuantos socios , cada anio

select deporte ,año,count(*)
from inscriptos
group by deporte,año;

drop table if exists inscriptosporanio;

create table inscriptosporanio
select deporte ,año,count(*)
from inscriptos
group by deporte,año;

select * from inscriptosporanio;


-- cuantas veces se a inscripto una persona en algun deporte

select documento,count(*)
from inscriptos
group by documento;

create table cantidadinscripcionesporsocio
select documento,count(*)
from inscriptos
group by documento;

select * from cantidadinscripcionesporsocio;

describe cantidadinscripcionesporsocio;

-- prob 4 , cursos

drop table if exists cursos;

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

select * from cursos;

-- mostrar la cantidad de cursos por horario
select horario, count(*) 
from cursos
group by horario;

drop table if exists cantidadcursosporhorario;

create table cantidadcursosporhorario
select horario, count(*)
from cursos
group by horario;

select * from cantidadcursosporhorario;

-- se quiere saber el promedio de clases por tema
select tema,avg(clases)
from cursos
group by tema;

drop table if exists clasesportema;


create table clasesportema
select tema,
avg(clases) as cantidad
from cursos
group by tema;

select * from clasesportema;

-- mostrar distintos temas de las clases

select distinct tema
from cursos;

drop table if exists temas;

create table temas
select distinct tema as 'temas diferentes'
from cursos;

select * from temas;


-- prob 5 , temas

drop table if exists notas;

create table notas(
documento char(8) not null,
nombre varchar(30),
nota decimal(4,2) unsigned
);

describe notas;

insert into notas values('30333444','Juan Perez',8);
insert into notas values('30433444','Ana Maria Garcia',7.5);
insert into notas values('30533444','Marcelo Morales',3.5);
insert into notas values('30633444','Fabiola Juarez',4.5);
insert into notas values('30333444','Juan Perez',7.8);
insert into notas values('30433444','Ana Maria Garcia',6);
insert into notas values('30533444','Marcelo Morales',4.2);
insert into notas values('30633444','Fabiola Juarez',7);
insert into notas values('30333444','Juan Perez',9);
insert into notas values('30433444','Ana Maria Garcia',5.8);
insert into notas values('30633444','Fabiola Juarez',2);
insert into notas values('30333444','Juan Perez',10);
insert into notas values('30633444','Fabiola Juarez',6.7);

-- documento del alumno , promedio de notas , promedios
select
documento,
avg(nota)
from notas
group by documento;

drop table if exists promedios;

create table promedios
select documento,
avg(nota) as 'promedio'
from notas
group by documento;

select * from promedios;


-- agrupe por documento , seleccione documento , nombre de alumnos aprobados promedio mayor o igual a 4
select
documento,
if (avg(nota)>= 4  ,'aprobado' ,'no aprobado') as 'estado'
from notas
group by documento;

select
documento,
avg(nota) as promedio
from notas
group by documento
having avg(nota)>=4;

-- aprobados
drop table if exists aprobados;

create table aprobados
select
documento,
avg(nota) as promedio
from notas
group by documento
having avg(nota)>=4;

select * from aprobados;

-- prob 6 , cuentas
drop table if exists cuentas;

create table cuentas(
numero int(8) zerofill auto_increment,
documento char(8) not null,
nombre varchar(30),
saldo decimal(9,2),
primary key(numero)
);

describe cuentas;

insert into cuentas values(1234,'22333444','Juan Perez',2000.60);
insert into cuentas values(2566,'23333444','Maria Pereyra',5050);
insert into cuentas values(5987,'24333444','Marcos Torres',200);
insert into cuentas values(14434,'25333444','Ana Juarez',8000.60);
insert into cuentas values(28566,'23333444','Maria Pereyra',8050);
insert into cuentas values(35987,'24333444','Marcos Torres',2000);

select * from cuentas;

-- documento cliente , cantidad = cuentas x cada cliente , toal calcular la suma de todas las cuentas de cada cliente
select documento , nombre , count(*) as cantidad ,sum(saldo) as total
from cuentas
group by documento,nombre;

drop table if exists cuentasporcliente;

create table cuentasporcliente
select documento , nombre , count(*) as cantidad ,sum(saldo) as total
from cuentas
group by documento,nombre;

select * from cuentasporcliente;

-- prob 7 prestamos

drop table if exists prestamos;

create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  primary key(titulo,fechaprestamo)
 );
 
insert into prestamos
values('Manual de 1º grado','22333444','2016-07-10','2016-07-12');
insert into prestamos
values('Manual de 1º grado','22333444','2016-07-20','2016-07-21');
insert into prestamos (titulo,documento,fechaprestamo)
values('Manual de 1º grado','23333444','2016-07-25');
insert into prestamos (titulo,documento,fechaprestamo)
values('Alicia en el pais de las maravillas','23333444','2016-07-28');
insert into prestamos (titulo,documento,fechaprestamo)
values('El aleph','25333444','2016-08-10');
insert into prestamos
values('Manual de 2º grado','23333444','2016-07-28','2016-07-29');

select * from prestamos;

-- titulos de libros devueltos y fecha de prestamo

select titulo , documento , fechadevolucion
from prestamos
where fechadevolucion is null;

-- libros que no se dolvieron como tabla , prestados
drop table if exists prestados;

create table prestados
select titulo , documento , fechadevolucion
from prestamos
where fechadevolucion is null;

select * from prestados;

-- documento , fecha prestaod , cantidad de libros no devueltos
select titulo, documento, min(fechaprestamo),count(*)
from prestamos
where fechadevolucion is null
group by titulo,documento;

-- morosos 
drop table if exists morosos;

create table morosos
select titulo, documento, 
min(fechaprestamo) as minimo,
count(*) as cantidad
from prestamos
where fechadevolucion is null
group by titulo,documento;

select * from morosos;

-- prob 8 , comidas
drop table if exists comidas;

create table comidas(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
rubro enum ('entrada','principal','postre'),
precio decimal (5,2) unsigned,
primary key(codigo)
);

insert into comidas (nombre,rubro,precio)
values('fiambres',1,2.5);
insert into comidas (nombre,rubro,precio)
values('arroz',1,1.6);
insert into comidas (nombre,rubro,precio)
values('sopa',1,2.4);
insert into comidas (nombre,rubro,precio)
values('milanesa y fritas',2,3.4);
insert into comidas (nombre,rubro,precio)
values('cuarto de pollo',2,2.5);
insert into comidas (nombre,rubro,precio)
values('hamburguesa',2,2.8);
insert into comidas (nombre,rubro,precio)
values('flan',3,1);
insert into comidas (nombre,rubro,precio)
values('porcion de torta',3,2.1);
insert into comidas (nombre,rubro,precio)
values('gelatina',3,0.9);

select * from comidas;

-- cros join combinando entrada , plato principal , postre;

select 
c1.nombre,c2.nombre,c3.nombre,
c1.precio+c2.precio+c3.precio as total
from comidas as c1
cross join comidas as c2
cross join comidas as c3
where c1.rubro = 1 and
c2.rubro = 2 and
c3.rubro = 3;

-- menues
drop table if exists menues;

create table menues
select 
c1.nombre as entrada,
c2.nombre as principal,
c3.nombre as postre,
c1.precio+c2.precio+c3.precio as total
from comidas as c1
cross join comidas as c2
cross join comidas as c3
where c1.rubro=1 and
c2.rubro=2 and
c3.rubro=3;

select * from menues;












