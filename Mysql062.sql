-- varias tablas , join 62

drop table if exists libros, editoriales;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned default 0,
  primary key (codigo)
 );
 
 
 create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  direccion varchar(30) not null,
  primary key(codigo)
 );
 
 
insert into editoriales (nombre,direccion) values('Paidos','Colon 190');
insert into editoriales (nombre,direccion) values('Emece','Rivadavia 765');
insert into editoriales (nombre,direccion) values('Planeta','General Paz 245'); 
insert into editoriales (nombre,direccion) values('Sudamericana','9 de Julio 1008'); 


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
  values('Cervantes y el quijote','Borges- Bioy Casares',3,25.5,300);
  
  
select * from libros;

select * from editoriales;  


-- listar las 2 tablas segun los codigos de editoriales
select * from libros
join editoriales
on libros.codigoeditorial=editoriales.codigo;


-- ver todas las condiciones posibles de cada uno
select * from libros
join editoriales;
  
  
-- listar las 2 tablas segun los codigos de editoriales 2  
select * from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo;
  
-- listar 2 tablas segun codigo a ciertos campos de ambas tablas
select nombre,autor,titulo,direccion from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo;  


select l.codigo,titulo,autor,e.nombre from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo;


select codigo,titulo,autor,nombre from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo;



-- problemas 1 clientes provincias


drop table if exists clientes,provincias;

create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint unsigned,
  telefono varchar(11),
  primary key(codigo)
 );
 
 
create table provincias(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo)
 );
 
 
insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');
 insert into provincias (nombre) values('Misiones');
 insert into provincias (nombre) values('Salta');
 insert into provincias (nombre) values('Buenos Aires');
 insert into provincias (nombre) values('Neuquen');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');
  
  
--
select * from provincias;
select * from clientes;


-- obtener datos en ambas tablas

--

select c.codigo,c.nombre,c.ciudad,p.codigo,p.nombre
from clientes as c 
join provincias as p
on c.codigoprovincia = p.codigo;

select c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
from clientes as c
join provincias as p
on c.codigoProvincia=p.codigo;


select c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
from clientes as c
join provincias as p
on c.codigoProvincia=p.codigo
order by c.nombre;


select c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
from clientes as c
join provincias as p
on c.codigoProvincia=p.codigo;


-- problema 2 , socios , inscritos

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
 
 
insert into inscriptos values ('22333444','natacion','2005','s');
insert into inscriptos values ('22333444','natacion','2006','n');
insert into inscriptos values ('23333444','natacion','2005','s');
insert into inscriptos values ('23333444','tenis','2006','s');
insert into inscriptos values ('23333444','natacion','2006','s');
insert into inscriptos values ('24333444','tenis','2006','n');
insert into inscriptos values ('24333444','basquet','2006','n');

select * from inscriptos;

select * from socios;

select s.nombre,i.*
from socios as s
join inscriptos as i
on s.documento=i.documento;

select s.nombre,i.*
from socios as s
join inscriptos as i
on s.documento=i.documento;




select s.nombre,i.deporte
from socios as s
join inscriptos as i
on s.documento=i.documento
where año=2006;


select s.nombre,i.*
from socios as s
join inscriptos as i
on s.documento=i.documento
where s.documento='23333444';

-- Problema 3 , libros, prestamos


drop table if exists libros,prestamos;

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


 insert into prestamos
  values(15,'22333444','2006-07-10','2006-07-12');
 insert into prestamos
  values(15,'22333444','2006-07-20','2006-07-21');
 insert into prestamos (codigolibro,documento,fechaprestamo)
  values(15,'23333444','2006-07-25');
 insert into prestamos (codigolibro,documento,fechaprestamo)
  values(30,'23333444','2006-07-28');
 insert into prestamos (codigolibro,documento,fechaprestamo)
  values(28,'25333444','2006-08-10');
  
  select * from libros;
  
  select * from prestamos;
  
  
select l.titulo,p.*
from prestamos as p
join libros as l
on l.codigo=p.codigolibro;  


select p.documento,fechaprestamo,fechadevolucion
from prestamos as p
join libros as l
on l.codigo=p.codigolibro
where l.titulo='Manual de 1º grado';


select l.titulo,p.documento,p.fechaprestamo
from prestamos as p
join libros as l
on l.codigo=p.codigolibro
where p.fechadevolucion is null;


-- problema 3  ,consultas obrassociales

drop table if exists consultas , obrassociales;


create table consultas(
  fecha date,
  hora time,
  documento char(8) not null,
  codigoobrasocial tinyint unsigned,
  medico varchar(30),
  primary key(fecha,hora,medico)
 );
 
 create table obrassociales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(15),
  monto decimal(5,2) unsigned,
  primary key(codigo)
 );
 
insert into obrassociales (nombre,monto)
values('PAMI',2);
insert into obrassociales (nombre,monto)
values('IPAM',5);
insert into obrassociales (nombre,monto)
values('OSDOP',3);

insert into consultas values('2006-08-10','8:00','22333444',1,'Perez');
insert into consultas values('2006-08-10','10:00','22333444',1,'Lopez');
insert into consultas values('2006-08-10','8:30','23333444',1,'Perez');
insert into consultas values('2006-08-10','9:00','24333444',2,'Perez');
insert into consultas values('2006-08-10','10:00','25333444',3,'Perez');
insert into consultas values('2006-08-10','8:30','25333444',1,'Garcia');
insert into consultas values('2006-09-10','8:30','25333444',1,'Lopez');


select c.fecha,c.hora,c.documento,c.medico,os.nombre,os.monto
from consultas as c
join obrassociales as os
on os.codigo=c.codigoobrasocial;


select c.fecha,c.hora,c.documento,os.nombre,os.monto,c.medico
from consultas as c
join obrassociales as os
on os.codigo=c.codigoobrasocial
where c.medico='Perez';

select distinct os.nombre
from consultas as c
join obrassociales as os
on os.codigo=c.codigoobrasocial
where c.fecha='2006-08-10' and
medico='Perez';