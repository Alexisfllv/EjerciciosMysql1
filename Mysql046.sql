-- Clausula Limit comando select 46


drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );
 
describe libros;

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);

select * from libros;



-- recuperar 4 libros desde el registro cero:
select * from libros limit 0,4;

-- recuperar 3 libros desde el registro 2
select * from libros limit 2,3;

-- recupear solo 5 registros desde el principio
select * from libros limit 5;

-- LIMIT (principio,cantidad)

-- eliminar los 2 registros con precio mas bajo
delete from libros
order by precio
limit 2;

-- sin contar null
DELETE FROM libros
WHERE precio IS NOT NULL
ORDER BY precio
LIMIT 2;

select * from libros 
where precio is not null
order by precio
limit 2;

--
insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);

select * from libros
  where titulo='El aleph' and
  autor='Borges' and
  editorial='Planeta';

delete from libros
  where titulo='El aleph' and
  autor='Borges' and
  editorial='Planeta'
  limit 2;
  
  
select * from libros
limit 0,4;


-- problemas 1 peliculas

drop table if exists peliculas;

create table peliculas(
codigo int unsigned auto_increment,
titulo varchar (30) not null,
actor varchar(20),
duracion int unsigned check (duracion <= 200),
primary key (codigo)
);

INSERT INTO peliculas VALUES
(NULL, 'La caza', 'Bruce Willis', 120),
(NULL, 'El viaje', 'Tom Hanks', 135),
(NULL, 'Vuelven los héroes', 'Will Smith', 150),
(NULL, 'La última esperanza', 'Denzel Washington', 140),
(NULL, 'El regreso', 'Matt Damon', 125),
(NULL, 'Tierra prometida', 'Leonardo DiCaprio', 180),
(NULL, 'Sueños rotos', 'Morgan Freeman', 110),
(NULL, 'La sombra del pasado', 'Johnny Depp', 100),
(NULL, 'Misterio en la ciudad', 'Daniel Craig', 115),
(NULL, 'El guardián del bosque', 'Chris Hemsworth', 160);

select * from peliculas;

-- mostrar 5 registros

select * from peliculas
limit 0,5;

-- mostrar 8 registros con un solo argumento
select * from peliculas
limit 8;

-- mosrar 3 registros apartir del 4

select * from peliculas
limit 4,3;

-- mostrar todos los regstros que comiencen desde el 2

select * from peliculas
limit 2,99999;

-- problema 2 agenda

drop table if exists agenda;

create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
  index i_apellido (apellido)
 );
 
 INSERT INTO agenda (apellido, nombre, domicilio, telefono, mail) VALUES
('Gomez', 'Juan', 'Calle Falsa 123', '5551234567', 'juan.gomez@email.com'),
('Lopez', 'Maria', 'Av. Siempre Viva 456', '5552345678', 'maria.lopez@email.com'),
('Perez', 'Carlos', 'Calle 7 789', '5553456789', 'carlos.perez@email.com'),
('Sanchez', 'Ana', 'Calle Real 101', '5554567890', 'ana.sanchez@email.com'),
('Diaz', 'Luis', 'Av. Libertador 202', '5555678901', 'luis.diaz@email.com'),
('Martinez', 'Laura', 'Calle Luna 303', '5556789012', 'laura.martinez@email.com'),
('Garcia', 'Pedro', 'Calle Sol 404', '5557890123', 'pedro.garcia@email.com'),
('Hernandez', 'Elena', 'Calle Estrella 505', '5558901234', 'elena.hernandez@email.com'),
('Morales', 'Miguel', 'Av. Centenario 606', '5559012345', 'miguel.morales@email.com'),
('Fernandez', 'Lucia', 'Calle Esperanza 707', '5550123456', 'lucia.fernandez@email.com');


-- Realice una consulta limitando la salida a sólo 3 registros.

select * from agenda
limit 3;


-- muestre los registro desde 0 al 9 con un solo argumento

select * from agenda
limit 9;


-- muestre los 5 registros a partir del 5

select * from agenda
limit 5,5;


-- muestre los registros a partir del 7 hasta el final

select * from agenda
limit 7,9999;