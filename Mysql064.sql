-- Varias tablas (left join) 64

drop table if exists libros, editoriales;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  cantidad tinyint unsigned default 0,
  primary key (codigo)
 );
 
 
create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  primary key(codigo)
 );
 
 
describe libros;

describe editoriales;

-- insert 
insert into editoriales (nombre) values('Paidos');
insert into editoriales (nombre) values('Emece');
insert into editoriales (nombre) values('Planeta');
insert into editoriales (nombre) values('Sudamericana');


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
  values('Cervantes y el quijote','Borges- Bioy Casares',3,25.5,250);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Aprenda Java en 10 minutos','Lopez Juan',5,28,100);
  
  
--  

select * from libros;

select * from editoriales;

-- listar libros y su editoriales , con o sin relaciones

select l.codigo,l.titulo,l.autor,l.codigoeditorial,l.precio,l.cantidad,e.nombre
from libros as l
left join editoriales as e
on l.codigoeditorial = e.codigo;


--
select * from editoriales
left join libros
on editoriales.codigo=libros.codigoeditorial;


select * from libros
left join editoriales
on editoriales.codigo=libros.codigoeditorial;

-- codicion not null. , encontrar quien tenga un codigoeditorial que no existe o null

select l.codigo,l.titulo,l.autor,l.codigoeditorial,l.precio,l.cantidad,e.nombre
from libros as l
left join editoriales as e
on l.codigoeditorial = e.codigo
where e.codigo is null;


-- problemas 1  , clientes , provincias

drop table if exists clientes , provincias;


create table clientes (
codigo int unsigned auto_increment,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
codigoProvincia tinyint unsigned,
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
  
  
-- select

select * from provincias;

select * from clientes;

-- pronvicias que no tienen clientes

select p.nombre,p.codigo,c.codigoProvincia
from provincias as p
left join clientes as c
on p.codigo = c.codigoProvincia
where c.codigoProvincia is null;

-- provincias que hay pero que no tienen clientes repetida y not null

select distinct p.codigo,p.nombre from provincias as p
  left join clientes as c
  on c.codigoProvincia=p.codigo
  where c.codigoprovincia is not null;

--

 select distinct p.codigo,p.nombre from provincias as p
  left join clientes as c
  on c.codigoProvincia=p.codigo
  where c.codigoprovincia is not null;

-- problema 2 , tabla socios , inscriptos

drop table if exists socios, inscriptos;

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


describe socios;

describe inscriptos;

insert into socios values('22333444','Juan Perez','Colon 234');
insert into socios values('23333444','Maria Lopez','Sarmiento 465');
insert into socios values('24333444','Antonio Juarez','Caseros 980');
insert into socios values('25333444','Ana Juarez','Sucre 134');
insert into socios values('26333444','Sofia Herrero','Avellaneda 1234');


insert into inscriptos values ('22333444','natacion','2015','s');
insert into inscriptos values ('22333444','natacion','2016','n');
insert into inscriptos values ('23333444','natacion','2015','s');
insert into inscriptos values ('23333444','tenis','2016','s');
insert into inscriptos values ('23333444','natacion','2016','s');
insert into inscriptos values ('25333444','tenis','2016','n');
insert into inscriptos values ('25333444','basquet','2016','n');


--
select * from socios;

select * from inscriptos;


-- Muestre el nombre del socio, deporte y año realizando un join:

select s.nombre,i.deporte,i.año
from socios as s 
left join inscriptos as i
on s.documento = i.documento;

-- ver
select s.nombre,i.deporte,i.año
from socios as s
left join inscriptos as i
on s.documento=i.documento;

-- ver

select s.nombre
  from socios as s
  left join inscriptos as i
  on s.documento=i.documento
  where i.documento is null;

-- premios , numerosrifa

drop table if exists premios,numerosrifa;


 create table premios(
  posicion tinyint unsigned auto_increment,
  premio varchar(40),
  numeroganador tinyint unsigned,
  primary key(posicion)
 );
 
 create table numerosrifa(
  numero tinyint unsigned not null,
  documento char(8) not null,
  primary key(numero)
 );

 insert into premios values(1,'PC I7',205);
 insert into premios values(2,'Televisor 75 pulgadas',29);
 insert into premios values(3,'Microondas',5);
 insert into premios values(4,'Multiprocesadora',15);
 insert into premios values(5,'Cafetera',33);

 insert into numerosrifa values(205,'22333444');
 insert into numerosrifa values(200,'23333444');
 insert into numerosrifa values(5,'23333444');
 insert into numerosrifa values(8,'23333444');
 insert into numerosrifa values(1,'24333444');
 insert into numerosrifa values(109,'28333444');
 insert into numerosrifa values(15,'30333444');
 insert into numerosrifa values(29,'29333444');
 insert into numerosrifa values(28,'32333444');

--
select nr.numero,p.posicion,p.premio
  from numerosrifa as nr
  left join premios as p
  on p.numeroganador=nr.numero;

select nr.numero,p.posicion,p.premio
  from numerosrifa as nr
  left join premios as p
  on p.numeroganador=nr.numero
  where p.numeroganador is not null;
  
select nr.numero,p.posicion,p.premio
  from premios as p
  left join numerosrifa as nr
  on p.numeroganador=nr.numero;
  
select nr.numero,p.posicion,p.premio
  from premios as p
  left join numerosrifa as nr
  on p.numeroganador=nr.numero
  where nr.numero is not null;