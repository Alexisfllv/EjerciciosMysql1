-- Agregar y eliminar la clave primaria (alter table)

drop table if exists libros;

create table libros(
  codigo int unsigned,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned
 );
 
describe libros;

-- establecemos codigo como pk 
alter table libros
add primary key (codigo);

describe libros;

-- agegamos otra clave primaria
alter table libros
add primary key (titulo);

-- Si queremos que el campo clave sea "auto_increment" debemos modificarlo con:
alter table libros
modify codigo int unsigned ;

describe libros;

-- eliminar la pk 
alter table libros
drop primary key;

describe libros;


-- problemas 1 medicamentos

drop table if exists medicamentos;

create table medicamentos(
  codigo int unsigned not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio decimal(6,2) unsigned
);

describe medicamentos;

-- convertir codigo como pk

alter table medicamentos
add primary key (codigo);

describe medicamentos;

-- eliminar la pk
alter table medicamentos
drop primary key;

describe medicamentos;

-- convertir codigo pk y autoincrement

alter table medicamentos
modify codigo int not null auto_increment;

describe medicamentos;

-- una pk es : NOT NULL , AUTO_INCREMENT , 