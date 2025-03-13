-- Manejo de Errores (HANDLER) 115

-- capturar erroes en procedimientos almacenados , sudo declare handler 
-- util para registrar errores en una tabla o evitar que un prod se detenga burscamente

-- captura errores al insertar usuario

drop table if exists usuarios,log_errores;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) UNIQUE
);

-- Crear tabla de errores
CREATE TABLE log_errores (
id INT AUTO_INCREMENT PRIMARY KEY,
mensaje TEXT,
fecha_hora DATETIME
);

-- prod manejo de errores


drop procedure if exists pa_insertar_usuario;

delimiter //
create procedure pa_insertar_usuario(
	in nombre varchar(50)
)
begin
	declare continue handler for SQLEXCEPTION
    begin
		insert into log_errores (mensaje,fecha_hora)
        values ('Error al insertar usuario', now());
	end;
    
    insert into usuarios (nombres) values (nombre);
end //
delimiter ;

select * from usuarios;
select * from log_errores;

call pa_insertar_usuario('Mango');

insert into  usuarios (nombre) values ('Alexis');

-- version un trigger  // no acepta usar Handler NO FUNCIONA CON TRIGGERS

drop table if exists usuarios_test,log_errores_test;

-- Tabla para registrar usuarios con restricción UNIQUE
CREATE TABLE usuarios_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);

-- Tabla para registrar errores de inserción
CREATE TABLE log_errores_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    fecha_hora DATETIME,
    detalle VARCHAR(50)
);

-- Primera inserción correcta
INSERT INTO usuarios_test (nombre) VALUES ('Alexis');

select * from usuarios_test;


-- trigger

drop trigger if exists tr_insert_usuarios_test;


DELIMITER //
CREATE TRIGGER tr_insert_usuarios_test
BEFORE INSERT ON usuarios_test
FOR EACH ROW
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar mensaje de error
        DECLARE error_mensaje TEXT;
        GET DIAGNOSTICS CONDITION 1 error_mensaje = MESSAGE_TEXT;

        -- Guardar en log_errores_test
        INSERT INTO log_errores_test (mensaje, fecha_hora, detalle)
        VALUES (error_mensaje, NOW(), NEW.nombre);
    END;
END //
DELIMITER ;


INSERT INTO usuarios_test (nombre) VALUES ('Alexis');

select * from log_errores_test;

select * from usuarios_test;


-- prod con handeler

DROP TABLE IF EXISTS usuarios_test, log_errores_test;

-- Crear la tabla de usuarios con restricción UNIQUE
CREATE TABLE usuarios_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);

-- Crear la tabla de log de errores
CREATE TABLE log_errores_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    fecha_hora DATETIME,
    detalle VARCHAR(50)
);

-- Procedimiento para insertar usuarios con manejo de errores
DROP PROCEDURE IF EXISTS pa_insertar_usuario;

DELIMITER //
CREATE PROCEDURE pa_insertar_usuario(IN nombre_usuario VARCHAR(50))
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Capturar mensaje de error
        INSERT INTO log_errores_test (mensaje, fecha_hora, detalle)
        VALUES ('Error: Usuario duplicado', NOW(), nombre_usuario);
    END;

    -- Intentar insertar el usuario
    INSERT INTO usuarios_test (nombre) VALUES (nombre_usuario);
END //
DELIMITER ;

-- Insertar datos
CALL pa_insertar_usuario('Alexis'); -- Inserción correcta
CALL pa_insertar_usuario('Carlos'); -- Inserción correcta
CALL pa_insertar_usuario('ss'); -- Error registrado en log_errores_test

-- Verificar datos
SELECT * FROM usuarios_test;
SELECT * FROM log_errores_test;





