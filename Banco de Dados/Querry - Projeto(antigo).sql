CREATE DATABASE UMITRIX;
USE UMITRIX;

CREATE TABLE tbEmpresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(60) NOT NULL,
cnpjEmpresa VARCHAR(14) NOT NULL,
email VARCHAR(80) NOT NULL,
senha VARCHAR(20) NOT NULL,
telefoneEmpresa	VARCHAR(15)
);
CREATE TABLE tbUsuario(
id_Usuario INT,
nome varchar(25),
cpf varchar(12),
email varchar(60),
telefone varchar(15),
login varchar(15),
senha varchar(15)
);

CREATE TABLE tbEstoques(
idEstoque INT PRIMARY KEY AUTO_INCREMENT,
qtdDeSetores INT,
cepEstoque CHAR(8) NOT NULL,
endereco VARCHAR(80) NOT NULL,
tamanhoEstoque DOUBLE NOT NULL
);

CREATE TABLE tbSensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(10) NOT NULL,
coordenadas DOUBLE NOT NULL,
dtInstalacao DATE NOT NULL
);

CREATE TABLE tbRegistros(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
temperatura DOUBLE NOT NULL,
umidade DOUBLE NOT NULL,
nvAlerta VARCHAR(20),
constraint chkAlerta check(nvAlerta in('Baixo','Normal','Alerta')),
dtMedicao datetime
);



-- INSERINDO DADOS

INSERT INTO tbEmpresa (nomeEmpresa, cnpjEmpresa, email, senha, telefoneEmpresa) VALUES
('GlobalTech', '11223344000100', 'contact@globaltech.com', 'global123', '(11) 91234-5678'),
('BrightFuture', '22334455000111', 'info@brightfuture.com', 'bright456', '(21) 92345-6789'),
('Innovate Solutions', '33445566000122', 'support@innovatesolutions.com', 'innovate789', '(31) 93456-7890'),
('SecureNet', '44556677000133', 'hello@securenet.com', 'secure000', '(41) 94567-8901'),
('SolarTech', '55667788000144', 'contact@solartech.com', 'solar1234', '(51) 95678-9012'),
('NextGen Systems', '66778899000155', 'sales@nextgensystems.com', 'nextgen12', '(61) 96789-0123'),
('DataPro', '77889900000166', 'info@datapro.com', 'datapro34', '(71) 97890-1234'),
('TechPioneers', '88990011000177', 'support@techpioneers.com', 'pioneers56', '(81) 98901-2345'),
('OptimaTech', '99001122000188', 'contact@optimatech.com', 'optima78', '(91) 99012-3456'),
('CyberNetworks', '00112233000199', 'info@cybernetworks.com', 'cyber90', '(01) 90123-4567');

INSERT INTO tbUsuario (id_Usuario, nome, cpf, email, telefone, login, senha) VALUES
(11, 'Marcos Oliveira', '12345678901', 'marcos.oliveira@empresa.com', '(11) 91234-5678', 'marcos', 'senha456'),
(12, 'Rafaela Mendes', '23456789012', 'rafaela.mendes@empresa.com', '(21) 92345-6789', 'rafaela', 'password789'),
(13, 'Júlio César', '34567890123', 'julio.cesar@empresa.com', '(31) 93456-7890', 'julio', 'qwerty123'),
(14, 'Sofia Martins', '45678901234', 'sofia.martins@empresa.com', '(41) 94567-8901', 'sofia', 'admin123'),
(15, 'Gustavo Lima', '56789012345', 'gustavo.lima@empresa.com', '(51) 95678-9012', 'gustavo', 'eco4567'),
(16, 'Tatiane Souza', '67890123456', 'tatiane.souza@empresa.com', '(61) 96789-0123', 'tatiane', 'solut456'),
(17, 'Daniel Costa', '78901234567', 'daniel.costa@empresa.com', '(71) 97890-1234', 'daniel', 'network34'),
(18, 'Camila Pereira', '89012345678', 'camila.pereira@empresa.com', '(81) 98901-2345', 'camila', 'futur3tech'),
(19, 'Felipe Silva', '90123456789', 'felipe.silva@empresa.com', '(91) 99012-3456', 'felipe', 'sys4567'),
(20, 'Luana Rodrigues', '01234567890', 'luana.rodrigues@empresa.com', '(01) 90123-4567', 'luana', 'cyber678');



INSERT INTO tbEstoques (qtdDeSetores, cepEstoque, endereco, tamanhoEstoque) VALUES
(15, '11000000', 'Avenida Paulista, 1000 - São Paulo', 1500.0),
(20, '22000000', 'Avenida Atlântica, 2000 - Rio de Janeiro', 2000.0),
(12, '33000000', 'Rua das Flores, 300 - Belo Horizonte', 1200.0),
(8, '44000000', 'Rua São João, 400 - Curitiba', 800.0),
(18, '55000000', 'Rua Nova, 500 - Porto Alegre', 1800.0),
(25, '66000000', 'Rua do Comércio, 600 - Recife', 2500.0),
(10, '77000000', 'Rua das Acácias, 700 - Salvador', 1000.0),
(14, '88000000', 'Rua do Sol, 800 - Fortaleza', 1400.0),
(16, '99000000', 'Rua das Palmeiras, 900 - Brasília', 1600.0),
(22, '10010010', 'Rua das Margaridas, 100 - Natal', 2200.0);

INSERT INTO tbSensores (modelo, coordenadas, dtInstalacao) VALUES
('DTH11', 55.1234, '2024-01-10'),
('DTH11', 56.2345, '2024-02-15'),
('DTH11', 57.3456, '2024-03-20'),
('DTH11', 58.4567, '2024-04-25'),
('DTH11', 59.5678, '2024-05-30'),
('DTH11', 60.6789, '2024-06-05'),
('DTH11', 61.7890, '2024-07-10'),
('DTH11', 62.8901, '2024-08-15'),
('DTH11', 63.9012, '2024-09-20'),
('DTH11', 64.0123, '2024-10-25');

INSERT INTO tbRegistros (temperatura, umidade, nvAlerta, dtMedicao) VALUES
(22.0, 58.0, 'Normal', '2024-09-04 08:00:00'),
(23.5, 60.0, 'Normal', '2024-09-04 12:00:00'),
(24.0, 62.0, 'Normal', '2024-09-04 16:00:00'),
(25.5, 64.0, 'Normal', '2024-09-04 20:00:00'),
(26.0, 66.0, 'Alerta', '2024-09-05 08:00:00'),
(27.0, 68.0, 'Alerta', '2024-09-05 12:00:00'),
(28.0, 70.0, 'Alerta', '2024-09-05 16:00:00'),
(24.5, 63.0, 'Normal', '2024-09-05 20:00:00'),
(23.0, 60.0, 'Normal', '2024-09-06 08:00:00'),
(22.5, 59.0, 'Baixo', '2024-09-06 12:00:00');

-- CONSULTA NA TABELA
-- selecionar tudo
select * from tbRegistros;

-- filtrar pelo alerta
select * from tbRegistros where nvAlerta = 'Normal';

-- Nome que começa com  a letra R
select * from tbUsuario where nome like "R%";

-- Nome que termina com a letra R
select * from tbUsuario where nome like "%a";

-- Penultima letra do nome termina com R
select * from tbUsuario where nome like "%r_";
