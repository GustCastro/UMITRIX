create database sprint1;
use sprint1;

create table cadastro (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (100) not null,
cnpj varchar (14) not null,
email varchar (100) not null,
senha varchar (50) not null,
telefone varchar(15),
cpf varchar (11) not null,
dono varchar (40)
);

create table localidade (
idLocal int primary key auto_increment,
cidade varchar (30) not null,
estado varchar (30) not null, 
cep char(8) not null,
endereco varchar(80) not null, 
numero char (6) not null, 
tamanho double not null
);

create table sensores (
idSensor int primary key auto_increment,
modelo varchar (15) not null,
quantidade char (10) not null, 
dtInstalacao date not null
);



create table registro (
idRegistro int primary key auto_increment, 
temperatura double not null,
umidade double not null,
alerta varchar (20)
);

alter table sensores add constraint chkSensores check ( modelo in ('DHT11'));

INSERT INTO cadastro (nomeEmpresa, cnpj, email, senha, telefone, cpf, dono)
VALUES 
('Tech Solutions Ltda', '12345678000195', 'contato@techsolutions.com.br', 'senha123', '(11) 98765-4321', '12345678901', 'João Silva'),
('EcoTech S.A.', '98765432000123', 'info@ecotech.com.br', 'senha456', '(21) 91234-5678', '10987654321', 'Maria Oliveira'),
('Data Dynamics', '11223344000155', 'support@datadynamics.com', 'pass4567', '(31) 98765-4321', '23456789012', 'Carlos Souza'),
('InovaTech', '55667788000190', 'contact@inovatech.com', 'securepass', '(41) 91234-5678', '34567890123', 'Ana Costa'),
('Green Energy Ltda', '22334455000122', 'hello@greenenergy.com', 'pass1234', '(51) 92345-6789', '45678901234', 'Pedro Almeida'),
('Solar Solutions', '99887766000133', 'info@solarsolutions.com', 'mypassword', '(61) 93456-7890', '56789012345', 'Beatriz Martins');

INSERT INTO localidade (cidade, estado, cep, endereco, numero, tamanho)
VALUES 
('São Paulo', 'São Paulo', '01001000', 'Avenida Paulista', '100', 150),
('Rio de Janeiro', 'Rio de Janeiro', '2000000', 'Praia do Flamengo', '200', 200),
('Belo Horizonte', 'Minas Gerais', '30100000', 'Rua da Bahia', '300', 180),
('Porto Alegre', 'Rio Grande do Sul', '90000000', 'Avenida Osvaldo Aranha', '400', 190),
('Curitiba', 'Paraná', '80000000', 'Rua XV de Novembro', '500', 160),
('Recife', 'Pernambuco', '50000000', 'Avenida Guararapes', '600', 170);

INSERT INTO sensores (modelo, quantidade, dtInstalacao)
VALUES 
('DHT11', '10', '2024-01-15'),
('DHT11', '15', '2024-02-20'),
('DHT11', '20', '2024-03-25'),
('DHT11', '25', '2024-04-30'),
('DHT11', '30', '2024-05-10'),
('DHT11', '35', '2024-06-05');

INSERT INTO registro (temperatura, umidade, alerta)
VALUES 
(22.5, 55.0, 'media'),
(54.0, 50.0, 'alta'),
(10.0, 22.0, 'baixa'),
(23.5, 57.0, 'media'),
(13.0, 52.0, 'baixa'),
(45.0, 35.0, 'alta');


