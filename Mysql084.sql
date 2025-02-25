--  Encriptación de datos (aes_encrypt - aes_decrypt) 84

drop table if exists clientes;

create table clientes(
nombre varchar(50),
mail varchar(70),
tarjetacredito blob,
primary key (nombre)
);

describe clientes;


insert into clientes 
values ('Marcos Luis','marcosluis@gmail.com',aes_encrypt('5390700823285988','xyz123'));
insert into clientes 
values ('Ganzalez Ana','gonzalesa@gmail.com',aes_encrypt('4567230823285445','xyz123'));
insert into clientes 
values ('Lopez German','lopezg@yahoo.com',aes_encrypt('7840704453285443','xyz123'));
insert into clientes 
values ('Alexis','alexis@yahoo.com',aes_encrypt('23232323232323232323','alexis'));


select * from clientes;


select tarjetacredito from clientes;


-- descifrar
select cast(aes_decrypt(tarjetacredito, 'xyz123') as char) from clientes;

-- decifrar por clave secreta
select cast(aes_decrypt(tarjetacredito, 'alexis') as char) from clientes;