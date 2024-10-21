Create Database hospital;

use hospital;

Create table médicos(
id  int primary key auto_increment,
nome varchar(25) Not NULL,
especialidades varchar(100) NOT NULL,
CPF varchar(11) NOT NULL
);

create table paciente(
id int primary key auto_increment,
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
id int primary key auto_increment,
data_consulta date not null,
hora time  not null,
médico_id int,
paciente_id int,
valor_da_consulta decimal(10,2) not null,
nome_do_convenio varchar(25) not null,
numero_de_carteira int not null,
consulta_especialidade varchar(25) not null,
foreign key(médico_id) references médicos(id),
foreign key(paciente_id) references pacientes(id)
);
create table receita_médica(
id int primary key auto_increment,
medicamentos_receitados varchar(30) not null,
quantidade int not null,
instruções_de_usos varchar(300) not null,
médico_id int,
paciente_id int,
foreign key(médico_id) references médicos(id),
foreign key(paciente_id) references pacientes(id)
);
create table internações(
id int primary key auto_increment,
data_de_entrada date not null,
data_de_prev_de_alta  date not null,
data_alta date not null,
procedimento varchar(300) not null,
paciente_id int,
médico_id int,
foreign key(paciente_id) references pacientes(id),
foreign key(médico_id) references médicos(id)
);
create table quartos(
id int primary key auto_increment,
numeração int not null,
tipo_de_quarto varchar(40) not null,
tipo_de_quarto_id INT,
  FOREIGN KEY (tipo_de_quarto_id) REFERENCES tipo_de_quarto(id)

);
create table tipo_de_quarto(
id int primary key auto_increment,
descrição_do_quarto varchar(300) not null,
valor_diário decimal(10,2) not null   
);
create table enfermeiro(
id int primary key auto_increment,
nome varchar(25) not null,
CPF varchar(11) not null,
COREN varchar(100) not null,
paciente_id int,
foreign key(paciente_id) references pacientes(id)

);