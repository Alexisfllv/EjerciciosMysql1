-- DISTINCT

drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );
 
 describe libros;
 
 

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',42.20);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Bioy Casares- Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', null, 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Planeta',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Planeta',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',12.10);
  
  
select * from libros;
  
  -- evitar datos repetidos de autor
select distinct autor
from libros;
  
  
  select autor
  from libros;
  
-- queremos autores pero que no sean nullos

select distinct autor
from libros
where autor is not null;
  
-- contar distintos autores sin los null 

select 
count(distinct autor)
from libros;
  
-- contar autores sin distn , no incluir valores null

select
count(autor)
from libros
where autor is not null;

-- nombres de las editoriales sin repeticion
select
distinct editorial 
from libros;

-- cantidad de editoriales sin repeticion
select
count(distinct editorial)
from libros;
  
-- contar editoriales sin repetion diferentes a la editorial Planeta
select
distinct autor
from libros
where editorial <> "Planeta";
  
-- contar la cantidad de autores distintos de cada editorial
-- distinc group by

select
editorial,
count(distinct autor)
from libros
group by editorial;
  
-- mostrar los titulos y editoriales de los libros sin repetir
-- titulos ni editoriales
select 
distinct titulo,editorial
from libros
order by titulo;
  
  
-- problema 1 Cursos

drop tables if exists cursos;


