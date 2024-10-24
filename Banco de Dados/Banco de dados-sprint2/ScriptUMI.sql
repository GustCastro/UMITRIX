CREATE DATABASE Umitrix;
USE Umitrix;
DROP DATABASE Umitrix;

CREATE TABLE Empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(45) not null,
representanteLegal varchar(45) not null,
cnpj varchar(18) UNIQUE,
email varchar(45) not null UNIQUE,
senha varchar(45) not null,
telefone char(12) not null,
fkFilial int,
constraint fkEmpresaFilial foreign key (fkFilial)
 references Empresa (idEmpresa)
);

CREATE TABLE Endereco (
idEndereco int primary key auto_increment,
cep char(10) not null,
uf char(2) not null,
cidade varchar(35) not null,
rua varchar(45) not null,
numero varchar(7) not null,
fkEmpresa int,
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
    idSensor int,
    dtInstalacao DATE not null,
    fkEstoque int not null,
    constraint fkSensorEstoque foreign key (fkEstoque)
        references Estoque(idEstoque),
    PRIMARY KEY (idSensor, fkEstoque)
);



CREATE TABLE Registros (
    idRegistros int,
    temperatura double not null,
    umidade double not null,
    nvAlerta varchar(12) not null,
    constraint chkAlerta check(nvAlerta in('Ideal','Elevado','Crítico')),
    dtMedicao datetime not null,
    fkSensor int not null,
    constraint fkRegistrosSensor foreign key (fkSensor) 
        references Sensor_DHT11(idSensor),
    PRIMARY KEY (fkSensor, idRegistros)
);

INSERT INTO Empresa (razaoSocial, representanteLegal, cnpj, email, senha, telefone, fkFilial) VALUES
('Tech Innovations LTDA', 'João Silva', '12.345.678/0001-90', 'contato@techinnovations.com.br', 'senha123', '12345678901', NULL),
('Agro Farming S/A', 'Maria Oliveira', '23.456.789/0001-01', 'contato@agrofarming.com.br', 'agro2024', '23456789012', NULL),
('Logística Express', 'Carlos Pereira', '34.567.890/0001-12', 'logistica@express.com.br', 'log123', '34567890123', 1),
('Saúde e Bem Estar', 'Ana Costa', '45.678.901/0001-23', 'saude@bemestar.com.br', 'saude2024', '45678901234', NULL),
('Construtora ABC', 'Fernando Mendes', '56.789.012/0001-34', 'contato@construtoraabc.com.br', 'construcao2024', '56789012345', 2);


INSERT INTO Endereco (cep, uf, cidade, rua, numero, fkEmpresa) VALUES
('12345-678', 'SP', 'São Paulo', 'Avenida Paulista', '1000', 1),
('23456-789', 'MG', 'Belo Horizonte', 'Rua da Bahia', '500', 2),
('34567-890', 'RJ', 'Rio de Janeiro', 'Praia de Copacabana', '200', 3),
('45678-901', 'RS', 'Porto Alegre', 'Rua dos Andradas', '300', 4),
('56789-012', 'PR', 'Curitiba', 'Avenida Marechal Floriano', '400', 5);


INSERT INTO Estoque (qtdSensores, tamanhoEstoque, fkEmpresa) VALUES
(10, 150.75, 1),  
(12, 75.50, 2),  
(9, 250.00, 3), 
(8, 40.00, 4),  
(12, 30.25, 5); 

INSERT INTO Sensor_DHT11 (idSensor, dtInstalacao, fkEstoque) VALUES
(1, '2023-01-15', 1),  
(2, '2023-02-20', 1),  
(3, '2023-03-05', 2),  
(4, '2023-03-15', 3), 
(5, '2023-04-10', 4),  
(6, '2023-04-25', 5);  

INSERT INTO Registros (temperatura, umidade, nvAlerta, dtMedicao, fkSensor_DHT11) VALUES
(23.5, 60.0, 'Normal', '2023-06-01 10:00:00', 1),
(32.3, 65.5, 'Elevado', '2023-06-01 11:00:00', 5),
(22.1, 55.0, 'Normal', '2023-06-01 12:00:00', 2),
(30.0, 70.0, 'Elevado', '2023-06-01 13:00:00', 3),
(24.8, 50.5, 'Normal', '2023-06-01 14:00:00', 4);

INSERT INTO Registros (idRegistros, temperatura, umidade, nvAlerta, dtMedicao, fkSensor) VALUES
(1, 22.5, 60.0, 'Ideal', '2023-05-01 08:30:00', 1), 
(2, 24.0, 65.0, 'Elevado', '2023-05-01 09:00:00', 1), 
(3, 20.0, 70.0, 'Crítico', '2023-05-02 10:00:00', 2),  
(4, 19.5, 75.0, 'Elevado', '2023-05-02 11:30:00', 3),  
(5, 21.0, 55.0, 'Ideal', '2023-05-03 14:45:00', 4),   
(6, 23.0, 80.0, 'Crítico', '2023-05-04 16:15:00', 5),  
(7, 20.5, 60.5, 'Ideal', '2023-05-04 17:00:00', 6);   

SELECT e.razaoSocial, en.rua, en.cidade, en.uf, en.cep
FROM Empresa as e
JOIN Endereco as en ON e.idEmpresa = en.fkEmpresa;

SELECT s.idSensor, s.dtInstalacao, es.qtdSensores, es.tamanhoEstoque, emp.razaoSocial
FROM Sensor_DHT11 as s
JOIN Estoque as es ON s.fkEstoque = es.idEstoque
JOIN Empresa as emp ON es.fkEmpresa = emp.idEmpresa;


SELECT emp.razaoSocial, es.idEstoque, es.qtdSensores, s.idSensor, s.dtInstalacao
FROM Empresa emp
JOIN Estoque as es ON emp.idEmpresa = es.fkEmpresa
JOIN Sensor_DHT11 as s ON es.idEstoque = s.fkEstoque;








