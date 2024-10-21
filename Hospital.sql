Create Database hospital;

use hospital;

Create table médicos(
id  int primary key auto_increment,
nome varchar(250) Not NULL,
especialidade varchar(100) NOT NULL,
CPF varchar(14) NOT NULL
);