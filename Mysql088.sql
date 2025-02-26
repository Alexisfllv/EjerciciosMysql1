-- Subconsultas any - some - all 88

drop table if exists editoriales,libros;

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
precio decimal(5,2),
primary key(codigo)
);

insert into editoriales(nombre) values('Planeta');
insert into editoriales(nombre) values('Emece');
insert into editoriales(nombre) values('Paidos');
insert into editoriales(nombre) values('Siglo XXI');

insert into libros(titulo,autor,codigoeditorial,precio) values('Uno','Richard Bach',1,15);
insert into libros(titulo,autor,codigoeditorial,precio) values('Ilusiones','Richard Bach',4,18);
insert into libros(titulo,autor,codigoeditorial,precio) values('Puente al infinito','Richard Bach',2,20);
insert into libros(titulo,autor,codigoeditorial,precio) values('Aprenda PHP','Mario Molina',4,40);
insert into libros(titulo,autor,codigoeditorial,precio) values('El aleph','Borges',2,10);
insert into libros(titulo,autor,codigoeditorial,precio) values('Antología','Borges',1,20);
insert into libros(titulo,autor,codigoeditorial,precio) values('Cervantes y el quijote','Borges',3,25);

select * from editoriales;
select * from libros;

-- CODICION ANY = SI UNA DE ELLAS SE CUMPLE PASA COMO TRUE O LOS VALORES QUE PASEN

--  saber titulo de los libros con la condicion de %borges y = subconsulta
select titulo
from libros
where autor like '%Borges' and
codigoeditorial = any
(select e.codigo from editoriales as e
join libros as l 
on l.codigoeditorial = e.codigo
where l.autor like '%Bach%');

-- subconsulta , donde %Banch en comun con los codigos de libro
select e.codigo 
from editoriales as e
join libros as l
on l.codigoeditorial = e.codigo
where l.autor like '%Bach';


-- CONDICION ALL , SOLO SI TODAS LAS CONDICIONES SE CUMPLEN PASA COMO TRUE
select titulo
from libros
where autor like '%Borges' and
codigoeditorial = all
(select e.codigo from editoriales as e
join libros as l 
on l.codigoeditorial = e.codigo
where l.autor like '%Banch');


-- como el all no da true es como si no contara
select titulo
from libros
where autor like '%Borges';

-- any 

select titulo,precio
from libros
where autor like '%Borges' and
precio > any
(select precio
from libros
where autor like '%Bach');

-- 10,20,25 >{15,18,20}

select titulo,precio
from libros
where autor like '%Borges';

-- = 20,25


-- all
select titulo,precio
from libros
where autor like '%Borges' and
precio > all
(select precio
from libros
where autor like '%Bach');


-- prob 1 socios,inscriptos

drop table if exists socios,inscriptos;

create table socios(
numero int auto_increment,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas smallint,
primary key(numerosocio,deporte)
);


insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);


select * from socios;
select * from inscriptos;

-- numero de socio , el nombre del socio y el deporte en que esta inscripto

select s.numero ,s.nombre,i.deporte
from socios as s
inner join inscriptos as i
on s.numero = i.numerosocio;


-- muestre los socios que seran companeros en tenis y tambien en natacion

select nombre
from socios as s
inner join inscriptos as i
on s.numero = i.numerosocio
where deporte = 'natacion' 
and
numero = any
(select numerosocio from inscriptos as i
where deporte = 'tenis');


-- socios 1 se inscripto en algun deporte en el cual se haya inscripto el socio 2

select deporte
from inscriptos as i
where i.numerosocio = 1 and
deporte = any
(select deporte from inscriptos as i
where numerosocio = 2);

-- join 
select i1.deporte
from inscriptos as i1
join inscriptos as i2
on i1.deporte=i2.deporte
where i1.numerosocio=1 and
i2.numerosocio=2;


-- muestre los deportesen los caules el socio 2 pago mas cuotas que algun deporte en los que se inscribio el socio 1

select deporte
from inscriptos as i
where numerosocio =2 and
cuotas > any
(select cuotas from inscriptos where numerosocio = 1);


select deporte
from inscriptos as i
where numerosocio =2 and
cuotas > all
(select cuotas from inscriptos where numerosocio = 1);