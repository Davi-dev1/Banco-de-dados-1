use hospital;
Create Database hospital;

use hospital;

Create table medicos(
medico_id  int NOT null key auto_increment,
nome varchar(25) Not NULL,
especialidades varchar(100) NOT NULL,
CPF varchar(11) NOT NULL
);

create table paciente(
paciente_id int primary key auto_increment,
nome varchar(25) Not Null,
data_de_nascimento date Not Null,
email varchar(100) Not null,
endereço_logradouro varchar(250) not Null,
endereço_número int not Null,
telefone varchar(20) not null,
médico_id int,
FOREIGN KEY (médico_id) REFERENCES medicos(id)
);


create table consultas(
consulta_id int primary key auto_increment,
data_consulta date not null,
hora time  not null,
médico_id int,
paciente_id int,
valor_da_consulta decimal(10,2) not null,
nome_do_convenio varchar(25) not null,
numero_de_carteira int not null,
consulta_especialidade varchar(25) not null,
`medico_id` INT NOT NULL,
`paciente_id` INT NOT NULL
);
create table receita_medica(
receita_id int primary key auto_increment,
medicamentos_receitados varchar(30) not null,
quantidade int not null,
instruções_de_usos varchar(300) not null,
`paciente_id` int not null,-- essa é a tal da chave estrangeira para a consulta ???????
`medico_id` int not null,
`consulta_id` int not null
);
create table internacao(
id int primary key auto_increment,
data_de_entrada date not null,
data_de_prev_de_alta  date not null,
data_alta date not null,
procedimento varchar(300) not null,
`medico_id`int not null,
`paciente_id` INT NOT NULL,
`quarto_id` INT NOT NULL
);
create table quartos(
quarto_id int primary key auto_increment,
numeração int not null,
tipo_de_quarto varchar(40) not null,
tipo_de_quarto_id INT,
  FOREIGN KEY (tipo_de_quarto_id) REFERENCES tipo_de_quarto(id)

);
create table tipo_de_quarto(
tipo_quarto_id int primary key auto_increment,
descrição_do_quarto varchar(300) not null,
valor_diário decimal(10,2) not null   
);
create table enfermeiro(
enfermeiro_id int primary key auto_increment,
nome varchar(25) not null,
CPF varchar(11) not null,
COREN varchar(100) not null,
paciente_id int,
foreign key(paciente_id) references pacientes(id)

);
Create table IF NOT EXISTS convenio(
convenio_id int primary key auto_increment,
nome varchar (255) not null,
cnpj_convenio varchar(255) NOT NULL,
tempo_de_carencia INT NOT NULL unique,
`id_paciente` int ,
`id_medico` int
);
;
USE hospital;
CREATE TABLE IF NOT EXISTS `especialidade` (        -- Usar crases  é essencial nessas situações (só que n sei o pq exatamente)
`Especialidade ` int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
`descricao` varchar(255) Not NULL
);
CREATE TABLE IF NOT EXISTS `medico_especialidade`(
`medico_id` INT NOT NULL,
`especialidade_id` INT NOT NULL,
PRIMARY KEY (medico_id, especialidade_id)
);

-- Adicionar chaves estrangeiras
Alter Table `médico_especialidade`
ADD FOREIGN KEY(`medico_id`) references `medico`(`medico_id`) ON DELETE CASCADE,
ADD FOREIGN KEY (`especialidade_id`) references `especialidade `(`especialidade_id`) ON DELETE CASCADE;

Alter Table `internacao`
ADD FOREIGN KEY (`paciente_id`) references `paciente` (`paciente_id`) ON DELETE CASCADE,
ADD FOREIGN KEY (`medico_id`) references `medico`(`medico_id`) ON DELETE CASCADE,
ADD FOREIGN KEY (`quarto_id`) references `quartos`(`quarto_id`) ON DELETE CASCADE;

