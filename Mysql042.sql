-- index comun INDEX

drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo),
  index i_editorial (editorial)
 );
 
 
 show index from libros;
 
 
 
  create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo),
  index i_tituloeditorial (titulo,editorial)
 );
 
 -- problema 1 medicamentos

drop table if exists medicamentos;

create table medicamentos(
  codigo int unsigned auto_increment,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio decimal (6,2) unsigned,
  cantidad int unsigned,
  primary key(codigo),
  index i_laboratorio (laboratorio)
 );
 
show index from medicamentos;

-- demo agenda

drop table if exists agenda;

create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
  index i_apellido (apellido)
 );
 
 
 insert into agenda values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
 insert into agenda values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
 insert into agenda values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
 insert into agenda values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
 insert into agenda values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
 insert into agenda values('Ferreyra','Patricia','Colon 1534','4585858',null);
 insert into agenda values('Perez','Susana','San Martin 333',null,null);
 insert into agenda values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
 insert into agenda values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');
 
 show index from agenda;
 
 describe agenda;
 
 select * from agenda;


 
 