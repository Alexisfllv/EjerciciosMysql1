-- tipos de datos blob text

drop table if exists peliculas;

create table peliculas(
  codigo int unsigned auto_increment,
  nombre varchar(40),
  actor varchar(30),
  duracion tinyint unsigned,
  sinopsis text,
  primary key (codigo)  
 );


describe peliculas;


insert into peliculas values(1,'Mentes que brillan','Jodie Foster',120,
 'El no entiende al mundo ni el  mundo lo entiende a él, es un niño superdotado. La escuela 
especial a la que asiste tampoco resuelve los problemas del niño. Su madre hará todo lo que esté a 
su alcance para ayudarlo. Drama');

select * from peliculas;


insert into peliculas values(2,'Charlie y la fábrica de chocolate','J. Deep',120, 'Un niño llamado 
Charlie tiene la ilusión de encontrar uno de los 5 tickets del concurso para entrar a la fabulosa 
fábrica de chocolates del excéntrico Willy Wonka y descubrir el misterio de sus golosinas. 
Aventuras'); 

insert into peliculas values(3,'La terminal','Tom Hanks',180, 'Sin papeles y esperando que el 
gobierno resuelva su situación migratoria, Victor convierte el aeropuerto de Nueva York en su 
nuevo hogar trasformando la vida de los empleados del lugar. Drama'); 

select * from peliculas;


--
select * from peliculas
where sinopsis like '%Drama%';

select * from peliculas
where sinopsis like '%chocolates%';



-- Problemas inmuebles

drop table if exists inmuebles;


create table inmuebles(
  codigo int unsigned auto_increment,
  domicilio varchar(30),
  barrio varchar(20),
  detalles text,
  primary key(codigo)
 );
 
describe inmuebles;
 
 
insert into inmuebles values(1,'Colon 123','Centro','patio, 3 dormitorios, garage doble, pileta, asador, living, cocina, comedor, escritorio, 2 baños');
insert into inmuebles values(2,'Caseros 345','Centro','patio, 2 dormitorios, cocina- comedor, living');
insert into inmuebles values(3,'Sucre 346','Alberdi','2 dormitorios, problemas de humedad');
insert into inmuebles values(4,'Sarmiento 832','Gral. Paz','3 dormitorios, garage, 2 patios');
insert into inmuebles values(5,'Avellaneda 384','Centro',' 2 patios, 2 dormitorios, garage'); 


select * from inmuebles;
 
 
select * from inmuebles
where detalles like '%patio%';


-- 
drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  temas blob,
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );
 
describe libros;

insert into libros values
(1,'Aprenda PHP','Mario Molina','Emece','Instalacion de PHP.Palabras reservadas.Sentencias basicas.Definicion de variables.',45.6);


insert into libros values(2,'Java en 10 minutos','Mario Molina','Planeta',
 'Instalacion de Java en Windows.
  Instalacion de Java en Linux.
  Palabras reservadas.
  Sentencias basicas.
  Definir variables.',
 55);
 
 
insert into libros values(3,'PHP desde cero','Joaquin Perez','Planeta',
 'Instalacion de PHP.
  Instrucciones basicas.
  Definición de variables.',
 50);

select * from libros;

-- convertir el dato blob
SELECT CAST(temas AS CHAR) AS temas_legibles FROM libros;


select * from libros
where titulo like '%PHP%' and
temas like '%variables%';


select * from libros
where titulo like '%Java%' and
temas like '%Instalacion%' or '%Instalar%';

