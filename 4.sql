use museo;
SHOW columns FROM obra ;
SHOW columns FROM exposicion ;

SELECT * FROM obra ;
SELECT * FROM exposicion ;

use prueba;
create table documento(
idDoc int PRIMARY key not null AUTO_INCREMENT,
nombreDoc varchar(50) not null,
nomCorto VARCHAR(2) not null
);

select * from documento;

insert into documento (nombreDoc, nomCorto) values('Cedula de Ciudadania','CC');
insert into documento (nombreDoc, nomCorto) values('Cedula de Extranjeria','CE');
insert into documento (nombreDoc, nomCorto) values('Registro Civil','RC');


create table peliculas(
idPelicula int primary key AUTO_INCREMENT,
titulo varchar(100) not null,
tema varchar(50) null,
genero varchar(50) not null default 'desconocido',
anhoEstreno int not null,
idDirector int,
foreign key (idDirector) references director(id)
);

insert into peliculas (titulo,tema,genero,anhoEstreno,idDirector)
values ('Terminator','Futuro Apocaliptico','Accion',1984,1);
insert into peliculas (titulo,tema,genero,anhoEstreno,idDirector)
values ('Avatar','Futuro Utopico','Accion',2009,1);

alter table peliculas add duracion int null default 0;
alter table peliculas add calificacion int null;

select * from peliculas;

create table director(
id int PRIMARY key AUTO_INCREMENT,
nombre varchar (100) not null DEFAULT 'Anonimo'
);

insert into director(nombre) values('James Cameron');

update peliculas set calificacion = 0 WHERE anhoEstreno < 2000;