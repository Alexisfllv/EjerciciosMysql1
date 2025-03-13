-- Cursores Cursor 114


-- recorre una consulta de forma secuencial , detalla lo que hace un select

-- tabla productos

drop table if exists productos;

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)
);

select * from productos;

insert into productos (nombre) values
('Laptop'),('Mouse'),('Teclado');

SELECT * from productos;

-- procedimiento cursor

drop procedure if exists pa_listar_productos;

delimiter //
create procedure pa_listar_productos()
begin
	declare done int default false;
    declare nombre_producto varchar(100);
    declare cur cursor for select nombre from productos;
    declare continue handler for not found set done = true;
    
    open cur;
    
    read_loop : loop
		fetch cur into nombre_producto;
        if done then
			leave read_loop;
		end if;
        
        select nombre_producto;
	end loop;
    close cur;
end //
delimiter ;

call pa_listar_productos();
