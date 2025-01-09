-- alter table , add 49

drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );
 
 describe libros;
 
 -- agregar campo cantidad
 alter table libros
 add cantidad smallint unsigned not null;
 
-- agregar campo edicion

alter table libros
  add edicion date;

describe libros;

-- agregar campo precio

alter table libros
  add precio2 int;
  
describe libros;


-- problemas 1 ,tabla peliculas

drop table if exists peliculas;

create table peliculas(
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  actor varchar(20),
  primary key(codigo)
 );

describe peliculas;

-- agregar campo duracion

alter table peliculas
add duracion tinyint;

describe peliculas;

-- agregar campo director

alter table peliculas
add director varchar(20);

describe peliculas;

-- problema 2 tabla articulos

drop table if exists articulos;


create table articulos(
  codigo int unsigned auto_increment,
  nombre varchar(20) not null,
  descripcion varchar(30),
  precio decimal(4,2) unsigned,
  primary key(codigo)
 );
 
  insert into articulos (nombre,descripcion,precio)
  values('escuadra','plastico 20 cm.',3.50);
 insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Join x12',4.50);
 insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Join x24',7.50);
 insert into articulos (nombre,descripcion,precio)
  values('regla','30 cm.',2.50);
 insert into articulos (nombre,descripcion,precio)
  values('fibras','Join x12',10.30);
 insert into articulos (nombre,descripcion,precio)
  values('fibras','Join x6',5.10);

-- agregar campo precio menor 

alter table articulos
add preciomenor decimal(4,2) unsigned;

describe articulos;

select * from articulos;

-- actualiazar campo preciomenor

update articulos set preciomenor = precio + (precio*0.10);

select * from articulos;

-- cambiar safe mode

SHOW VARIABLES LIKE 'sql_safe_updates';

SET SQL_SAFE_UPDATES = 0;

