-- Insertar registros con valores de otra tabla (insert - select) 76

drop table if exists libros,editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
editorial varchar(20),
precio decimal(5,2) unsigned,
primary key(codigo)
);

create table editoriales(
nombre varchar(20)
);

insert into libros values (1,'El aleph','Borges','Emece',23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);
insert into libros values (3,'Matematica estas ahi','Paenza','Emece',34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez','Paidos',43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez','Planeta',12);
insert into libros values (6,'Aprenda PHP','Mario Molina','Paidos',21.8);
insert into libros values (7,'Aprenda Java','Mario Molina','Paidos',55.4);
insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll','Emece',18);
insert into libros values (9,'Antologia poetica','Borges','Paidos',47.9);

-- insertar registros de la tabla libros a editoriales;
insert into editoriales (nombre)
select distinct editorial from libros;

describe editoriales;

select * from editoriales;

-- borrar registros

truncate editoriales;

select * from libros;

--
select editorial,count(*)
from libros
group by editorial;

-- cantidadporeditorial 
drop table if exists cantidadporeditorial;

create table cantidadporeditorial(
nombre varchar(20),
cantidad smallint unsigned
);

describe cantidadporeditorial;

insert into cantidadporeditorial 
(nombre ,cantidad)
select 
editorial ,
count(*) 
from libros
group by editorial;

select * from cantidadporeditorial;



-- prob 1 , facturas,

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


drop table if exists montofacturas;

describe facturas;
select * from facturas;


create table montofacturas(
numero int(10) zerofill,
total decimal(9,2) unsigned,
primary key(numero)
);

describe montofacturas;
select * from montofacturas;

select 
numero,
sum(precioporunidad * cantidad) as total
from facturas
group by numero;


-- ingresar esos datos a la tabla creada montofacturas
insert into montofacturas
(numero,total)
select 
numero,
sum(precioporunidad * cantidad) as total
from facturas
group by numero;


select * from montofacturas;


-- prob 2 , inscriptos
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

describe inscriptos;
select * from inscriptos;

-- cantida de deporte por anio
select deporte,año,count(*)
from inscriptos
group by deporte,año;


-- tabla inscriptospordeporteporaño

drop table if exists inscriptospordeporteporaño;

create table inscriptospordeporteporaño(
deporte varchar(20),
año year,
cantidad smallint unsigned
);


describe inscriptospordeporteporaño;
select * from inscriptospordeporteporaño;

insert into inscriptospordeporteporaño
(deporte ,año , cantidad)
select deporte,año,count(*)
from inscriptos
group by deporte,año;


-- cuantas veces se ha inscripto una persona en algun deporte
select documento,count(*)
from inscriptos
group by documento;

-- tabla inscripcionesporpersona
drop table if exists inscripcionesporpersona;

create table inscripcionesporpersona(
documento char(8),
cantidad tinyint unsigned,
primary key(documento)
);

select * from inscripcionesporpersona;

insert into inscripcionesporpersona
(documento,cantidad)
select documento,count(*)
from inscriptos
group by documento;


-- prob 3 . notas

drop table if exists notas;

create table notas(
documento char(8) not null,
nombre varchar(30),
nota decimal(4,2) unsigned
);

describe notas;
select * from notas;

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


-- tabla promedio campo, promedios
drop table if exists promedios;


create table promedios
(
documento char (8) not null,
nombre varchar(30),
promedio decimal(4,2),
primary key (documento)
);

describe promedios;
select * from promedios;

select documento,nombre,avg(nota) as promedio
from notas
group by documento,nombre;

-- insertar los datos a la tabla promedios

insert into promedios
(documento,nombre,promedio)
select documento,nombre , avg(nota)
from notas
group by documento,nombre;

select * from promedios;


-- alumnos con promedios mayores a 4
select documento,nombre
from notas
group by documento,nombre
having avg(nota)>=4;


-- tabla aprobados

drop table if exists aprobados;

create table aprobados
(
numero tinyint unsigned auto_increment,
documento char(8),
nombre varchar (30),
primary key (numero)
);

describe aprobados ;
select * from aprobados;

insert into aprobados 
(documento,nombre)
select documento,nombre
from notas
group by documento,nombre
having avg(nota)>=4;

-- ver la condicion
select documento,nombre,
if (avg(nota)>4,'aprobado','desaprobado') as condicion
from notas
group by documento,nombre;

