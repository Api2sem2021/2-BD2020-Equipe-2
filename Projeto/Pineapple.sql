create database Pineapple;

use pineapple;

create table Projeto (
	nome_projeto varchar(50) not null,
    data_inicio varchar(25),
    data_termino varchar(25),
    primary key(nome_projeto, data_inicio)
);

create table Tarefa (
	nome_tarefa varchar(50)  not null,
    data_inicio varchar(25),
    data_termino varchar(25),
    primary key (nome_tarefa)
);

create table Recurso (
	cpf varchar(12)  not null,
	nome_recurso varchar(100),
    email varchar(50),
    primary key (cpf)
);

create table Rel_Tarefa_Recurso (
	nome_tarefa varchar(50),
    cpf_recurso varchar(12),
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

/* Alter tables prar adição de chave estrangeira */

alter table rel_tarefa_recurso 
	add constraint foreign key rel_recurso (cpf_recurso)
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
    add constraint foreign key (cpf_recurso)
	references Recurso (cpf) on delete restrict on update cascade;
    
    /* Inserts e selects para testes */
insert into recurso(cpf, nome_recurso) values('44265623820', 'Marcos');
insert into tarefa(nome_tarefa) values('Insert Banco', '23/05/2020');
insert into projeto(nome_projeto) values('Abacachassa', '28/05/2021');

insert into rel_tarefa_recurso(nome_tarefa, cpf_recurso) select nome_tarefa, cpf from tarefa, recurso;
insert into rel_projeto_recurso(nome_projeto, cpf_recurso) select nome_projeto, cpf from projeto, recurso;
insert into rel_tarefa_projeto(nome_tarefa, nome_projeto) select nome_tarefa, nome_projeto from tarefa, projeto;

select * from recurso;
select * from tarefa;
select * from projeto;

select * from rel_tarefa_recurso;
select * from rel_projeto_recurso;
select * from rel_tarefa_projeto;