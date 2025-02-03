-- Join con mas de tablas ,70

drop table if exists libros,socios,prestamos;


CREATE TABLE libros (
codigo INT UNSIGNED AUTO_INCREMENT,
titulo VARCHAR(40) NOT NULL,
autor VARCHAR(20) DEFAULT 'Desconocido',
PRIMARY KEY (codigo)
);

CREATE TABLE socios (
documento CHAR(8) NOT NULL,
nombre VARCHAR(30),
domicilio VARCHAR(30),
PRIMARY KEY (documento)
);

CREATE TABLE prestamos (
documento CHAR(8) NOT NULL,
codigolibro INT UNSIGNED,
fechaprestamo DATE NOT NULL,
fechadevolucion DATE,
PRIMARY KEY (codigolibro, fechaprestamo)
);


INSERT INTO socios VALUES ('22333444', 'Juan Perez', 'Colon 345');
INSERT INTO socios VALUES ('23333444', 'Luis Lopez', 'Caseros 940');
INSERT INTO socios VALUES ('25333444', 'Ana Herrero', 'Sucre 120');

INSERT INTO libros VALUES (1, 'Manual de 2º grado', 'Molina Manuel');
INSERT INTO libros VALUES (25, 'Aprenda PHP', 'Oscar Mendez');
INSERT INTO libros VALUES (42, 'Martin Fierro', 'Jose Hernandez');

INSERT INTO prestamos VALUES ('22333444', 1, '2016-08-10', '2016-08-12');
INSERT INTO prestamos VALUES ('22333444', 1, '2016-08-15', NULL);
INSERT INTO prestamos VALUES ('25333444', 25, '2016-08-10', '2016-08-13');
INSERT INTO prestamos VALUES ('25333444', 42, '2016-08-10', NULL);
INSERT INTO prestamos VALUES ('25333444', 25, '2016-08-15', NULL);
INSERT INTO prestamos VALUES ('30333444', 42, '2016-08-02', '2016-08-05');
INSERT INTO prestamos VALUES ('25333444', 2, '2016-08-02', '2016-08-05');


-- 
select * from libros;
select * from socios;
select * from prestamos;

-- Mostrar el nombreSocio , nombreLibro , FechaPrestamo , FechaDevolucion;

SELECT s.nombre,l.titulo,p.fechaprestamo,p.fechadevolucion
FROM prestamos as p
LEFT JOIN socios as s
ON p.documento = s.documento
LEFT JOIN libros as l 
ON p.codigolibro = l.codigo;


--
select nombre , titulo , fechaprestamo
from prestamos as p
join socios as s
on s.documento = p.documento
join libros as l
on codigolibro = codigo;

-- inner join
select s.nombre , l.titulo , p.fechaprestamo
from prestamos as p 
inner join socios s
on p.documento = s.documento
inner join libros as l
on p.codigolibro = l.codigo;

-- left join

select s.nombre , l.titulo , p.fechaprestamo
from prestamos as p 
left join socios s
on p.documento = s.documento
left join libros as l
on p.codigolibro = l.codigo;


--

 select nombre,titulo,fechaprestamo
  from prestamos as p
  left join socios as s
  on p.documento=s.documento
  join libros as l
  on p.codigolibro=l.codigo;
  
-- problemas - 1 - estructuras,socios,alquileres

drop table if exists peliculas, socios,alquileres;

CREATE TABLE peliculas (
codigo SMALLINT UNSIGNED AUTO_INCREMENT,
titulo VARCHAR(40) NOT NULL,
actores VARCHAR(40),
duracion TINYINT UNSIGNED,
PRIMARY KEY (codigo)
);

CREATE TABLE socios (
codigo SMALLINT UNSIGNED AUTO_INCREMENT,
documento CHAR(8),
nombre VARCHAR(30),
domicilio VARCHAR(30),
PRIMARY KEY (codigo)
);

CREATE TABLE alquileres (
codigopelicula SMALLINT UNSIGNED NOT NULL,
codigosocio SMALLINT UNSIGNED NOT NULL,
fechaprestamo DATE NOT NULL,
fechadevolucion DATE,
PRIMARY KEY (codigopelicula, fechaprestamo)
);

