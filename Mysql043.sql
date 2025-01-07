-- INDICE UNICO unique

drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  unique i_codigo(codigo),
  unique i_tituloeditorial (titulo,editorial)
 );
 
 describe libros;
 
 show index from libros;
 
 -- problemas 

drop table if exists alumno;

create table alumno(
anio date,
numero int unsigned not null,
nombre varchar(30),
documento char(30),
ciudad varchar(20),
provincia varchar(20),
primary key(anio,numero),
unique i_documento (documento),
index i_ciudadprovincia (ciudad,provincia)
);

describe alumno;

show index from alumno;

select * from alumno;

INSERT INTO alumno (anio, numero, nombre, documento, ciudad, provincia) 
VALUES 
('2023-01-01', 1, 'Juan Pérez', '12345678', 'Lima', 'Lima'),
('2023-01-02', 2, 'Ana Gómez', '23456789', 'Arequipa', 'Arequipa'),
('2023-01-03', 3, 'Carlos Ruiz', '34567890', 'Cusco', 'Cusco'),
('2023-01-04', 4, 'María López', '45678901', 'Trujillo', 'La Libertad'),
('2023-01-05', 5, 'Luis Rodríguez', '56789012', 'Piura', 'Piura');

select * from alumno;

-- los valores no pueden repetirse
-- primary key(anio,numero),
-- unique i_documento (documento),
-- index i_ciudadprovincia (ciudad,provincia)

