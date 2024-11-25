CREATE database hospital;

use hospital;

Create table especialidades(
especialidade_id int auto_increment primary key ,
nome  varchar(25) not null 
);

CREATE TABLE medicos(
medico_id int  AUTO_INCREMENT primary key,
nome varchar(55) NOT NULL,
cpf varchar (40) NOT NULL UNIQUE,
especialidade_id int,
foreign key (especialidade_id) references especialidades(especialidade_id) -- em termos explicitos fica assim: "A coluna especialidade_id da tabela medicos faz referemcia á tabela especialidades onde tem a chave primaria da especialidade_id"
);

Create Table if not exists medicos_especialidades(
medico_id int,
especialidade_id int,
foreign key(medico_id) references medicos(medico_id),
foreign key(especialidade_id) references especialidades(especialidade_id)
);

Create Table if not exists pacientes(
paciente_id int AUTO_INCREMENT primary key,
nome varchar (55)NOT NULL,
cpf varchar (40)NOT NULL,
data_de_nascimento date,
email varchar (25)
);

CREATE TABLE if not exists   consultas(
consulta_id int AUTO_INCREMENT PRIMARY Key,
data_consulta date,
especialidade_id int,
valor decimal(10,2),
convenio_id int,
medico_id int,
paciente_id int,
receita_id int,
foreign key(especialidade_id)references especialidades(especialidade_id),
foreign key (medico_id)references medicos(medico_id),
foreign key(paciente_id) references pacientes(paciente_id),
foreign key(convenio_id) references convenios(convenio_id),
foreign key(receita_id) references receita(receita_id)
);

create table convenios (
convenio_id int auto_increment primary key,
nome_do_convenio varchar(55) not null,
paciente_id int,
consulta_id int,
foreign key(paciente_id) references pacientes (paciente_id),
foreign key (consulta_id) references consultas(consulta_id)
);

create table enfermeiro(
enfermeiro_id int,
nome varchar (55),
coren varchar(8),
internacao_id int,
foreign key(internacao_id) references internacao(internacao_id)
);
create table internacao(
internacao_id int auto_increment primary key,
data_entrada date,
descricao_dos_procedimentos varchar(200),
data_alta date
);

CREATE TABLE receita(
receita_id int auto_increment primary key,
medicamento_receitado varchar(55),
quantidades_de_medicamentos varchar(255)
);

-- inserts do hospital --



 insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Luis Santos Gonzaga','42112345609','2000-02-17','luisgz@gmail.com');-- 1--
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Pedro Henrique Barbosa','45124256756','1995-07-09','PedroHB@gmail.com');-- 2 --         
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Caio de Jesus','13465045690','1999-12-05','ocaio@gmail.com');-- 3--
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Estér Rosa da Silva','25690820087','1995-07-27','esterabs@gmail.com');-- 4 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Bruno Silva','98765432100', '1998-03-22','bruno.silva@email.com' );-- 5 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Daniela Pereira', '46712978910' ,'1999-12-10', 'danielapereira@email.com'); -- 6 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Otávio Nunes', '78965412920', '1999-01-27', 'otavio.nunes@email.com'); -- 7 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Guilherme Aguiar Santos','32056021232','2002-07-06','GuiAguiar@gmail.com'); -- 8 --
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Marcela Souza da Silva','29054632159','1998-12-03','marcela@gmail.com'); -- 9 --
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Vanessa Camargo Santos de jesus','36045021033','2003-12-28','Vanessantos@gmail.com'); -- 10 --
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Paula Andrade Barbosa','13345633240','1997-02-09','paula@gmail.com');-- 11 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Henriete dos Santos Lima','25950067224','1997-02-16','henriete@gmail.com');-- 12 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Luis Pereira Júnior','13140035280','1999-12-10','Luis@gmail.com');-- 13 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Rosa Vieira','19050032270','1995-08-16','Rosas@gmail.com');-- 14 -- 
insert into pacientes(nome,cpf,data_de_nascimento,email) values
('Leonardo Oliveira','15695530070','1997-11-09','Leo@gmail.com');-- 15 --
-- insert especialidades
insert into especialidades(nome)values 
('pediatria'),('clínica geral'),('gastrenterologia'),('dermatologia'),('Cardiologia'),('Pediatria '),('Dermatologia ');
-- insert medicos
insert into  medicos(nome,cpf,especialidade_id) values
('Guilherme Rodrigues','13435529970',2);-- 1 --
insert into medicos(nome,cpf,especialidade_id) values
('Heitor Leite Silva','40519687081',5); -- 2 --
insert into medicos (nome,cpf,especialidade_id) values
('Gustavo Santos','74620856022',7); -- 3 --
insert into medicos (nome,cpf,especialidade_id) values
('Lucas Soares','12958342009',3);-- 4--
insert into medicos (nome,cpf,especialidade_id) values
('Aline das Dores','80947236047',2);-- 5 -- 
insert into medicos (nome,cpf,especialidade_id) values
('Pedro Lima da Silva','52069401058',1); -- 6 -- 
insert into medicos(nome,cpf,especialidade_id) values
('Silvana Aguiar ','36118724090',6);-- 7 --
insert into medicos(nome,cpf,especialidade_id) values
('Rafael Oliveira ','20453967003',5); -- 8 -- 
insert into medicos(nome,cpf,especialidade_id) values
('Paula Silveira','68429748066',4); -- 9 -- 
insert into medicos(nome,cpf,especialidade_id) values
('Marcelo ayumi','30846575072',5);-- 10 -- 
select * from medicos;
SELECT m.medico_id, m.nome, e.especialidade_id, e.nome AS especialidade_nome
FROM medicos m 
INNER JOIN especialidades e ON m.especialidade_id = e.especialidade_id  ;
select medico_id from medicos order by medico_id desc;
-- insert dos medicamentos
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Paracetamol','500 mg a 1.000 mg a cada 4 a 6 horas, não excedendo 4.000 mg por dia.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Amoxicilina','250 mg a 500 mg a cada 8 horas, podendo variar conforme a infecção.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Diazepam','2 mg a 10 mg, de 1 a 4 vezes ao dia, dependendo da condição tratada.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Fentanil','50 a 100 mcg a cada 1 a 2 horas, dependendo da dor.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Morfinasulfato','10 mg a 30 mg a cada 4 horas, conforme a intensidade da dor.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Loratadina','10 mg uma vez ao dia.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Heparina','Dependendo da condição, pode ser administrada em doses subcutâneas ou intravenosas, variando de 5.000 UI a 10.000 UI a cada 8 horas.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Vancomicina (antibiótico)','15 mg a 20 mg por kg de peso corporal, a cada 8 a 12 horas.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Insulina','Varia de acordo com a necessidade individual do paciente. Em geral, pode ser entre 4 a 10 unidades por dia, mas varia bastante.');
insert into receita(medicamento_receitado,quantidades_de_medicamentos) values
('Atorvastatina','0 mg a 80 mg uma vez ao dia, dependendo da necessidade de redução do colesterol.');


