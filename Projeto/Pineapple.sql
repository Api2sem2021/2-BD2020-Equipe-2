create database Pineapple;

create table Projeto (
	Nome_projeto varchar(50) primary key not null,
    Data_inicio datetime primary key not null,
    Data_termino datetime default null
);

create table Tarefa (
	Nome_tarefa varchar(50) primary key not null,
    Data_inicio datetime primary key not null,
    Data_termino datetime default null
);

create table Recursos (
	cpf varchar(12) primary key not null,
	Nome_recurso varchar(100) primary key,
    email varchar(50)
);