-- tabla condicion

drop table if exists condicion;

create table condicion(
documento char(8) not null,
nombre varchar(30),
condicion varchar(15)
);

insert into condicion
(documento,nombre,condicion)
select documento,nombre,
if (avg(nota)>4,'aprobado','desaprobado') as condicion
from notas
group by documento,nombre;

select * from condicion;


-- prob 4 tabla cuentas
drop table if exists cuentas;

create table cuentas(
numero int(8) zerofill auto_increment,
documento char(8) not null,
nombre varchar(30),
saldo decimal(9,2),
primary key(numero)
);

insert into cuentas values(1234,'22333444','Juan Perez',2000.60);
insert into cuentas values(2566,'23333444','Maria Pereyra',5050);
insert into cuentas values(5987,'24333444','Marcos Torres',200);
insert into cuentas values(14434,'25333444','Ana Juarez',8000.60);
insert into cuentas values(28566,'23333444','Maria Pereyra',8050);
insert into cuentas values(35987,'24333444','Marcos Torres',2000);

select * from cuentas;

-- mostrar doc,cantidad, total

select documento,
count(*) as cantidad,
sum(saldo) as total
from cuentas
group by documento;

-- tabla cuentasporcliente
drop table if exists cuentasporcliente;

create table cuentasporcliente(
numero int unsigned auto_increment,
documento char(8),
cantidad tinyint unsigned,
total decimal(9,2) unsigned,
primary key(numero)
);

insert into cuentasporcliente
(documento,cantidad,total)
select documento,
count(*) as cantidad,
sum(saldo) as total
from cuentas
group by documento;


select * from cuentasporcliente;

-- prob 5 , clientes

drop table if exists clientes;

create table clientes(
nombre varchar(30),
domicilio varchar(30),
sexo char(1),
edad int
);

insert into clientes (nombre,sexo,edad) values('Juan Perez','m',45);
insert into clientes (nombre,sexo,edad) values('Ana Lopez','f',50);
insert into clientes (nombre,sexo,edad) values('Federico Herrero','m',30);
insert into clientes (nombre,sexo,edad) values('Mariano Juarez','m',35);
insert into clientes (nombre,sexo,edad) values('Maria Torres','f',36);
insert into clientes (nombre,sexo,edad) values('Ines Duarte','f',55);
insert into clientes (nombre,sexo,edad) values('Alejandra Figueroa','f',40);

select * from clientes;

select f.nombre,f.edad,
m.nombre,m.edad
from clientes as f
cross join clientes as m
where f.sexo='f' and m.sexo='m' and
m.edad - f.edad between -10 and 10;


-- tabla encuentros

drop table if exists encuentros;


create table encuentros(
codigo tinyint unsigned auto_increment,
dama varchar(30),
edaddama int,
caballero varchar(30),
edadcaballero tinyint unsigned,
fecha date,
primary key (codigo)
);

insert into encuentros
(dama, edaddama,caballero,edadcaballero)
select f.nombre,f.edad,
m.nombre,m.edad
from clientes as f
cross join clientes as m
where f.sexo='f' and m.sexo='m' and
m.edad - f.edad between -10 and 10;


select * from encuentros;


-- prob 6 , equipos
drop table if exists equipos;

create table equipos(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
domicilio varchar(30),
barrio varchar(20),
primary key(codigo)
);

describe equipos;


insert into equipos values(1,'Los tigres','Sarmiento 234','Gral. Paz');
insert into equipos values(2,'Los leones','Colon 123','Centro');
insert into equipos values(3,'Campeones','Guemes 346','Pueyrredon');
insert into equipos values(4,'Cebollitas','Colon 1234','Alberdi');

select e1.nombre,e2.nombre,e1.barrio as 'sede'
from equipos as e1
cross join equipos as e2
where e1.nombre<>e2.nombre;

-- encuentros

drop table if exists encuentros;

create table encuentros(
codigo tinyint unsigned auto_increment,
equipo1 varchar(30),
equipo2 varchar(30),
lugarencuentro varchar(30),
barrioencuentro varchar(20),
fecha date,
primary key(codigo)
);

select * from encuentros;

insert into encuentros
(equipo1,equipo2,lugarencuentro,barrioencuentro)
select e1.nombre,e2.nombre,e1.domicilio,e1.barrio
from equipos as e1
cross join equipos as e2
where e1.nombre<>e2.nombre;


select * from encuentros;


