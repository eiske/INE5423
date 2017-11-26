--drop table Aluno;

create table Aluno (
 codAluno integer,
 nome varchar(50),
 codCurso integer,
 Primary key (codAluno),
 Foreign key (codCurso) references Curso (codCurso)
 on delete restrict 
 on update restrict
);

create table Aluno (
 codAluno integer,
 nome varchar(50),
 codCurso integer,
 Primary key (codAluno),
 Foreign key (codCurso) references Curso (codCurso)
 on delete cascade 
 on update set null
);

insert into Curso values (1, 'Computacao'); -- 6

insert into Aluno values (1,'Eiske',1); -- 7

delete from curso; -- 8

update Curso set codCurso = 60; -- 9

update Curso set codCurso = 50; -- 12

select * from Aluno; -- 13

delete from aluno