create table cursos(
  codigo tinyint unsigned auto_increment,
  tema varchar(20) not null,
  horario char(2) not null,
  clases tinyint unsigned default 10,
  fechainicio date,
  costo decimal(5,2) unsigned,
  primary key(codigo)
 );
 
 describe cursos;
 
  insert into cursos (tema,horario,clases,fechainicio,costo)
  values('PHP básico','AM',10,'2006-08-07',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('PHP básico','PM',default,'2006-08-14',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('PHP básico','AM',default,'2006-08-05',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('PHP avanzado','AM',20,'2006-08-01',350);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('JavaScript básico','PM',15,'2006-09-11',150);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('Paginas web','PM',15,'2006-08-08',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('Paginas web','AM',15,'2006-08-12',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('Paginas web','AM',15,'2006-08-21',200);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('HTML avanzado','AM',20,'2006-09-18',180);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('HTML avanzado','PM',20,'2006-09-25',180);
 insert into cursos (tema,horario,clases,fechainicio,costo)
  values('JavaScript avanzado','PM',25,'2006-09-18',150);

select * from cursos;
  
  -- obtenga la lista de temas de los cursos sin repeticion
  
  select
  distinct(tema)
  from cursos;
  
  -- seleccione los cursos donde el tema incluya PHP , sin repetir horario ni tema
  select
  distinct horario,tema
  from cursos
  where tema like "%PHP%";
  
  -- cuenta la cantidad de cursos distintos agrupados por horario
  
  select
  count(distinct tema),
  horario
  from cursos
  group by horario;
  
  -- problema 2 Clientes
  
  Drop table if exists clientes;
  
   create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
 );
  
  
   insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
  
  -- muestre las distintas provincias y ciudades en las cuales la empresa tiene clientes
  
  select * from clientes;
  
  select
  distinct provincia,ciudad
  from clientes;
  
  -- cantidad de ciudades distintas , por provincia en las cuales hay clientes
  
  select
  count(distinct ciudad),
  provincia
  from clientes
  group by provincia;
  
  
  
  drop table if exists visitas;
  
   create table visitas (
  numero int unsigned auto_increment,
  nombre varchar(30) not null,
  mail varchar(50),
  pais varchar (20),
  fecha date,
  primary key(numero)
);
  
 insert into visitas (nombre,mail,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-10-10');
 insert into visitas (nombre,mail,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-10-10');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-10-11');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
  
-- obtener los distintos nombres de quienes visitaron la pagina

select
distinct nombre
from visitas;
  
-- cantidad de veces donde la persona ingreso a la pagina

select
nombre,
count(*)
from visitas
group by nombre;
  
-- cantidad de veces que cada persona ingreso a la pagina en distintas fechas
select
nombre,
count(distinct fecha)
from visitas
group by nombre;
  
-- canti
  
  -- problema 3 Autos

DROP table if exists autos;

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo year,
  precio decimal(8,2) unsigned,
  primary key(patente)
 );
 
  insert into autos values('ACD123','Fiat 128','1970',15000);
 insert into autos values('ACG234','Renault 11','1990',40000);
 insert into autos values('BCD333','Peugeot 505','1990',80000);
 insert into autos values('GCD123','Renault 11','1990',70000);
 insert into autos values('BCC333','Renault Megane','1998',95000);
 insert into autos values('BVF543','Fiat 128','1975',20000);
 insert into autos values('FCD123','Renault 11','1995',70000);
 insert into autos values('HCC333','Renault Megane','1995',95000);
 insert into autos values('IVF543','Fiat 128','1970',20000);
 
 select * from autos;
  
  -- muestra la distintas marcas de autos disponibles
  select 
  distinct marca
  from autos;
  
  -- cantidad de autos por marca , pero de diferentes modelos
  select
  marca,
  count(distinct modelo)
  from autos
  group by marca;
  
  -- mostrar diferentes tipos de autos disponibles
  select
  distinct modelo
  from autos;
  
  -- problema 4 consultas
  
  drop table if exists consultas;
  
  
   create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30)
 );
 
 insert into consultas values('2006-08-10 8:00','Perez','22333444','Juana Garcia','PAMI');
 insert into consultas values('2006-08-10 10:00','Lopez','22333444','Juana Garcia','PAMI');
 insert into consultas values('2006-08-10 8:30','Perez','23333444','Adela Gomez','PAMI');
 insert into consultas values('2006-08-10 9:00','Perez','24333444','Juan Lopez','IPAM');
 insert into consultas values('2006-08-10 10:00','Perez','25333444','Hector Juarez','OSDOP');
 insert into consultas values('2006-08-10 8:30','Garcia','25333444','Ana Molina','PAMI');
 insert into consultas values('2006-09-10 8:30','Garcia','25333444','Ana Molina','PAMI');
 
 select * from consultas;
 
 -- mostrar diferentes obras sociales
 select
 distinct obrasocial
 from consultas;
 
 -- muestre los nombres de los distintos pacientes
select
distinct paciente
from consultas; 


-- muestre la cantidad distinta de obras sociales

select
count(distinct obrasocial)
from consultas;
 
-- cuente la cantidad de medicos sin repetir , que tiene consultas agrupadas por. mes.y dia

select 
extract(month from fechayhora),
extract(day from fechayhora),
count(distinct medico)
from consultas
group by extract(month from fechayhora),extract(day from fechayhora);
 
 
-- problema 5 inscriptos

drop table if exists inscriptos;

create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año year,
  matricula char(1) default 'N'
 );
 
 insert into inscriptos values('35333444','Juan Lopez','tenis','1990','S');
 insert into inscriptos values('35333444','Juan Lopez','basquet','1990','S');
 insert into inscriptos values('35333444','Juan Lopez','natación','1990','S');
 insert into inscriptos values('36333444','Ana Juarez','tenis','1990','S');
 insert into inscriptos values('36333444','Ana Juarez','natación','1990','S');
 insert into inscriptos values('35333444','Juan Lopez','voley','1991','S');
 insert into inscriptos values('35333444','Juan Lopez','voley','1992','S');
 insert into inscriptos values('35333444','Juan Lopez','tenis','1992','S');
 insert into inscriptos values('36333444','Ana Juarez','tenis','1991','S');
 insert into inscriptos values('37333444','Luis Duarte','tenis','1990','S');
 insert into inscriptos values('37333444','Luis Duarte','tenis','1991','S');
 
select * from inscriptos; 

-- muestre los nombres de los inscriptos sin repetir
select
distinct nombre
from inscriptos;

 
 -- muestre los nombres de los deportes sin repetir
 
select
distinct deporte
from inscriptos; 
 
 -- muestre la cantidad de alumnos distintos inscriptos en cada deporte
 
select
count(distinct nombre),
deporte
from inscriptos
group by deporte;

 
 
 
 
 
 
 
  