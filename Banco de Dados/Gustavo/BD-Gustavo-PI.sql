CREATE DATABASE Umitrix;
USE Umitrix;
-- Tabela contendo o cadrastro dos cientes:
CREATE TABLE Usuario (
id_Usuario int primary key auto_increment,
nome_Completo varchar(30) not null,
idade int not null,
email varchar(40) not null,
cpf varchar(15) not null,
login varchar(15) not null,
senha varchar(20) not null,
endereço varchar(60) not null,
dtnascm date not null,
telefone varchar(20) not null
);
desc usuario;

INSERT INTO Usuario VALUES
(default, 'Gustavo Castro Andrade', 21, 'gustavo.ca@sptech.com','525.753.988-86', 'GustCastro','68629810h','Rua Antônio Almeida, 539 - São Paulo-SP','2003-09-13','(11)-93452-6452'),
(default, 'Harison Rios Miranda', 19, 'harison.rios@sptech.com','425.453.908-21', 'Harison_RM','hfsb9i88','Rua Antônio Prestes, 45-A - Xique-Xique - BA','2006-10-14', '(71)-94444-3253'),
(default, 'Eduardo Almeirda', 18, 'eduardo@sptech.com','234.199.888-25', 'Edu@1990','R$%%5','Rua Itaquera São Jorje, 768 - Osasco-SP','2007-02-15','(11)-98264-3432');

ALTER TABLE Usuario RENAME COLUMN nome_Completo to nome;
ALTER TABLE Usuario ADD COLUMN sexo varchar (15);
ALTER TABLE usuario ADD constraint chksexo CHECK (sexo in ('Masculino','Feminino'));
update usuario set idade = 20 where id_Usuario = 1;
update usuario set sexo = 'Masculino' where id_Usuario in (1,2,3);
INSERT INTO Usuario VALUES
(default, 'Isabella', 19, 'isa-@sptech.com','134.456.234-65', 'isa@10','shdsh','Rua tucuruiv, 78 - Barueri-SP','2005-06-23','(11)-94667-7424','Feminino');


SELECT * FROM Usuario;
SELECT nome AS 'Nome Completo', email as Email, cpf as CPF, dtnascm as 'Data de nascimento', sexo FROM Usuario WHERE nome like '%Rios%' or login like 'E%';
SELECT nome AS 'Nome Completo', idade as Idade, telefone as Telefone FROM usuario WHERE idade = 21 and cpf like '_2%';
SELECT email, senha, endereço From usuario WHERE cpf >= '425.453.908-21';

-- Tabela contendo dados das empresas:
CREATE TABLE Empresas (
id_Empresa int primary key auto_increment,
Empresa varchar(30) not null,
cnpj varchar(30) not null,
email_comercial varchar(35) not null,
telefone varchar(20) not null,
login varchar (30) not null,
senha varchar(15) not null
) auto_increment=10;

desc Empresas;
ALTER TABLE empresas ADD COLUMN endereço varchar(60) not null;
INSERT INTO Empresas VALUES
(default,'Umitrix', ' 21.222.343/0001-67', 'Umi.@outlok.com','(21) 3029-1755', 'Umi_32', '2784yh','Rua Baldario Fidelis, 987 - Rio de Janeiro-RJ'),
(default,'GHT14', ' 32.111.765/0001-89', 'GHT14@outlok.com', 'GHT1432','(21) 5893-4343', 'bvfdgbrh','Rua Getulio Vargas, 02 - Rio de Janeiro-RJ'),
(default,'HJJ', ' 33.778.123/0001-98', 'HJJ@outlok.com', 'HJJ130', 'HUG23','(11) 3916-6372','Rua Salazar Julio, 123 - São Paulo-SP');
SELECT * FROM empresas;
update empresas set senha = 'HJJ123' where id_Empresa = 12;
SELECT id_Empresa, Empresa, cnpj as CNPJ, email_comercial as Email FROM empresas ORDER BY endereço desc;
SELECT cnpj, senha FROM empresas WHERE id_Empresa = 11 or id_Empresa = 12;

-- Tabela referênte aos sensores instalados no estoque:
CREATE TABLE Sensor_DHT11 (
id_sensores int primary key auto_increment not null,
coordenadas decimal(7,2) not null,
dt_fabricação date not null,
dt_instalação date not null,
preço float not null);
desc Sensor_DHT11;

TRUNCATE TABLE Sensor_DHT11;
INSERT INTO Sensor_DHT11 VALUE
(default,18927.07, '2016-09-14','2024-10-17',15.00),
(default,17625.56, '2012-02-22','2024-10-17',15.00),
(default,18925.02, '2015-09-14','2024-10-17',15.00);
SELECT * FROM Sensor_DHT11 where dt_fabricação > '2013-08-17' order by coordenadas;
SELECT dt_fabricação as 'Data de fabricação', preço as 'Valor R$' from Sensor_DHT11;

-- Tabela dos dados formecidos pelos sensores
CREATE TABLE registros(
id_dados int primary key auto_increment not null,
temperatura float,
umidade_relativa int,
nivel varchar(15),
dtmedição date
);
DROP TABLE registros;
desc registros;
ALTER TABLE registros ADD CONSTRAINT chktempe CHECK (temperatura >=0 and temperatura <=70);
ALTER TABLE registros ADD CONSTRAINT chknivel CHECK (nivel in ('Baixo','Estável','Alto'));
SELECT * FROM registros;
INSERT INTO registros VALUES 
(default, 35.4, 60, 'Alto','2022-04-04'),
(default, 29.0, 40, 'Estável','2023-08-08'),
(default, 42.5, 20, 'Alto','2024-09-02'),
(default, 16.7, 80, 'Baixo','2024-05-06');
SELECT * FROM registros WHERE dtmedição >= '2023-08-08' and umidade_relativa >= 21;

 










