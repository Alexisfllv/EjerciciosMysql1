-- Variables de usuario 72


drop table if exists libros, editoriales;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(20),
codigoeditorial tinyint unsigned,
precio decimal(5,2) unsigned,
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

insert into libros values (1,'El aleph','Borges',2,23);
insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,15);
insert into libros values (3,'Matematica estas ahi','Paenza',2,12);
insert into libros values (4,'Martin Fierro','Jose Hernandez',3,34);
insert into libros values (5,'Martin Fierro','Jose Hernandez',2,55);
insert into libros values (6,'Aprenda PHP','Molina Mario',1,45);
insert into libros values (7,'Java en 10 minutos','Molina Mario',3,42);

-- guardar el resultado en una variable , precio mas alto

select
@mayorprecio:= max(precio) as 'maximo'
from libros;

SELECT precio FROM libros WHERE precio = @mayorprecio;

select * from libros;

select * from libros
where precio=@mayorprecio;

-- ver todas las variables en la sesion
SELECT * FROM performance_schema.user_variables_by_thread;

-- variable join,nombre de editorial

select l.titulo , l.autor, e.nombre
from libros as l
inner join editoriales as e
on l.codigoeditorial = e.codigo
where l.precio = @mayorprecio;


-- 
select @editorial := e.nombre
from libros as l
inner join editoriales as e
on l.codigoeditorial = e.codigo
where precio = @mayorprecio;


select @editorial from editoriales;

select l.titulo,l.autor,e.nombre
from libros as l
join editoriales as e
on l.codigoeditorial=e.codigo
where e.nombre=@editorial;


-- problemas 1 , peliculas

drop table if exists peliculas;

create table peliculas (
codigo smallint unsigned auto_increment,
titulo varchar(40) not null,
actor varchar(30),
duracion tinyint unsigned,
primary key (codigo)
);


insert into peliculas (titulo,actor,duracion)
values('Elsa y Fred','China Zorrilla',90);
insert into peliculas (titulo,actor,duracion)
values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
values('Mision imposible 2','Tom Cruise',180);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la piedra filosofal','Daniel H.',120);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la camara secreta','Daniel H.',150);

select @mayorduracion:=max(duracion), 
@menorduracion:= min(duracion) 
from peliculas;


-- mostrar datos de ambas peliculas
select * from peliculas
where duracion=@mayorduracion or
duracion=@menorduracion;

-- mayor pelicula duracion
select @actor:=actor
from peliculas
where duracion=@mayorduracion;


select * from peliculas 
where actor=@actor;
