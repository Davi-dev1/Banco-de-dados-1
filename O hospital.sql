CREATE database hospital;

use hospital;

Create table especialidades(
especialidade_id int auto_increment primary key,
nome varchar(25) not null
);


CREATE TABLE medicos(
medico_id int  AUTO_INCREMENT primary key,
nome varchar(55) NOT NULL,
cpf varchar (40) NOT NULL,
especialidade_id INT,
foreign key  (especialidade_id) references especialidades(especialidade_id) -- em termos explicitos fica assim: "A coluna especialidade_id da tabela medicos faz referemcia á tabela especialidades onde tem a chave primaria da especialidade_id"
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
nome_consulta varchar(55),
Hora time,
data_consulta date,
especialidade_id int,
medico_id int,
paciente_id int,
valor decimal(10,2),
convenio_id int,
foreign key(especialidade_id)references especialidades(especialidade_id),
foreign key (medico_id)references medicos(medico_id),
foreign key(paciente_id) references pacientes(paciente_id),
foreign key(convenio_id) references convenios(convenio_id)
);

create table convenios (
convenio_id int auto_increment primary key,
nome_do_convenio varchar(55) not null
);
select* from convenios

