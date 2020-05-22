create database Pineapple;

use pineapple;

create table Projeto (
	nome_projeto varchar(50) not null,
    data_inicio datetime not null,
    data_termino datetime default null,
    primary key(nome_projeto, data_inicio)
);

create table Tarefa (
	nome_tarefa varchar(50)  not null,
    data_inicio datetime not null,
    data_termino datetime default null,
    primary key (nome_tarefa, data_inicio)
);

create table Recurso (
	cpf varchar(12)  not null,
	nome_recurso varchar(100),
    email varchar(50),
    primary key (cpf, nome_recurso)
);

create table Rel_Tarefa_Recurso (
	rel_tarefa varchar(12),
    rel_recurso varchar(100),
    primary key (rel_tarefa, rel_recurso)
);

create table Rel_Tarefa_Projeto (
	rel_tarefa varchar(50),
    rel_projeto varchar(50),
    primary key (rel_tarefa, rel_projeto)
);

create table Rel_Projeto_Recurso (
	rel_projeto varchar(50),
    rel_recurso varchar(100),
    primary key (rel_projeto, rel_recurso)
);

/* Problemas com a foreign key */

alter table rel_tarefa_recurso 
	add constraint foreign key (rel_recurso)
	references Recurso (cpf, nome_recurso) on delete restrict on update cascade, 
    add constraint foreign key (rel_tarefa)
	references Tarefa (nome_tarefa, data_Inicio) on delete restrict on update cascade;
    
alter table rel_tarefa_projeto
	add constraint foreign key (Rel_tarefa)
	references Tarefa (nome_tarefa, data_Inicio) on delete restrict on update cascade,
    add constraint foreign key (rel_projeto) 
	references Projeto (nome_projeto, data_inicio) on delete restrict on update cascade;
    
alter table re_projeto_recurso
	add constraint foreign key (rel_projeto) 
	references Projeto (nome_projeto, data_inicio) on delete restrict on update cascade,
    add constraint foreign key (rel_recurso)
	references Recurso (cpf, nome_recurso) on delete restrict on update cascade;
    
    