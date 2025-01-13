-- Tipos de datos set , 58

drop table if exists postulantes;


create table postulantes(
  numero int unsigned auto_increment,
  documento char(8),
  nombre varchar(30),
  idioma set('ingles','italiano','portuges'),
  primary key(numero)
 );
 
describe postulantes;
 
-- ingreso de datos

INSERT INTO postulantes (documento, nombre, idioma) 
VALUES ('12345678', 'Juan Perez', 'ingles');

INSERT INTO postulantes (documento, nombre, idioma) 
VALUES ('87654321', 'Maria Gomez', 'ingles,portuges');

INSERT INTO postulantes (documento, nombre, idioma) 
VALUES ('11223344', 'Carlos Ruiz', 'italiano,portuges');

INSERT INTO postulantes (documento, nombre, idioma) 
VALUES ('11223344', 'Carlos Ruiz', 'ingles,italiano,portuges');



select * from postulantes;


select * from postulantes
where idioma=2;

-- buscar de 2 valores


SELECT * FROM postulantes 
WHERE FIND_IN_SET('italiano', idioma) > 0 
AND FIND_IN_SET('portuges', idioma) > 0;

-- buscar de 3 valores

SELECT * FROM postulantes
WHERE FIND_IN_SET('ingles', idioma) > 0
  AND FIND_IN_SET('italiano', idioma) > 0
  AND FIND_IN_SET('portuges', idioma) > 0;
  
-- un solo valor
SELECT * FROM postulantes
WHERE idioma = 'ingles';


--

select * from postulantes
where idioma=7;


select * from postulantes
where idioma not like '%ingles%';


select * from postulantes
where not find_in_set('ingles',idioma)>0;
