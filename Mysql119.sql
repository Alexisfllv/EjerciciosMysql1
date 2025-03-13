--  Backup y recuperación (mysqldump, import/export) 119

-- base de datos nueva

create database prueba_backup;

use prueba_backup;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);

INSERT INTO usuarios (nombre) VALUES ('Alexis'), ('Bruno'), ('Carlos');

select * from usuarios;

-- borrar toda la tabla usuarios;

drop table usuarios;

select * from usuarios;




-- hacer copia , mysqldump -u rooy -p prueba_backup > backup.sql


-- crear una nueva base de datos para restaurar ahi

create database prueba_restaurada;

--
use prueba_restaurada;


show tables;

select * from usuarios;
