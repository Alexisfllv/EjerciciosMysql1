-- Insertar registros con valores de otra tabla (insert - select - join) 77


drop table libros, editoriales, cantidadporeditorial;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial tinyint unsigned,
precio decimal(5,2) unsigned,
primary key(codigo)
);

create table editoriales(
codigo tinyint unsigned auto_increment,
nombre varchar(20),
primary key(codigo)
);
 
create table cantidadporeditorial(
nombre varchar(20),
cantidad smallint unsigned
);

describe libros;
describe editoriales;
describe cantidadporeditorial;


insert into libros values (1,'El aleph','Borges',2,23.5);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,15);
insert into libros values (3,'Matematica estas ahi','Paenza',2,34.6);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,43.5);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,12);

insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');
insert into editoriales values(4,'Plaza & Janes');

select * from libros;
select * from editoriales;


-- ingresar datos a la tabla cantiaddporeditorial
drop table if exists cantidadporeditorial;

insert into cantidadporeditorial
(nombre,cantidad)
select e.nombre, count(l.codigoeditorial)
from editoriales as e
left join libros as l
on e.codigo = l.codigoeditorial
group by e.nombre;

select * from cantidadporeditorial;


-- PROB 1 , socios,deportes,inscriptos

drop table if exists socios,deportes,inscriptos;

create table socios(
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);
 
create table deportes(
codigo tinyint unsigned auto_increment,
nombre varchar(15),
profesor varchar(30),
primary key (codigo)
);

create table inscriptos(
documento char(8) not null,
codigodeporte varchar(20) not null,
año year not null,
cuota char(1), /*'s' o 'n', si esta paga o no*/
primary key(documento,codigodeporte,año)
);


insert into socios values('22333444','Juan Perez','Colon 123');
insert into socios values('23333444','Ana Lopez','Caseros 984');
insert into socios values('24333444','Marcelo Morales','Sucre 356');
insert into socios values('25333444','Susana Juarez','Sarmiento 723');

insert into deportes (nombre,profesor) values('tenis','Tadeo Torres');
insert into deportes (nombre,profesor) values('natacion','Natalia Nores');
insert into deportes (nombre,profesor) values('basquet','Bautista Pereyra');
insert into deportes (nombre,profesor) values('paddle','Bautista Pereyra');

insert into inscriptos values('22333444',1,'2015','s');
insert into inscriptos values('22333444',1,'2016','n');
insert into inscriptos values('22333444',2,'2015','s');
insert into inscriptos values('23333444',1,'2015','s');
insert into inscriptos values('23333444',2,'2016','s');
insert into inscriptos values('23333444',1,'2016','s');
insert into inscriptos values('24333444',1,'2016','s');
insert into inscriptos values('24333444',3,'2016','n');

select * from socios;
select * from deportes;
select * from inscriptos;

-- cantiadd alumnos inscriptos en cada deporte cada anio
select d.nombre,i.año,count(i.codigodeporte) as cantidad
from inscriptos as i
join deportes as d
on i.codigodeporte = d.codigo
group by d.nombre,i.año;

-- inscriptospordeporteporaño
drop table if exists  inscriptospordeporteporaño;

create table inscriptospordeporteporaño(
nombre varchar(20) not null,
año year,
cantidad tinyint unsigned
);


insert into inscriptospordeporteporaño
(nombre,año,cantidad)
select d.nombre,i.año,count(i.codigodeporte) as cantidad
from inscriptos as i
join deportes as d
on i.codigodeporte = d.codigo
group by d.nombre,i.año;

select * from inscriptospordeporteporaño;

-- nombre socio, nombre deporte , anio inscripcion 

select s.nombre as socio,d.nombre as deporte,i.año
from inscriptos as i
join socios as s 
on i.documento =s.documento
join deportes as d
on i.codigodeporte=d.codigo
where i.cuota='n';


-- socios deudores
drop table if exists sociosdeudores;

create table sociosdeudores(
socio varchar(30),
deporte varchar(15),
año year
);

insert into sociosdeudores
(socio,deporte,año)
select s.nombre as socio,d.nombre as deporte,i.año
from inscriptos as i
join socios as s 
on i.documento =s.documento
join deportes as d
on i.codigodeporte=d.codigo
where i.cuota='n';

select * from sociosdeudores;

























