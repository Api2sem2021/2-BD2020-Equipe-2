create database Pineapple;

use pineapple;

create table Projeto (
	nome_projeto varchar(50) not null,
    data_inicio TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    data_termino datetime,
    primary key(nome_projeto, data_inicio)
);

create table Tarefa (
	nome_tarefa varchar(50)  not null,
    data_inicio TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    data_termino datetime,
    primary key (nome_tarefa, data_inicio)
);

create table Recurso (
	cpf varchar(12)  not null,
	nome_recurso varchar(100),
    email varchar(50),
    primary key (cpf, nome_recurso)
);

create table Rel_Tarefa_Recurso (
	nome_tarefa varchar(12),
    cpf_recurso varchar(100),
    primary key (nome_tarefa, cpf_recurso)
);

create table Rel_Tarefa_Projeto (
	nome_tarefa varchar(50),
    nome_projeto varchar(50),
    primary key (nome_tarefa, nome_projeto)
);

create table Rel_Projeto_Recurso (
	nome_projeto varchar(50),
    cpf_recurso varchar(100),
    primary key (nome_projeto, cpf_recurso)
);

/* Problemas com a foreign key */

alter table rel_tarefa_recurso 
	add constraint foreign key rel_recurso (nome_recurso)
	references Recurso (cpf) on delete restrict on update cascade,
    add constraint foreign key rel_tarefa (nome_tarefa)
	references Tarefa (nome_tarefa) on delete restrict on update cascade;
    
alter table rel_tarefa_projeto
	add constraint foreign key (nome_tarefa)
	references Tarefa (nome_tarefa) on delete restrict on update cascade,
    add constraint foreign key (nome_projeto) 
	references Projeto (nome_projeto) on delete restrict on update cascade;
    
alter table rel_projeto_recurso
	add constraint foreign key (nome_projeto) 
	references Projeto (nome_projeto) on delete restrict on update cascade,
    add constraint foreign key (nome_recurso)
	references Recurso (cpf) on delete restrict on update cascade;
    
    