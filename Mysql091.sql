-- Subconsulta simil autocombinación 91

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

-- lista de libros que han sido publicados
-- por disintas editoriales empleando una consulta correlacionada

select distinct l1.titulo
from libros as l1
where l1.titulo in
(select l2.titulo
from libros as l2
where l1.editorial <> l2.editorial);

select l2.titulo
from libros as l2
where l2.editorial <> l2.editorial;


-- usando join
select distinct l1.titulo
from libros as l1
join libros as l2
on l1.titulo = l2.titulo
where l1.editorial <> l2.editorial;

-- gruup by
select titulo
from libros
group by titulo
having count(distinct editorial) > 1;


-- buscamos todos los libros que tienen el mismo precio que 'El aleph'


select * from libros
where titulo<>'El aleph'
and
precio = 
(select precio
from libros
where 
titulo = 'El aleph');


select l2.precio
from libros as l2
where l2.titulo = 'El aleph';

select titulo
from libros
where titulo<>'El aleph' and
precio =
(select precio
from libros
where titulo='El aleph');

-- usando join

select l1.*
from libros as l1
inner join libros as l2
on l1.precio = l2.precio
where l2.titulo = 'El aleph'
and l1.titulo <> l2.titulo;


-- libros cuyo precio supere el precio promedio de los libros por editorial
select l1.titulo, l1.editorial , l1.precio
from libros as l1
where l1.precio >
(select avg(l2.precio)
from libros as l2
where l1.editorial = l2.editorial);

-- usando having

select l1.editorial , l1.titulo, l1.precio
from libros as l1
join libros as l2
on l1.editorial = l2.editorial
group by l1.editorial , l1.titulo, l1.precio
having l1.precio > avg(l2.precio);
