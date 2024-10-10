CREATE DATABASE Umitrix;
USE Umitrix;

CREATE TABLE Empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(45) not null,
nomeFantasia varchar(45) not null,
cnpj varchar(18) UNIQUE,
email varchar(45) not null UNIQUE,
representanteLegal varchar(45) not null,
senha varchar(30) not null,
telefone varchar(15) not null
);

CREATE TABLE Endereco (
idEndereco int primary key auto_increment,
cep char(10) not null,
uf char(2) not null,
cidade varchar(35) not null,
rua varchar(45) not null,
numero varchar(7) not null,
fkEmpresa int unique,
constraint fkEnderecoEmpresa foreign key (fkEmpresa)
	references Empresa(idEmpresa)
);

CREATE TABLE Estoque (
idEstoque int primary key auto_increment,
qtdSensores int not null,
tamanhoEstoque DECIMAL (5,2),
fkEmpresa int,
constraint fkEstoqueEmpresa foreign key (fkEmpresa)
	references Empresa(idEmpresa)
);

CREATE TABLE Sensor_DHT11 (
idSensor int primary key auto_increment,
dtInstalacao DATE not null,
fkEstoque int,
constraint fkSensor_DHT11Estoque foreign key (fkEstoque)
	references Estoque(idEstoque)
);

CREATE TABLE Registros (
idRegistros int primary key auto_increment,
temperatura double not null,
umidade double not null,
nvAlerta varchar(12) not null,
constraint chkAlerta check(nvAlerta in('Normal','Elevado')),
dtMedicao datetime not null,
fkSensor_DHT11 int,
constraint fkRegistrosSensor_DHT11 foreign key (fkSensor_DHT11)
	references Sensor_DHT11 (idSensor)
);

INSERT INTO Empresa (razaoSocial, nomeFantasia, cnpj, email, representanteLegal, senha, telefone)
VALUES 
('Tech Solutions Ltda.', 'TechSol', '12.345.678/0001-90', 'contato@techsol.com', 'Carlos Almeida', 'senha123', '(11) 1234-5678'),
('Super Mercados União Ltda.', 'União Super', '98.765.432/0001-88', 'suporte@uniaosuper.com', 'Mariana Rocha', 'senha456', '(21) 8765-4321'),
('Construtora Ideal S/A', 'Ideal Construtora', '32.109.876/0001-65', 'vendas@ideal.com', 'João Mendes', 'senha789', '(31) 1098-7654'),
('Agro Brasil Ltda.', 'AgroBrasil', '56.210.345/0001-32', 'info@agrobrasil.com', 'Ana Souza', 'senha321', '(51) 2103-4567'),
('Moveis Classicos Ltda.', 'Móveis Clássicos', '78.345.210/0001-54', 'contato@moveisclassicos.com', 'Pedro Martins', 'senha654', '(41) 3452-1078');

INSERT INTO Endereco (cep, uf, cidade, rua, numero, fkEmpresa) VALUES
('01001-000', 'SP', 'São Paulo', 'Rua da Consolação', '123-a', 1),
('22222-222', 'RJ', 'Rio de Janeiro', 'Avenida Atlântica', '456', 2),
('30000-000', 'MG', 'Belo Horizonte', 'Rua das Flores', '789', 3),
('80000-000', 'PR', 'Curitiba', 'Avenida Sete de Setembro', '321', 4),
('91000-000', 'RS', 'Porto Alegre', 'Rua dos Andradas', '1012-B', 5);

INSERT INTO Estoque (qtdSensores, tamanhoEstoque, fkEmpresa) VALUES
(10, 150.75, 1),
(12, 300.50, 2),
(9, 200.25, 3),
(8, 100.00, 4),
(12, 175.50, 5);

INSERT INTO Sensor_DHT11 (dtInstalacao, fkEstoque) VALUES
('2023-01-15', 1),
('2023-02-10', 1),
('2023-03-05', 2),
('2023-04-20', 3),
('2023-05-30', 4);

INSERT INTO Sensor_DHT11 (dtInstalacao, fkEstoque) VALUES
('2023-02-12', 5);


INSERT INTO Registros (temperatura, umidade, nvAlerta, dtMedicao, fkSensor_DHT11) VALUES
(23.5, 60.0, 'Normal', '2023-06-01 10:00:00', 1),
(32.3, 65.5, 'Elevado', '2023-06-01 11:00:00', 5),
(22.1, 55.0, 'Normal', '2023-06-01 12:00:00', 2),
(30.0, 70.0, 'Elevado', '2023-06-01 13:00:00', 3),
(24.8, 50.5, 'Normal', '2023-06-01 14:00:00', 4);

SELECT * FROM Registros JOIN Sensor_DHT11
	on idSensor = fkSensor_DHT11 ;

SELECT * FROM Empresa JOIN Endereco
	on idEmpresa = fkEmpresa;

SELECT * FROM Estoque JOIN Empresa
	on idEmpresa = fkEmpresa;
    











