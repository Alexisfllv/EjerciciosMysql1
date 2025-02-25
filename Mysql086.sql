-- Subconsultas como expresión 86

drop table if exists libros;

create table libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
);

insert into libros(titulo,autor,editorial,precio) 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
insert into libros(titulo,autor,editorial,precio)
values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
insert into libros(titulo,autor,editorial,precio)
values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
insert into libros(titulo,autor,editorial,precio)
values('El aleph','Borges','Emece',10.00);
insert into libros(titulo,autor,editorial,precio)
values('Ilusiones','Richard Bach','Planeta',15.00);
insert into libros(titulo,autor,editorial,precio)
values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
insert into libros(titulo,autor,editorial,precio)
values('Martin Fierro','Jose Hernandez','Planeta',20.00);
insert into libros(titulo,autor,editorial,precio)
values('Martin Fierro','Jose Hernandez','Emece',30.00);
insert into libros(titulo,autor,editorial,precio)
values('Uno','Richard Bach','Planeta',10.00);

select * from libros;

-- titulo precio , luego el maximo precio de la tabla - el precio

select titulo , precio,
precio - (select max(precio) from libros) as diferencia
from libros
where titulo = 'uno';

-- titulo, precio , libro mas caro
select titulo ,autor, precio
from libros
where precio = 
(select max(precio) from libros);

-- prob 1, alumnos

drop table if exists alumnos;

create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento)
);


insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

select * from alumnos;


-- obtener los datos de los alumnos con la nota mas alta , 
select documento,nombre,nota
from alumnos 
where
nota = (select max(nota)from alumnos);

-- alumnos que tinene una nota menor al promedio , su nota y la diferencia con el promedio
select documento ,nombre, nota, 
nota - (select avg(nota) from alumnos )
from alumnos
where nota < (select avg(nota) from alumnos );


select avg(nota) from alumnos;











