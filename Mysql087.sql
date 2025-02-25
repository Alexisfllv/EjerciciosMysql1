-- Subconsultas con in 87

drop table if exists editoriales;
drop table if exists libros;


create table editoriales(
codigo int auto_increment,
nombre varchar(30),
primary key (codigo)
);
 
create table libros (
codigo int auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial smallint,
primary key(codigo)
);

insert into editoriales(nombre) values('Planeta');
insert into editoriales(nombre) values('Emece');
insert into editoriales(nombre) values('Paidos');
insert into editoriales(nombre) values('Siglo XXI');

insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);

select * from libros;
select * from editoriales;


-- nombre de las editoriales que han purblicado libros del autor richar bach

select nombre
from editoriales
where codigo in
(select codigoeditorial
from libros
where autor = 'Richard Bach');

-- probamos la subconsulta separada dela consulta exterior para verificar que retorna un lista de valores de un campo

select codigoeditorial
from libros
where autor='Richard Bach';

--

select distinct nombre
from editoriales as e
join libros
on codigoeditorial=e.codigo
where autor='Richard Bach';

-- editoriales que no han publicado libros de Richard Bech

select nombre
from editoriales
where codigo not in
(select codigoeditorial
from libros
where autor = 'Richard Bach');