ALTER TABLE `consultas`
ADD FOREIGN KEY (`consulta_id`) references `consultas`(`consulta_id`) ON DELETE CASCADE,
ADD FOREIGN KEY (`paciente_id`) references `paciente` (`paciente_id`) ON DELETE CASCADE,
ADD FOREIGN KEY (`medico_id`) references `medico`(`medico_id`) ON DELETE CASCADE;

ALTER TABLE `convenio`
ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`medico_id`),
ADD FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`paciente_id`);

ALTER TABLE `receita_medica`
ADD FOREIGN KEY (`receita_id`) REFERENCES `receita_medica`(`receita_id`),
ADD FOREIGN KEY (`medico_id`) References `medico`(`medico_id`);


INSERT INTO `especialidade` (`descricao`) VALUES
(`Pediatria`),
(`Dermatologia`),
(`Neurologista`),
(`Biomedicina`),
(`Radioterapia`),
(`Cardiologia`),
(`Psquiatra`),
(`Dermatologia`),
(`gastrenterologia`),
(`Clinica Geral`);

INSERT INTO `medico` (`nome`, `cpf`) Values
(`Dr.Vinicius Vilas Boas`, `12345678910`),
(`Dr.Adoniran`,`456.123.890.76`),
(`Dr Carlos`, `789.456.223.45`),
(`Dr Pedro`, `234.678.40923`),
(`Dr Paulo`, `125.345.67890`),
(`Dr cleiton`,`289.818.75000`),
(`Dr tiago`, `450.200.45678`),
(`Dr evanestro`, `334.654.24566`),
(`Dr Guilherme`, `332.111.99900`),
(`Dr Yago`, `332.556.11188`);

INSERT INTO `medico_especialidade`(`id_medico`,`id_especialidade`)values
(`1`,`2`),
(`2`,`3`),
(`3`,`4`),
(`4`,`5`),
(`5`, `6`),
(`6`, `7`),
(`7`,`8`),
(`8`,`9`),
(`9`, `10`),
(`10`,`11`);


-- Inserindo dados dos pacientes:
INSERT INTO `paciente`(`nome`, `data_de_nascimento`, `cpf`, `email`, `telefone`) Values
(`Heitor`,`2002-05-02`,`114.556.33444`,`oheitor@gmail.com`,`987654311`),
(`Gustavo`,`1989-12-03`,`123.600.12212`,`Gustav@gmail.com`,`962323232`),
(`Carlos`,`2007-11-02`,`200.400.67898`,`carlinho@gmail.com`,`953289076`),
(`Luis`,`2004-07-06`,`250.600.1144`,`Luis@gmail.com`,`985678995`),
(`Marlene`,`1999-12-10`,`134.456.13456`,`Marlene@gmail.com`,`978904388`),
(`Victor`,`2001-09-15`,`456.256.33333`,`Vic@gmail.com`,`979456890`),
(`Marcos`,`1999-10-08`,`678.234.45678`,`Marcos@gmail.com`,`909234123`),
(`Mauricio`,`1964-12-11`,`101.556.12434`,`Mauricio@gmail.com`,`986554778`),
(`Lucas`,`2010-01-09`,`789.333.45678`,`Lucas@gmail.com`,`911232789`),
(`João`,`1997-05-10`,`345.356.13456`,`Joao@gmail.com`,`908567334`),
(`Artur`,`1990-11-06`,`300.700.600`,`artur@gmail.com`,`966890111`),
(`Adriano`,`2000-07-09`,`311.455.29009`,`Driola@gmail.com`,`956754232`),
(`Giovane`,`2002-02-09`,`333.490.47890`,`Giovanne@gmail.com`,`909093121`),
(`Ester`,`1990-12-04`,`300.400.20256`,`Ester@gmail.com`,`967844121`),
(`Laís`,`1980-12-07`,`220.446.40956`,`Laís@gmail.com`,`949088099`);

-- registro de 20 consultas
INSERT INTO `consultas`(`data_consulta`,`paciente_id`,`medico_id`,`hora` ,`valor_da_consulta`) VALUES
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`450.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`),
(`2016-12-10`,`1`,`2`,`13:30:15`,`500.00`);


