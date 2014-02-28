/*create database premiosnobel;
*/
create table categoria(
cat_id varchar(1) primary key,
descripcion varchar(30) not null);

create table edición(
cat_id varchar(1),
anyo integer,
contribución varchar(80),
constraint edición_pk primary key(cat_id,anyo),
constraint edicioncategoria_fk foreign key (cat_id)references categoria (cat_id)
);
create table nominado(
cod integer,
nombre varchar(60) not null,
cod_pais varchar(4),
anyo_nac integer,
constraint nominado_pk primary key(cod),
constraint nominadopais_fk foreign key (cod_pais)references pais(cod_pais)
);
create table pais(
cod_pais varchar(4),
nombre varchar(20),
num_premios integer,
constraint pais_pk primary key(cod_pais)
);


create table premiado(
cat_id varchar(1),
anyo integer,
cod integer,

constraint premiado_pk primary key (cat_id,anyo,cod),
constraint premiadoedicion_fk foreign key (cat_id,anyo) references edición(cat_id,anyo),
constraint premiadonominado_fk foreign key (cod) references nominado(cod));


create table jurado(
jurado_id integer(4),
nombre varchar(60) not null,

constraint jurado_pk primary key(jurado_id)
);

create table comite(
cat_id varchar(1),
anyo integer,
jurado_id integer(4),
cargo varchar(20),
constraint comite_pk primary key(cat_id,anyo,jurado_id),
constraint comiteedicion_fk foreign key (cat_id,anyo)references edición (cat_id,anyo),
constraint comitejurado_fk foreign key (jurado_id)references jurado (jurado_id)
);
