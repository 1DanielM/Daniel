
*/INSERTAR DATOS*/


INSERT INTO Tipo_Cotizante (Id_TipoCotizante, Decripcion)
VALUES ('01', 'cotizante');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Tipodecotizante.txt'
INTO TABLE `Tipo_Cotizante` FIELDS TERMINATED BY '|';

INSERT INTO Municipio (Id_dane, Nombre_Municipio, Id_Departamento, Id_Regional)
VALUES ('11001', 'Bogota', '11','1');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Listadomunicipios.txt'
INTO TABLE `Municipio` FIELDS TERMINATED BY '|';

INSERT INTO Afiliado (Tipo_Doc, NumDoc, Direccion, Id_Dane)
VALUES ('CC', '1026271808', 'Calle 1 11 - 11','11001');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Afiliados.txt'
INTO TABLE `Afiliado` FIELDS TERMINATED BY '|';

INSERT INTO Empleador (Tipo_Doc, Num_Doc, RazonSocial)
VALUES ('NIT', '860090915', 'PruebasCurso');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Afiliados.txt'
INTO TABLE `Empleador` FIELDS TERMINATED BY '|';

INSERT INTO Relacion_Laboral (Id_Afiliado, Id_Empresa, Id_TipoCotizante, Categoria, Salario, Fch_inicio, Fch_Fin)
VALUES ('123456', '67890', '1', 'VIP', '2000000', '01/01/2020', '30/10/2024');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Afiliados.txt'
INTO TABLE `Relacion_Laboral` FIELDS TERMINATED BY '|';

INSERT INTO Cartera (Id_Cartera, Id_Relacion, Periodo, Valor, Edad)
VALUES ('2233', '123456', '202409', '120000', '2000000', '30 a 60 dias');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Afiliados.txt'
INTO TABLE `Cartera` FIELDS TERMINATED BY '|';

INSERT INTO RecuperacionCartera (Id_Recuperacion, Id_Cartera, Fch_Pago)
VALUES ('4455', '2233', '27/10/2024');

LOAD DATA INFILE 'C:/bd/CursoSQLCompensar/Afiliados.txt'
INTO TABLE `RecuperacionCartera` FIELDS TERMINATED BY '|';



*/CRUCE DE DATOS*/


create table Daniel.verificacion_pagos
select a.*,b.Periodo as Valor ,b.FechaPago_F as fch_pago from Cartera a
left join Daniel.RecuperacionCartera b 
on a.Id_Cartera = b.Id_Cartera;
