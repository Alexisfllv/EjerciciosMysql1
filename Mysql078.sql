-- Actualizar datos con valores de otra tabla (update) 78


drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial tinyint unsigned,
primary key(codigo)
);

create table editoriales(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key(codigo)
);


insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');

insert into libros values (1,'El aleph','Borges',2);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1);
insert into libros values (3,'Matematica estas ahi','Paenza',2);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2);


describe libros;

alter table libros add editorial varchar(20);

select * from libros;

-- asociar editorial al campo editoriales

update libros 
join editoriales
on libros.codigoeditorial = editoriales.codigo
set libros.editorial = editoriales.nombre;


SET SQL_SAFE_UPDATES = 0;

select * from libros;

alter table libros drop codigoeditorial;

select * from libros;

drop table editoriales;

select * from editoriales;

-- problemas 1, clientes,provincias;

drop table if exists clientes, provincias;

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

select * from provincias;
select * from clientes;

-- modificar tabla clientes con nombres de las provincias
select * from clientes;

alter table clientes add provincia varchar(20);

update clientes
inner join provincias
on clientes.codigoprovincia = provincias.codigo
set clientes.provincia = provincias.nombre;

select * from clientes;
-- borrar tabla provincias
drop table if exists provincias;
-- borrar columna clientes codigoprovincia
alter table clientes drop codigoprovincia;


select * from clientes;


-- prob 2 , socios,inscriptos

drop table socios,inscriptos;

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

insert into inscriptos values ('22333444','natacion','2015','s');
insert into inscriptos values ('22333444','natacion','2016','n');
insert into inscriptos values ('23333444','natacion','2015','s');
insert into inscriptos values ('23333444','tenis','2016','s');
insert into inscriptos values ('23333444','natacion','2016','s');
insert into inscriptos values ('24333444','tenis','2016','n');
insert into inscriptos values ('24333444','basquet','2016','n');


select * from socios;
select * from inscriptos;

-- modoficar tabla inscriptos

alter table inscriptos add nombre varchar(30) , add domicilio varchar(30);

update inscriptos as i
inner join socios as s
on i.documento = s.documento
set i.nombre = s.nombre , i.domicilio = s.domicilio;

select * from inscriptos;

drop table socios;


-- prob 3 , empleados,dependecias

drop table if exists empleados,dependencias;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
fechaingreso date,
primary key(documento)
);

create table dependencias(
documento char(8) not null,
seccion varchar(30),
sueldo decimal (6,2) unsigned,
primary key(documento)
);

insert into empleados values ('22333111','Juan Perez','Colon 123','1990-02-01');
insert into empleados values ('25444444','Susana Morales','Avellaneda 345','1995-04-01');
insert into empleados values ('20111222','Hector Pereyra','Caseros 987','1995-04-01');
insert into empleados values ('30000222','Luis Luque','Urquiza 456','1980-09-01');
insert into empleados values ('20555444','Laura Torres','San Martin 1122','2000-05-15');
insert into empleados values ('30000234','Alberto Soto','Peru 232','2003-08-15');
insert into empleados values ('30154269','Oscar Mendez','Colon 1245','2004-06-23');
 
 
insert into dependencias values('22333111','Gerencia',2000); 
insert into dependencias values ('25444444','Sistemas',1500);
insert into dependencias values ('20111222','Sistemas',1400);
insert into dependencias values ('30000222','Contaduría',1400);
insert into dependencias values ('20555444','Secretaría',1000);
insert into dependencias values ('30000234','Secretaría',1000);
insert into dependencias values ('30154269','Relaciones públicas',1100);


--

select * from empleados;
select * from dependencias;

alter table empleados 
add seccion varchar(30) not null, 
add sueldo decimal(6,2) unsigned;

update empleados as e
inner join dependencias as d
on e.documento = d.documento
set e.seccion = d.seccion , e.sueldo = d.sueldo;


select * from empleados;

drop table dependencias;

-- prob 4, alumnos

drop table if exists alumnos;


create table alumnos(
apellido varchar(20) not null,
nombre varchar(20),
documento char(8),
domicilio varchar(30),
primary key(documento)
);

insert into alumnos values('Perez','Luis','22333444','Colon 123');
insert into alumnos values('Lopez','Natalia','23333444','Caseros 980');
insert into alumnos values('Torres','Mariano','24333444','Bulnes 256');
insert into alumnos values('Garcia','Ana','25333444','Sucre 209');
insert into alumnos values('Perez','Antonio','26333444','Avellaneda 1083');

select * from alumnos;

update alumnos
set nombre = concat(apellido,' ',nombre);

alter table alumnos drop apellido;






