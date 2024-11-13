use master
go
drop database if exists CursoSQL
go
create database CursoSQL
go
use CursoSQL
go
create table Tipo_Cotizante( Id_TipoCotizante smallint primary key identity(1,1) not null,
Decripcion varchar(30) not null
)
 
create table Municipio( Id_dane smallint primary key identity(1,1) not null,
Nombre_Municipio varchar(30) not null,
Id_Departamento smallint not null,
Id_Regional smallint not null
)
 
create table Afiliado( Id_Afiliado int primary key identity(1,1) not null,
Tipo_Doc varchar(2) not null,
NumDoc varchar(25) not null,
Direccion varchar(150),
Telefono varchar(15),
Id_Dane int not null
)
 
create table Empleador( Id_Empresa int primary key identity(1,1) not null,
Tipo_Doc varchar(2) not null,
Num_Doc varchar(25),
RazonSocial varchar(150),
)
 
create table Relacion_Laboral( Id_relacion bigint primary key identity(1,1) not null,
Id_Afiliado int not null,
Id_Empresa int not null,
Id_TipoCotizante smallint not null,
Categoria char(2) not null,
Salario money not null,
Fch_inicio datetime not null,
Fch_Fin datetime not null
)

create table Cartera( Id_Cartera bigint primary key identity(1,1) not null,
Id_Cartera int not null,
Id_Relacion int not null,
Periodo int not null,
Valor money not null,
Edad varchar(150) not null
)

create table RecuperacionCartera(identity(1,1) not null,
Id_Recuperacion int not null,
Id_Cartera int not null,
Fch_Pago datetime not null,
)