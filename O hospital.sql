-- Criação da tabela de especialidades
CREATE TABLE especialidades (
    especialidade_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela de médicos
CREATE TABLE medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    especialidade_id INT,
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(especialidade_id)
);

-- Tabela de relacionamento entre médicos e especialidades
CREATE TABLE medico_especialidade (
    medico_id INT,
    especialidade_id INT,
    PRIMARY KEY (medico_id, especialidade_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(especialidade_id)
);

-- Criação da tabela de pacientes
CREATE TABLE pacientes (
    paciente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_de_nascimento DATE NOT NULL,
    email VARCHAR(100),
    endereco_logradouro VARCHAR(100),
    endereco_numero INT
);

-- Criação da tabela de convênios
CREATE TABLE convenios (
    convenio_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela de consultas
CREATE TABLE consultas (
    consulta_id INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    paciente_id INT,
    medico_id INT,
    hora TIME,
    valor_da_consulta DECIMAL(10,2),
    receita TEXT,
    convenio_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
    FOREIGN KEY (convenio_id) REFERENCES convenios(convenio_id)
);
select * from consultas;
-- Criação da tabela de medicamentos (para as receitas)
CREATE TABLE medicamentos (
    medicamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de relacionamento entre consultas e medicamentos (para receituário)
CREATE TABLE consulta_medicamento (
    consulta_id INT,
    medicamento_id INT,
    PRIMARY KEY (consulta_id, medicamento_id),
    FOREIGN KEY (consulta_id) REFERENCES consultas(consulta_id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(medicamento_id)
);
select * from consulta_medicamento ;

-- Criação da tabela de tipos de quartos
CREATE TABLE tipos_quartos (
    tipo_quarto_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

-- Criação da tabela de internações
CREATE TABLE internacoes (
    internacao_id INT AUTO_INCREMENT PRIMARY KEY,
    data_internacao DATE NOT NULL,
    data_alta DATE,
    paciente_id INT,
    medico_id INT,
    tipo_quarto_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
    FOREIGN KEY (tipo_quarto_id) REFERENCES tipos_quartos(tipo_quarto_id)
);

-- Criação da tabela de enfermeiros
CREATE TABLE enfermeiros (
    enfermeiro_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    coren VARCHAR(20) NOT NULL
);

-- Tabela de relacionamento entre internações e enfermeiros
CREATE TABLE internacao_enfermeiro (
    internacao_id INT,
    enfermeiro_id INT,
    PRIMARY KEY (internacao_id, enfermeiro_id),
    FOREIGN KEY (internacao_id) REFERENCES internacoes(internacao_id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros(enfermeiro_id)
);
INSERT INTO especialidades (nome) VALUES
('Pediatria'), ('Clínica Geral'), ('Gastrenterologia'), 
('Dermatologia'), ('Neurologia'), ('Cardiologia'), 
('Psiquiatria');
select * from medicos

INSERT INTO medicos (nome, cpf, especialidade_id) VALUES
('Dr. Vinicius Vilas Boas', '12345678910', 1),
('Dr. Adoniran', '45612389076', 4),
('Dr. Carlos', '78945622345', 5),
('Dr. Pedro', '23467840923', 3),
('Dr. Paulo', '12534567890', 6),
('Dra. Mariana', '34567891234', 2),
('Dr. Tiago', '4502045678', 7),
('Dr. Guilherme', '33211199900', 3),
('Dra. Leticia', '31122334455', 4),
('Dr. Yago', '33255611188', 2);
INSERT INTO pacientes(nome, data_de_nascimento, cpf, email, telefone) Values
('Heitor','2002-05-02','114.556.33444','oheitor@gmail.com','987654311'),
('Gustavo','1989-12-03','123.600.12212','Gustav@gmail.com','962323232'),
('Carlos','2007-11-02','200.400.67898','carlinho@gmail.com','953289076'),
('Luis','2000-07-06','250.600.1144','Luis@gmail.com','985678995'),
('Marlene','1999-12-10','134.456.13456','Marlene@gmail.com','978904388'),
('Victor','2001-09-15','456.256.33333','Vic@gmail.com','979456890'),
('Marcos','1999-10-08','678.234.45678','Marcos@gmail.com','909234123'),
('Mauricio','1964-12-11','101.556.12434','Mauricio@gmail.com','986554778'),
('Lucas','2010-01-09','789.333.45678','Lucas@gmail.com','911232789'),
('João','1997-05-10','345.356.13456','Joao@gmail.com','908567334'),
('Artur','1990-11-06','300.700.600','artur@gmail.com','966890111'),
('Adriano','2000-07-09','311.455.29009','Driola@gmail.com','956754232'),
('Giovane','2002-02-09','333.490.47890','Giovanne@gmail.com','909093121'),
('Ester','1990-12-04','300.400.20256','Ester@gmail.com','967844121'),
('Laís','1980-12-07','220.446.40956','Laís@gmail.com','949088099');

INSERT INTO convenios (nome) VALUES
('Amil'), ('Bradesco Saúde'), ('Unimed'), ('SulAmérica');

INSERT INTO consultas(consulta_id,data_consulta,paciente_id,medico_id,hora ,valor_da_consulta,nome_do_convenio,numero_de_carteira,consulta_especialidade) VALUES
(1,'2016-12-10',1,2,'13:30:15','500.00','Minha Consulta',1,'pediatria'),
(2,'2015-10-07',2,3,'12:30:15','450.00','Consulta mais',2,'Dermatologia'),
(3,'2020-09-23',3,4,'22:30:09','1500.00','Consulta segura',3,'Neurologia'),
(4,'2017-08-10',4,5,'00:30:19','300.00','Consulta Certa',4,'Gastrenterologia'),
(5,'2022-12-09',5,6,'10:30:25','700.00','Consulta Garantida',5,'Psquiatria'),
(6,'2015-12-17',1,2,'23:45:15','600.00','Consulta Fácil',6,'Cardiologia'),
(7,'2017-11-09',6,7,'13:30:15','500.00','Consulta Inteligente',7,'Clínica Geral'),
(8,'2015-04-08',6,7,'11:30:19','900.00','Viva Saúde',8,'Gastrenterologia'),
(9,'2020-10-04',7,8,'10:29:15','200.00','Saúde Protegida',9,'Dermatologia'),
(10,'2021-09-10',5,6,'23:54:19','1000.00','Cuide-se',10,'Clínica Geral'),
(11,'2018-08-04',4,2,'13:25:19','2500.00','Saúde Garantida',11,'Pediatria'),
(12,'2016-12-10',2,3,'14:30:15','600.00','Saúde Mais',12,'Psiquiatria'),
(13,'2016-01-10',5,1,'12:30:15','500.00','Protege Saúde',13,'Neurologia'),
(14,'2017-02-10',5,2,'10:57:15','800.00','Saúde Geral',14,'Dermatologia'),
(15,'2016-12-10',3,1,'12:10:15','750.00','Bem-estar',15,'Pediatria'),
(16,'2019-11-10',5,3,'15:10:15','500.00','Saúde para todos',16,'Gastrenterologia'),
(17,'2015-11-06',3,2,'09:34:15','900.00','Uni Saúde',17,'Cardiologia'),
(18,'2016-09-10',1,2,'16:15:16','600.00','Saúde Compartilhada',18,'Clínica Geral'),
(19,'2022-12-10',7,4,'11:56:15','1500.00','Sol Saúde',19,'Psiquiatria'),
(20,'2015-04-10',5,3,'12:35:19','200.00','My Saude',20,'Pediatria');
select* from consultas

INSERT INTO medicamentos (nome,medicamento_id) VALUES
('Paracetamol',1), ('Ibuprofeno',2), ('Amoxicilina',3), ('Omeprazol',4);
select * from medicamentos where medicamento_id = 1;

INSERT INTO consulta_medicamento (consulta_id, medicamento_id) VALUES
(1, 1), (1, 2),
(2,2), (2,2),
(3,1),(3,1),
-- Continue para as demais consultas que requerem mais de um medicamento

INSERT INTO tipos_quartos (descricao, valor_diaria) VALUES
('Apartamento', 300.00), ('Quarto Duplo', 200.00), ('Enfermaria', 100.00);



INSERT INTO enfermeiros (nome, coren,enfermeiro_id) VALUES
('Carlos Henrique', '123456','1'),
('Maria Silva', '789101','2'),
('Luis muriel','909090','3'),
('Luis muriel','909090','4'),
('Luis muriel','909090','5'),
('Luis muriel','909090','6'),
('Luis muriel','909090','7'),
('Luis muriel','909090','8');



INSERT INTO internacao_enfermeiro (internacao_id, enfermeiro_id) VALUES
(1, 1), (1, 2);
-- Associe ao menos dois enfermeiros por internação




