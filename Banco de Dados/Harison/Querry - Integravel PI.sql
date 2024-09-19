CREATE DATABASE Umitrix;
USE Umitrix;

CREATE TABLE Empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nomeEmpresa VARCHAR(50),
  cpnjEmpresa VARCHAR(14),
  telefoneEmpresa VARCHAR(15),
  emailEmpresa VARCHAR(80),
  senhaEmpresa VARCHAR(80)
) AUTO_INCREMENT = 1;

CREATE TABLE Usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nomeUsuario VARCHAR(50),
  cpfUsuario VARCHAR(14),
  telefoneUsuario VARCHAR(15),
  emailUsuario VARCHAR(80),
  senhaUsuario VARCHAR(80)
) AUTO_INCREMENT = 1;

CREATE TABLE Sensores (
   idSensor INT PRIMARY KEY AUTO_INCREMENT,
   modeloSensor VARCHAR(20),
   dtInstalacaoSensor DATE NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE registrosSensores(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
temperatura DOUBLE NOT NULL,
umidade DOUBLE NOT NULL,
dtMedicao datetime
);


INSERT INTO Empresa (nomeEmpresa, cpnjEmpresa, telefoneEmpresa, emailEmpresa, senhaEmpresa) 
VALUES 
('TechWorld', '32165487000122', '1145987456', 'contato@techworld.com', 'senhaTW789'),
('Eletronix', '12309867000133', '1133445566', 'contato@eletronix.com', 'senhaEX123'),
('ShopSmart', '87654321000144', '11999001122', 'contato@shopsmart.com', 'senhaSS2024'),
('SmartDevices', '90817263000155', '1122334455', 'suporte@smartdevices.com', 'senhaSD2024'),
('InnovateTech', '09876543210012', '1177889900', 'contato@innovatetech.com', 'senhaIT789');

INSERT INTO Usuario (nomeUsuario, cpfUsuario, telefoneUsuario, emailUsuario, senhaUsuario) 
VALUES 
('Carlos Pereira', '34567890123', '21987654321', 'carlos@dominio.com', 'senhaCarlos789'),
('Ana Souza', '43210987654', '31987654321', 'ana@dominio.com', 'senhaAna456'),
('Felipe Gomes', '21098765432', '41987654321', 'felipe@dominio.com', 'senhaFelipe123'),
('Julia Costa', '09876543210', '51987654321', 'julia@dominio.com', 'senhaJulia789'),
('Bruno Almeida', '56789012345', '61987654321', 'bruno@dominio.com', 'senhaBruno456');

INSERT INTO Sensores (modeloSensor, dtInstalacaoSensor) 
VALUES 
('DHT11', '2024-09-02'),
('DHT11', '2024-08-30'),
('DHT11', '2024-08-29'),
('DHT11', '2024-09-01'),
('DHT11', '2024-09-03');

INSERT INTO registrosSensores (temperatura, umidade, dtMedicao) 
VALUES 
(26.1, 62.5, '2024-09-01 12:30:00'),
(27.8, 58.0, '2024-09-01 13:00:00'),
(24.3, 65.2, '2024-09-02 09:30:00'),
(29.5, 52.1, '2024-09-02 10:00:00'),
(30.0, 50.0, '2024-09-02 10:30:00');

SELECT * FROM Empresa;
SELECT * FROM Usuario;
SELECT * FROM Sensores;
SELECT * FROM registrosSensores;
