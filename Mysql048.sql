-- REPLACE  , reemplazar un registros 48

drop table if exists libros;

create table libros(
  codigo int unsigned default 0,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );
 
insert into libros 
   values (10,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',15.4);
insert into libros 
   values (15,'Aprenda PHP','Mario Molina','Planeta',45.8);
insert into libros values (23,'El aleph','Borges','Planeta',23.0);


select * from libros;

-- replace
replace into libros values
(10,'Alice','lewis','Em',15);


-- sin agregar el codigo
replace into libros(titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',28);

--   con un codigo que no existe
replace into libros values(30,'Matematica estas ahi','Paenza','Paidos',12.8);

-- Quitemos la clave primaria:
alter table libros drop primary key;

-- Ingresamos un registro con valor de código repetido usando "replace":
replace into libros values(10,'Jarry Potter ya la piedra filosofal','Hawking','Emece',48);



-- Problemas , alumnos

drop table if exists alumnos;


create table alumnos(
  legajo int(10) unsigned auto_increment,
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  primary key(legajo),
  unique i_documento (documento)
 );

describe alumnos;

insert into alumnos values('1353','Juan Lopez','22333444','Colon 123');
insert into alumnos values('2345','Ana Acosta','24000555','Caseros 456');
insert into alumnos values('2356','Jose Torres','26888777','Sucre 312');
insert into alumnos values('3567','Luis Perez','28020020','Rivadavia 234');

select * from alumnos;

-- reemplazar el primer registro , sin cambiar los datos unicos , pk. unique

replace into alumnos
values (1353,'alexis','22333444','Lima 321');

