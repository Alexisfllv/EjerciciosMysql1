-- Alter table modify 51

drop table if exists libros;

create table libros(
  codigo int unsigned,
  titulo varchar(30) not null,
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  cantidad int unsigned
 );
 
describe libros;

-- modificar campo cantidad 
alter table libros
modify cantidad smallint unsigned;

describe libros;

-- modificar campo titulo
alter table libros
modify titulo varchar(40) not null;

describe libros;


insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Planeta',23.5,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Emece',25,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El gato con botas',null,'Emece',10,500);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Martin Fierro','Jose Hernandez','Planeta',150,200);

select * from libros; 

-- modificar autor

alter table libros
  modify autor varchar(10);
  
alter table libros
modify precio decimal(4,2);

alter table libros
  modify codigo int unsigned auto_increment;
  
  
-- problemas peliculas


drop table if exists peliculas;

create table peliculas(
  codigo int unsigned,
  nombre varchar(20) not null,
  actor varchar(20),
  director varchar(25),
  duracion tinyint
 );
 
-- modificar campo duracion

alter table peliculas
modify duracion smallint unsigned;
 
describe peliculas;

-- modifcar campo nombre a longitud 40 6 no nulos

alter table peliculas
modify nombre varchar(40) not null;

describe peliculas;

-- modificar campo actor para que no permita campos nulos

alter table peliculas
modify actor varchar(20) not null; 

describe peliculas;

-- modificar campo codigo como auto increment

alter table peliculas 
modify codigo int unsigned auto_increment primary key;

describe peliculas; 

-- problema 2 articulos

drop table if exists articulos;

create table articulos(
  codigo int unsigned,
  nombre varchar(25) not null,
  descripcion varchar(30),
  precio decimal(4,2) unsigned,
  cantidad tinyint,
  primary key(codigo)
 );
 

describe articulos;

--  modificar campo precio para que guarde valores  de hasta 9999.99

alter table articulos
modify precio decimal(6,2);


-- agregar auto incremnet al campo codigo
alter table articulos
modify codigo int unsigned auto_increment primary key ;
 
describe articulos;


ALTER TABLE articulos
MODIFY codigo INT UNSIGNED;

describe articulos; 


ALTER TABLE articulos
DROP PRIMARY KEY;

describe articulos;

-- modificar para que no permita valores negativos cantidad
alter table articulos
modify cantidad smallint unsigned;

describe articulos;


 
 
 
 
 
 
 
