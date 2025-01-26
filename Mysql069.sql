-- join, group by y funciones de agrupamiento 69

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


-- select
select * from libros;
select * from editoriales;


-- left join
select e.nombre,count(l.codigoeditorial) as 'cantidad de libros'
from editoriales as e
left join libros as l
on l.codigoeditorial=e.codigo
group by e.nombre;


-- inner join
select e.nombre,count(l.codigoeditorial) as 'cantidad de libros'
from editoriales as e
join libros as l
on l.codigoeditorial=e.codigo
group by e.nombre;


-- left join mas seleccion max
select e.nombre,max(l.precio) as 'mayor precio'
from editoriales as e
left join libros as l
on l.codigoeditorial=e.codigo
group by e.nombre;

-- inner join con seleccion
select e.nombre,
max(l.precio) as 'mayor precio'
from editoriales as e
join libros as l
on l.codigoeditorial=e.codigo
group by e.nombre;


-- problemas , clientes, provincias

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

insert into provincias (nombre)
values('Cordoba');
insert into provincias (nombre)
values('Santa Fe');
insert into provincias (nombre)
values('Corrientes');
insert into provincias (nombre)
values('Misiones');
insert into provincias (nombre)
values('Salta');
insert into provincias (nombre)
values('Buenos Aires');
insert into provincias (nombre)
values('Neuquen');

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

-- select
select * from clientes;
select * from provincias;


-- inner join  , cantidad de clientes
select p.nombre,
count(c.codigoprovincia) as 'cant. clientes'
from provincias as p
join clientes as c
on p.codigo=c.codigoprovincia
group by p.nombre;

-- left join  , cantidad de clientes
select p.nombre,
count(c.codigoprovincia) as 'cant. clientes'
from provincias as p
left join clientes as c
on p.codigo=c.codigoprovincia
group by p.nombre;

--
select p.nombre,
count(c.codigoprovincia) as 'cant. clientes'
from provincias as p
join clientes as c
on p.codigo=c.codigoprovincia
group by p.nombre
having count(c.codigoprovincia)>=2;


-- prob 2 - visitantes , ciudades

drop table if exists visitantes, ciudades;


create table visitantes(
nombre varchar(30),
edad tinyint unsigned,
sexo char(1),
domicilio varchar(30),
codigociudad tinyint unsigned not null,
telefono varchar(11),
montocompra decimal(6,2) unsigned
);

create table ciudades(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key (codigo)
);


insert into ciudades (nombre)
values('Cordoba');
insert into ciudades (nombre)
values('Alta Gracia');
insert into ciudades (nombre)
values('Villa Dolores');
insert into ciudades (nombre)
values('Carlos Paz');

insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Susana Molina', 28,'f','Colon 123',1,null,45.50); 
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Marcela Mercado',36,'f','Avellaneda 345',1,'4545454',0);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Alberto Garcia',35,'m','Gral. Paz 123',2,'03547123456',25); 
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Teresa Garcia',33,'f','Gral. Paz 123',2,'03547123456',0);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Roberto Perez',45,'m','Urquiza 335',1,'4123456',33.20);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Marina Torres',22,'f','Colon 222',3,'03544112233',25);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Julieta Gomez',24,'f','San Martin 333',2,'03547121212',53.50);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Roxana Lopez',20,'f','Triunvirato 345',2,null,0);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Liliana Garcia',50,'f','Paso 999',1,'4588778',48);
insert into visitantes (nombre,edad, sexo,domicilio,codigociudad,telefono,montocompra)
values ('Juan Torres',43,'m','Sarmiento 876',1,'4988778',15.30);

--

select * from ciudades;
select * from visitantes;


-- left join
select c.nombre,count(v.codigociudad)
from ciudades as c
left join visitantes as v
on c.codigo=v.codigociudad
group by c.nombre;

-- inner join
select c.nombre,count(v.codigociudad)
from ciudades as c
join visitantes as v
on c.codigo=v.codigociudad
where v.montocompra>0 
group by c.nombre;


-- inner join
select c.nombre,sexo,sum(montocompra) as 'total',
avg(montocompra) as 'promedio'
from ciudades as c
join visitantes as v
on c.codigo=v.codigociudad
group by c.nombre,sexo;


