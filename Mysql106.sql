-- Procedimientos almacenados (estructuras repetitivas) 106

drop table if exists productos;

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10,2)
);


INSERT INTO productos (nombre, precio) VALUES
('Laptop', 1500.00),
('Mouse', 50.00),
('Teclado', 80.00);

select * from productos;

-- 

drop procedure if exists pa_generar_dos_aleatorios;

delimiter //
create procedure pa_generar_dos_aleatorios(
	out valor1 int , 
	out valor2 int
)
begin
	set valor1 = 0;
	set valor2 = 0;

	while valor1 = valor2 do
		set valor1 = rand()*10;
		set valor2 = rand()*10;
end while;

end //
delimiter ;

call pa_generar_dos_aleatorios(@valor1, @valor2);
select @valor1,@valor2;



-- prob 2 , 

drop procedure if exists pa_generar_dos_aleatorios;

delimiter //
create procedure pa_generar_dos_aleatorios(
	out valor1 int,
    out valor2 int
)
begin
  etiqueta1:loop
    set valor1=rand()*10;
    set valor2=rand()*10;
    if valor1<>valor2 then
      leave etiqueta1;
    end if;
  end loop;
end //
delimiter ;


call pa_generar_dos_aleatorios(@v1,@v2);

select @v1,@v2;