INSERT INTO peliculas (titulo, actores, duracion)
VALUES ('Elsa y Fred', 'China Zorrilla', 90);
INSERT INTO peliculas (titulo, actores, duracion)
VALUES ('Mision imposible', 'Tom Cruise', 120);
INSERT INTO peliculas (titulo, actores, duracion)
VALUES ('Mision imposible 2', 'Tom Cruise', 180);
INSERT INTO peliculas (titulo, actores, duracion)
VALUES ('Harry Potter y la piedra filosofal', 'Daniel H.', 120);
INSERT INTO peliculas (titulo, actores, duracion)
VALUES ('Harry Potter y la camara secreta', 'Daniel H.', 150);

INSERT INTO socios (documento, nombre)
VALUES ('22333444', 'Juan Lopez');
INSERT INTO socios (documento, nombre)
VALUES ('23333444', 'Diana Perez');
INSERT INTO socios (documento, nombre)
VALUES ('24333444', 'Luis Fuentes');

INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (1, 1, '2016-07-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (2, 1, '2016-07-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (3, 1, '2016-07-12');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (1, 2, '2016-08-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (3, 2, '2016-08-12');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (4, 2, '2016-08-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (1, 3, '2016-09-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (2, 3, '2016-08-02');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (3, 3, '2016-08-15');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (4, 3, '2016-08-22');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (4, 1, '2016-08-25');
INSERT INTO alquileres (codigopelicula, codigosocio, fechaprestamo)
VALUES (1, 3, '2016-08-25');



select * from peliculas;
select * from socios;
select * from alquileres;

-- inner join

-- nombrePelicula,nombreSocio ,fp,fd
Select p.titulo , s.nombre , a.fechaprestamo,a.fechadevolucion
from alquileres as a 
inner join peliculas as p
on a.codigopelicula = p.codigo
inner join socios as s
on a.codigosocio = s.codigo;


-- cantidad de peliculas
select p.titulo,count(*) as 'cantidad'
from peliculas as p
inner join alquileres as a
on p.codigo = a.codigopelicula
group by p.titulo;

-- cantidad de peliculas que alquilo cada socio
select s.nombre , count(a.codigopelicula) as 'Cantidad Alquiler'
FROM socios as s
inner join alquileres as a
on s.codigo = a.codigosocio
group by s.nombre;

-- cantidad de peliculas distintas que alquilo cada socio
select s.nombre,count(distinct a.codigopelicula) as 'cantidad diferente peliculas'
from socios as s
inner join alquileres as a
on s.codigo = a.codigosocio
group by s.nombre;

-- cantidad de peliculas alquialdas por mes por cada socio ordenado por mes
select s.nombre,monthname(a.fechaprestamo) as mes,
count(a.codigopelicula) as 'cantidadPeliculas'
from socios as s
inner join alquileres as a
on s.codigo = a.codigosocio
group by s.nombre,mes
order by mes;








-- PROB 2 , socios,deportes,inscriptos

drop table if exists socios,deportes,inscriptos;

CREATE TABLE socios (
documento CHAR(8) NOT NULL,
nombre VARCHAR(30) NOT NULL,
PRIMARY KEY (documento)
);

CREATE TABLE deportes (
codigo TINYINT UNSIGNED AUTO_INCREMENT,
nombre VARCHAR(30),
PRIMARY KEY (codigo)
);

CREATE TABLE inscriptos (
documento CHAR(8) NOT NULL,
codigodeporte TINYINT UNSIGNED,
año YEAR NOT NULL,
cuota CHAR(1), /* 's' o 'n', si está paga o no */
PRIMARY KEY (documento, codigodeporte, año)
);


INSERT INTO socios VALUES ('22333444', 'Juan Perez');
INSERT INTO socios VALUES ('23333444', 'Ana Garcia');
INSERT INTO socios VALUES ('24333444', 'Hector Fuentes');
INSERT INTO socios VALUES ('25333444', 'Marta Molina');

INSERT INTO deportes (nombre) VALUES ('tenis');
INSERT INTO deportes (nombre) VALUES ('natacion');
INSERT INTO deportes (nombre) VALUES ('basquet');
INSERT INTO deportes (nombre) VALUES ('voley');

INSERT INTO inscriptos VALUES ('22333444', 1, '2015', 's');
INSERT INTO inscriptos VALUES ('22333444', 1, '2016', 's');
INSERT INTO inscriptos VALUES ('22333444', 2, '2015', 's');
INSERT INTO inscriptos VALUES ('24333444', 1, '2015', 's');
INSERT INTO inscriptos VALUES ('24333444', 2, '2016', 's');
INSERT INTO inscriptos VALUES ('25333444', 1, '2015', 's');
INSERT INTO inscriptos VALUES ('25333444', 1, '2016', 's');
INSERT INTO inscriptos VALUES ('25333444', 3, '2016', 's');

select * from socios;
select * from deportes;
select * from inscriptos;

-- i.documento / i.codigodeporte/ i.año

select s.nombre,d.nombre,i.año ,i.cuota
from inscriptos as i
join socios as s
on i.documento = s.documento
join deportes as d
on i.codigodeporte = d.codigo;

-- nombre socios, nombre deportes , o no inscriptos

select s.nombre , d.nombre
from socios as s
left join inscriptos as i
on s.documento = i.documento
left join deportes as d
on d.codigo = i.codigodeporte;

select s.nombre, d.nombre
from inscriptos as i
left join socios as s
on i.documento = s.documento
left join deportes as d
on i.codigodeporte = d.codigo;

-- todos los deportes , nombre de los socios , 
select d.nombre , s.nombre
from deportes as d 
left join inscriptos as i
on i.codigodeporte = d.codigo
left join socios as s
on i.documento = s.documento;

-- cantidad de socios , por cada deporte
select count(i.codigodeporte) as 'cantidadSocios',d.nombre
from deportes as d
left join inscriptos as i
on d.codigo = i.codigodeporte 
left join socios as s
on s.documento = i.documento
group by d.nombre;

select count(i.codigodeporte),d.nombre
from inscriptos as i
right join deportes as d
on i.codigodeporte = d.codigo
left join socios as s
on i.documento = s.documento
group by d.nombre;

select * from inscriptos;
-- muestre los distintos socios inscriptos , en 2016
select distinct s.nombre
from inscriptos as i
join socios as s
on i.documento = s.documento
where año = '2016';


-- problema 3 , carreras,materias,inscriptos , left

drop table if exists carreras,materias,inscriptos;

CREATE TABLE carreras (
  codigo TINYINT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(30),
  PRIMARY KEY (codigo)
);

CREATE TABLE materias (
  codigo TINYINT UNSIGNED AUTO_INCREMENT,
  codigocarrera TINYINT UNSIGNED,
  nombre VARCHAR(30),
  profesor VARCHAR(30),
  PRIMARY KEY (codigo, codigocarrera)
);

CREATE TABLE inscriptos (
  documento CHAR(8) NOT NULL,
  codigocarrera TINYINT UNSIGNED,
  codigomateria TINYINT UNSIGNED,
  año YEAR,
  cuota CHAR(1), /* si está paga o no */
  PRIMARY KEY (documento, codigocarrera, codigomateria, año)
);

INSERT INTO carreras VALUES (1, 'Analista de sistemas');
INSERT INTO carreras VALUES (2, 'Diseñador web');

INSERT INTO materias VALUES (1, 1, 'Programacion I', 'Alfredo Lopez');
INSERT INTO materias VALUES (2, 1, 'Sistemas de datos I', 'Bernardo Garcia');
INSERT INTO materias VALUES (3, 1, 'Ingles tecnico', 'Edit Torres');
INSERT INTO materias VALUES (1, 2, 'Programacion basica', 'Alfredo Lopez');
INSERT INTO materias VALUES (2, 2, 'Ingles I', 'Edit Torres');
INSERT INTO materias VALUES (3, 2, 'Protocolos', 'Hector Juarez');

INSERT INTO inscriptos VALUES ('22333444', 1, 1, '2015', 's');
INSERT INTO inscriptos VALUES ('22333444', 1, 2, '2015', 's');
INSERT INTO inscriptos VALUES ('22333444', 1, 3, '2016', 'n');
INSERT INTO inscriptos VALUES ('23222222', 1, 1, '2015', 's');
INSERT INTO inscriptos VALUES ('23222222', 1, 2, '2016', 's');
INSERT INTO inscriptos VALUES ('24555666', 1, 1, '2015', 's');
INSERT INTO inscriptos VALUES ('24555666', 2, 1, '2015', 's');
INSERT INTO inscriptos VALUES ('25000999', 1, 1, '2015', 's');
INSERT INTO inscriptos VALUES ('25000999', 1, 2, '2015', 's');
INSERT INTO inscriptos VALUES ('25000999', 2, 1, '2016', 'n');
INSERT INTO inscriptos VALUES ('25000999', 2, 2, '2016', 's');


select * from carreras;
select * from materias;
select * from inscriptos;

-- seleccionar , de inscriptos , nombre de carrera , nombre de la materia y el anio codigo ,anio inscripto
-- c.nombre , m.nombre

select c.nombre , m.nombre , i.documento, i.año
from inscriptos as i
inner join carreras as c
on i.codigocarrera = c.codigo
inner join materias as m
on i.codigomateria = m.codigo;

-- nombre de las material , a que carrera pertenecen y el nombre del profesor que las dicta, ordenadas por carrera
select m.nombre , c.nombre , m.profesor
from inscriptos as i
inner join materias as m
on i.codigomateria = m.codigo
inner join carreras as c
on i.codigocarrera = c.codigo
order by c.nombre;

-- nombre de los profesores , cantidad de materias que dicta cada 1

select m.profesor ,count(*)
from materias as m
group by m.profesor;


-- datos tabla inscriptos , nombre de materias , nombre carrera , 

select i.documento,i.año,i.cuota,m.nombre,c.nombre
from inscriptos as i
inner join materias as m
on i.codigomateria = m.codigo
inner join carreras as c 
on i.codigocarrera = c.codigo
order by c.nombre , c.nombre;

-- muestre la cantidad de alumnos x profesor , 
select m.profesor , count(*)
from inscriptos as i
inner join carreras as c
on c.codigo = i.codigocarrera
inner join materias as m
on m.codigo = i.codigomateria and
m.codigocarrera = c.codigo
group by m.profesor;

select m.profesor , count(*)
from inscriptos as i
inner join carreras as c
on i.codigocarrera = c.codigo
inner join materias as m
on i.codigomateria = m.codigo and c.codigo = m.codigocarrera;

-- muestre cantiadde alumnos inscriptos en cada materia de cada carrera

select c.nombre,m.nombre,count(i.codigomateria)
from carreras as c
join materias as m
on c.codigo=m.codigocarrera
left join inscriptos as i
on m.codigo=i.codigomateria and
c.codigo=i.codigocarrera
group by c.nombre,m.nombre;

select c.nombre , m.nombre , count(i.codigomateria)
from carreras as c
inner join materias as m
on c.codigo = m.codigocarrera
left join inscriptos as i
on m.codigo = i.codigocarrera
and c.codigo = i.codigocarrera
group by c.nombre , m.nombre;

-- muestre el documento de los alumnos , cantidad de materias por carrera
select i.documento , c.nombre,count(i.codigomateria) as materias
from carreras as c
inner join materias as m
on c.codigo = m.codigocarrera
inner join inscriptos as i
on m.codigo = i.codigomateria 
and
c.codigo = i.codigocarrera
group by i.documento , c.nombre;

-- camtodad de alumnos distintos inscriptos en la institucion
select count(distinct documento)
from inscriptos;


-- muestra la cantidad de alumnos q no pagaron la cuota , por carrera y materia

select c.nombre , m.nombre , count(*)
from inscriptos as i
inner join carreras as c
on i.codigocarrera = c.codigo
inner join materias as m
on i.codigomateria = m.codigo
where i.cuota = 'n'
group by c.nombre, m.nombre;
