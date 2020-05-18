create database Pineapple;

create table Projeto (
	nome_projeto varchar(50) primary key not null,
    data_inicio datetime primary key not null,
    data_termino datetime default null
);

create table Tarefa (
	nome_tarefa varchar(50) primary key not null,
    data_inicio datetime primary key not null,
    data_termino datetime default null
);

create table Recursos (
	cpf varchar(12) primary key not null,
	nome_recurso varchar(100) primary key,
    email varchar(50)
);

create table Rel_Tarefa_Recurso (
	rel_Tarefa varchar(12) primary key,
    rel_Recruso varchar(100) primary key,
    constraint foreign key (rel_recurso)
	references Recurso (cpf, nome_recurso) on delete restrict on update cascade,
    constraint foreign key (rel_tarefa)
	references Tarefa (nome_tarefa, data_Inicio) on delete restrict on update cascade
);

create table Rel_Tarefa_Projeto (
	rel_Tarefa varchar(50) primary key,
    rel_Projeto varchar(50) primary key,
    constraint foreign key (Rel_tarefa)
	references Tarefa (nome_tarefa, data_Inicio) on delete restrict on update cascade,
    constraint foreign key (rel_projeto) 
	references Projeto (nome_projeto, data_inicio) on delete restrict on update cascade
);

create table Rel_Projeto_Recurso (
	rel_Projeto varchar(50),
    rel_Recurso varchar(100),
    constraint foreign key (rel_projeto) 
	references Projeto (nome_projeto, data_inicio) on delete restrict on update cascade,
     constraint foreign key (rel_recurso)
	references Recurso (cpf, nome_recurso) on delete restrict on update cascade
);