-- problema 3 departamentos,barrios

drop table if exists departamentos,barrios;

create table departamentos(
edificio varchar(30),
domicilio varchar(30) not null,
piso char(1) not null,
numerodpto char(2) not null,
detalles varchar(200),
codigobarrio tinyint unsigned,
precio decimal(6,2) unsigned,
primary key (edificio,piso,numerodpto)
);

create table barrios(
codigo tinyint unsigned auto_increment,
nombre varchar(30),
primary key(codigo) 
);
 
 
insert into barrios (nombre) values ('Centro');
insert into barrios (nombre) values ('Alberdi');
insert into barrios (nombre) values ('Gral. Paz');
insert into barrios (nombre) values ('Pueyrredon');

insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Avellaneda','Avellaneda 86','1','1',1,400.50);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Avellaneda','Avellaneda 86','1','2',1,400.50);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Avellaneda','Avellaneda 86','2','1',1,400.50);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Bolivar','Sarmiento 1203','1','1',3,500);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Centauro I','Peru 456','1','A',4,300);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Centauro I','Peru 456','2','C',4,350);
insert into departamentos (edificio,domicilio,piso,numerodpto,codigobarrio,precio)
values('Paris','Urquiza 364','1','12',1,600);


-- inner join
select edificio,domicilio,piso,numerodpto,nombre,precio
from departamentos as d
join barrios as b
on d.codigobarrio=b.codigo;


-- inner join
select edificio,nombre,count(*)
from departamentos as d
inner join barrios as b
on d.codigobarrio=b.codigo 
group by edificio,nombre;

-- inner join
select nombre,avg(precio)
from departamentos as d
join barrios as b
on d.codigobarrio=b.codigo 
group by nombre;

-- left join
select nombre,avg(precio)
from barrios as b
left join departamentos as d
on d.codigobarrio=b.codigo 
group by nombre;


-- problema 4 estructuras,alquileres

drop table if exists peliculas,alquileres;

create table peliculas (
codigo smallint unsigned auto_increment,
titulo varchar(50) not null,
actores varchar(40),
duracion tinyint unsigned,
primary key (codigo)
);

create table alquileres(
codigopelicula smallint unsigned not null,
socio varchar(30) not null,
fechaprestamo date not null,
fechadevolucion date,
primary key (codigopelicula,fechaprestamo)
);

--

insert into peliculas (titulo,actores,duracion)
values('Elsa y Fred','China Zorrilla',90);
insert into peliculas (titulo,actores,duracion)
values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actores,duracion)
values('Mision imposible 2','Tom Cruise',180);
insert into peliculas (titulo,actores,duracion)
values('Harry Potter y la piedra filosofal','Daniel H.',120);
insert into peliculas (titulo,actores,duracion)
values('Harry Potter y la camara secreta','Daniel H.',150);

insert into alquileres (codigopelicula,socio,fechaprestamo)
values(1,'Juan Lopez','2016-07-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(2,'Juan Lopez','2016-07-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(3,'Juan Lopez','2016-07-12');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(1,'Luis Molina','2016-08-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(3,'Luis Molina','2016-08-12');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(4,'Luis Molina','2016-08-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(1,'Andrea Torres','2016-09-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(2,'Andrea Torres','2016-08-02');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(3,'Andrea Torres','2016-08-15');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(4,'Andrea Torres','2016-08-22');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(4,'Juan Lopez','2016-08-25');
insert into alquileres (codigopelicula,socio,fechaprestamo)
values(1,'Andrea Torres','2016-08-25');

select * from peliculas;
select * from alquileres;

-- inner join
select titulo,socio,fechaprestamo,fechadevolucion 
from alquileres as a
join peliculas as p
on a.codigopelicula=p.codigo;

-- inner join
select p.titulo,count(*) from peliculas as p
join alquileres as a
on p.codigo=a.codigopelicula
group by p.titulo;

-- 
select socio,count(a.codigopelicula) 
from alquileres as a
group by socio;

select socio,count(distinct a.codigopelicula) 
from alquileres as a
group by socio;


-- 
select socio,
monthname(a.fechaprestamo) as mes,
count(a.codigopelicula)
from alquileres as a
group by socio, mes
order by mes;