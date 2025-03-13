-- Disparadores (triggers) 110

drop table if exists pedido,historial;

CREATE TABLE pedido (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(100),
cantidad INT
);

CREATE TABLE historial (
id INT AUTO_INCREMENT PRIMARY KEY,
fecha_hora DATETIME,
accion VARCHAR(50),
nombre_producto VARCHAR(100)
);


-- trigger bofore antes de insert

drop trigger if exists t_before_insert_pedido;

delimiter //
create trigger t_before_insert_pedido
before insert on pedido
for each row
begin
	insert into historial(fecha_hora,accion,nombre_producto)
    VALUES (NOW(), 'Intento de inserción', NEW.nombre_producto);
END //

delimiter ;


-- trigger para ejecutarse luego de eliminar un pedido

drop trigger if exists t_after_delete_pedido;

delimiter //
create trigger t_after_delete_pedido
after delete on pedido
for each row
begin
	insert into historial (fecha_hora,accion,nombre_producto)
	values (now(),'Pedido Eliminado',OLD.nombre_producto);
end //
delimiter ;


INSERT INTO pedido (nombre_producto, cantidad) VALUES ('Laptop', 2);

delete from pedido where id = 1;

-- trigger update para modificar un pedido

drop trigger if exists t_after_update_pedido;

delimiter //
create trigger t_after_update_pedido
after update on pedido
for each row
begin
	insert into historial (fecha_hora, accion,nombre_producto)
    values (now(),concat('Pedido actualizado : ', old.nombre_producto,' → ', new.nombre_producto),
    new.nombre_producto);
end //
delimiter ;

update pedido set nombre_producto = 'Mackbook' WHERE id = 3;

select * from pedido;
select * from historial














