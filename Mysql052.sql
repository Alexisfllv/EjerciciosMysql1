-- cambiar nombre del campo de una tabla , alter table change

drop table if exists libros;


CREATE TABLE libros (
    codigo INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(30),
    autor VARCHAR(30),
    editorial VARCHAR(20),
    costo DECIMAL(5 , 2 ) UNSIGNED,
    cantidad INT UNSIGNED,
    PRIMARY KEY (codigo)
);
 

describe libros;


-- cambiar nombre de costo a precio
alter table libros
change costo precio decimal (5,2);

describe libros;

-- cambiar nombre de codigo a clave

alter table libros
change codigo clave int;

describe libros;

alter table libros
modify clave int unsigned auto_increment;

describe libros;


-- problema 1 , articulos

drop table if exists articulos;


CREATE TABLE articulos (
    codigo INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(30),
    precio DECIMAL(4 , 2 ) UNSIGNED,
    PRIMARY KEY (codigo)
);
 
 
  insert into articulos (nombre,descripcion,precio)
  values('escuadra','plastico 20 cm.',3.50);
 insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Faber x12',4.50);
 insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Faber x24',7.50);
 insert into articulos (nombre,descripcion,precio)
  values('regla','30 cm.',2.50);
 insert into articulos (nombre,descripcion,precio)
  values('fibras','Faber x12',10.30);
 insert into articulos (nombre,descripcion,precio)
  values('fibras','Faber x6',5.10);
  
select * from articulos;


describe articulos;


-- cambiar precio a preciopormayor
alter table articulos
change preciopormenor preciopormayor decimal(4,2) unsigned not null;


describe articulos;

-- agregar preciopormenor

alter table articulos
add preciopormenor decimal(4,2) unsigned not null;

describe articulos;

select * from articulos;

-- modificar el valor de precio por menor

UPDATE articulos
SET preciopormenor = preciopormayor + (preciopormayor * 0.10);

select * from articulos;

-- problema 2 peliculas

drop table if exists peliculas;

create table peliculas(
  codigo int unsigned,
  nombre varchar(40) not null,
  actor varchar(20),
  director varchar(25),
  duracion tinyint unsigned
 );
 
 describe peliculas;
 
 -- cambiar nombre de actor por protagonista para que permita valores nulos
 
alter table peliculas
change actor protagonista varchar(20);

describe peliculas;

-- cambiar nombre por titulo sin alterar los demas atributos

alter table peliculas
change nombre titulo varchar(40) not null;

describe peliculas;

-- cambiar duracion por minutos

alter table peliculas
change duracion minutos tinyint unsigned;

describe peliculas;

  
  
