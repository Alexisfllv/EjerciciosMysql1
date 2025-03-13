-- Seguridad y permisos (GRANT, REVOKE, roles) 118

-- dar permiso a los usuarios a entrar a las bases de datos

-- crear usuarios limitados

CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED by 'clave123';

-- DAR PERMISO DE SOLO LEER la tabla clientes

grant select on SQLYA.clientes to 'usuario_lectura'@'localhost';

-- verificar

SHOW grants for 'usuario_lectura'@'localhost';

-- quitar los permisos 

revoke select on SQLYA.clientes  from 'usuario_lectura'@'localhost';

-- mas permisos

GRANT SELECT, INSERT, UPDATE, DELETE on SQLYA.clientes to 'usuario_lectura'@'localhost';

revoke SELECT, INSERT, UPDATE, DELETE on SQLYA.clientes from 'usuario_lectura'@'localhost';


-- dar todos los priviligos de una base de datos

GRANT ALL PRIVILEGES ON SQLYA.clientes TO 'usuario_lectura'@'localhost';


-- cambiar clave del usuario 1
ALTER USER 'usuario_lectura'@'localhost' IDENTIFIED BY '1234';

-- ver todos los usuarios

select user, host from mysql.user;
