-- funciones de flujo if 60

drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(30),
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );


describe libros;

insert into libros (titulo, autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',50.5);
insert into libros (titulo, autor,editorial,precio)
  values('Alicia a traves del espejo','Lewis Carroll','Emece',25);
insert into libros (titulo, autor,editorial,precio) 
  values('El aleph','Borges','Paidos',15);
insert into libros (titulo, autor,editorial,precio)
  values('Matemática estas ahi','Paenza','Paidos',10);
insert into libros (titulo, autor,editorial)
  values('Antologia','Borges','Paidos');
insert into libros (titulo, editorial)
  values('El gato con botas','Paidos');
insert into libros (titulo, autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',90);
  
select * from libros;

-- 01
-- listar libros con precio menor a 50
select titulo from libros
where precio<50;

-- listar libros con precio mayor a 50 , true = caro , false = economico

select titulo,
if(precio>50,'caro','economico')
from libros;

-- 02
-- selecionar autores y contar cuantos registros
select autor, count(*)
from libros
group by autor;


--
select autor,count(*)
from libros
group by autor
having count(*)>1;

-- condicion cada autor si es mayor de cada una

select autor,
if (count(*)>1,'Más de 1','1')
from libros
group by autor;

--

select autor,
if (count(*)>1,'Más de 1','1') as cantidad
from libros
group by autor
order by cantidad;


select autor,
if (count(*)>1,'Más de 1','1') as cantidad
from libros
group by autor
order by cantidad;


-- problemas 1 empleados

drop table if exists empleados;


create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  domicilio varchar(30),
  fechaingreso date,
  fechanacimiento date,
  sueldobasico decimal(5,2) unsigned,
  hijos tinyint unsigned,
  primary key(documento)
);


insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550,0);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650,2);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510,1);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('30000222','Luis LUque','m','Urquiza 456','1980-09-01','1980-03-29',700,3);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',400,3);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420,1);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350,2);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaingreso,fechanacimiento,sueldobasico,hijos)
  values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390,0);
 insert into empleados 
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico,hijos)
  values ('30419964','Oscar Torres','m','Hernandez 1234','1996-04-10','1978-05-02',400,0);
  
  
  
select * from empleados;  
-- 

select sexo,count(sexo),
if (sexo='f','rosas','corbata') as 'Obsequio'
from empleados
where month(fechanacimiento)=5
group by sexo;


select nombre,sueldobasico,hijos,
if (sueldobasico<=500,300,150) as salarioporhijo,
if (sueldobasico<=500,300*hijos,150*hijos) as salariofamiliar,
if (sueldobasico<=500,sueldobasico+(300*hijos),sueldobasico+(150*hijos)) as total
from empleados
where hijos>0;


-- problema 2 , luz


drop table if exists luz;


create table luz(
  documento char(8) not null,
  domicilio varchar(30),
  monto decimal(5,2) unsigned,
  vencimiento date
);

INSERT INTO luz (documento, domicilio, monto, vencimiento) VALUES
('12345678', 'Av. Las Flores 123', 45.50, '2025-02-01'),
('87654321', 'Jr. Los Pinos 456', 78.30, '2025-02-05'),
('56781234', 'Calle Sol Naciente 789', 32.00, '2025-01-31'),
('43218765', 'Pasaje Los Sauces 321', 120.75, '2025-02-10'),
('34561278', 'Av. Los Laureles 654', 67.25, '2025-02-03');


select * from luz;

-- comparar la fecha actual anterior y posterior

select * ,
if (curdate() > vencimiento ,'vencido','no vencido') as estado
from luz;

INSERT INTO luz (documento, domicilio, monto, vencimiento) VALUES
('12345677', 'Matve.bs', 100.50, '2025-01-01');



--

select documento,vencimiento,
current_date as 'Fecha actual',
monto, 
if (datediff(current_date,vencimiento)>0,'Si','No') as vencida
from luz;

-- datediff devulve numero de diferencia

-- cortar servicio si paso las vechas cuantas por documento
select documento,count(*),
if (count(*)>1,'Cortar servicio','') as 'aa'
from luz
where datediff(current_date,vencimiento)>0
group by documento;


-- tabla alumnos

drop table if exists alumnos;

create table alumnos(
  legajo char(5) not null,
  nombre varchar(30),
  promedio decimal(4,2)
);


insert into alumnos values(3456,'Perez Luis',8.5);
insert into alumnos values(3556,'Garcia Ana',7.0);
insert into alumnos values(3656,'Ludueña Juan',9.6);
insert into alumnos values(2756,'Moreno Gabriela',4.8);
insert into alumnos values(4856,'Morales Hugo',3.2);


select * from alumnos;

-- diferencias a aprobados y desaprobados
select nombre , promedio ,
if(promedio > 5 , 'aprobado','desaprobado')
from alumnos;


-- dar medallas a mayor de 9 en promedio

select nombre , promedio,
if(promedio >= 9,'dar medalla','')
from alumnos;

-- tabla vehiculos 


drop table if exists vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char(4),
  horallegada time not null,
  horasalida time,
  primary key(patente,horallegada)
 );
 
 
describe vehiculos;
 

insert into vehiculos (patente,tipo,horallegada,horasalida)
values('ACD123','auto','8:30','9:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
values('AKL098','auto','8:45','15:10');
insert into vehiculos (patente,tipo,horallegada,horasalida)
values('HGF123','auto','9:30','18:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
values('DRT123','auto','15:30',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
values('FRT545','moto','19:45',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
values('GTY154','auto','20:30','21:00');

 
 
select * from vehiculos;

-- quiero saber si la hora de entrada es temprano o tarde

select * ,
if (horallegada >'12:00:00' ,'tarde','temprano')
from vehiculos;


-- calcular las horas que estuvieron cada vehiculos

select patente,horallegada,horasalida,
left(timediff(horasalida,horallegada),5) as horasminutos,
if (hour(timediff(horasalida,horallegada))>4,
hour(timediff(horasalida,horallegada)) div 4,0) as horagratis
from vehiculos
where horasalida is not null;

-- tabla entradas

drop table if exists entradas;

create table entradas(
  sala tinyint unsigned,
  fecha date,
  hora time,
  capacidad smallint unsigned,
  entradasvendidas smallint unsigned,
  primary key(sala,fecha,hora)
 );
 
insert into entradas values(1,'2006-05-10','20:00',300,50);
insert into entradas values(1,'2006-05-10','23:00',300,250);
insert into entradas values(2,'2006-05-10','20:00',400,350);
insert into entradas values(2,'2006-05-11','20:00',400,380);
insert into entradas values(2,'2006-05-11','23:00',400,400);
insert into entradas values(3,'2006-05-12','20:00',350,350);
insert into entradas values(3,'2006-05-12','22:30',350,100);
insert into entradas values(4,'2006-05-12','20:00',250,0); 
 
-- 
select * from entradas;


select * ,
if(entradasvendidas >= capacidad , 'esta agotado',capacidad-entradasvendidas) as 'estado de entradas'
from entradas;

select sala,fecha,hora,
if (capacidad=entradasvendidas,'sala llena',capacidad-entradasvendidas) as 'Entradas disponibles'
from entradas;
 

select *,
if (entradasvendidas>(capacidad div 2),'mas de la mitad','menos de la mitad vendidas') as vendidas
from entradas
where entradasvendidas>0;
