create table descricao (
 codcat integer,
 nome varchar(30),
 salariobase float,
 primary key(codcat)
);

create table funcionario (
 codf integer,
 nome varchar(50),
 cat integer,
 salariototal float,
 bonus float,
 ddd integer,
 fone integer,
 endereco varchar(80),
 primary key (codf),
 foreign key (cat) references descricao (codcat)
);

drop table funcionario
drop table descricao

insert into descricao values (10, 'Engenheiro Civil', 10000);
insert into descricao values (20, 'DBA', 15000);
insert into descricao values (30, 'Programador', 4000);

insert into funcionario values (1, 'Maria', 10, 11000, 1000, 48, 9912521, 'Av  Jornalista Rubens de Arruda Ramos, 1820,apto 205, Centro, Florianopolis');
insert into funcionario values (2, 'Pedro Silva', 30, 22000, 2000, 48, 8851256, 'Jornalista R. A. Ramos, 1250, apto 205,Centro, Florianopolis');
insert into funcionario values (3, 'Maria', 20, 5500, 500, 51, 87322569, 'Av  Jornalista Rubens de A. Ramos, 1820,apto 205 Bela Vista, Porto Alegre');
insert into funcionario values (4, 'Francisco', 20, 5500, 500, 48, 8632325, 'Av  Buzios,100,Jurere, Florianopolis');
insert into funcionario values (5, 'Luiza', 30, 22000, 2000, 48, 8888321, 'Av das Nações, 250, apto 405,Canasvieiras, Florianopolis');
insert into funcionario values (6, 'Pedro Borges', 10, 11000, 1000, 48, 99983215, 'Av Madre Maria Vilac, 50, apto 405,Canasvieiras, Florianopolis');

select distinct nome from funcionario -- Nao mostra duplicada

select nome, salariototal + 200 from funcionario

select * from funcionario, descricao where codcat = cat order by funcionario.nome, descricao.nome

select f.* from funcionario f, descricao d where f.cat = d.codcat

select nome, salariototal from funcionario where salariototal > 10000

select nome as nomefuncionario, (salariototal+200) as comissao from funcionario

select nome from funcionario where nome like '%Pedro%'

select nome from funcionario union select nome from descricao

select nome from funcionario intersect select nome from descricao

select avg (f.salariototal), d.nome from funcionario f, descricao d where f.cat = d.codcat group by d.nome

select count (*) as numTuplas from funcionario

select sum (salariototal) as somaSalario from funcionario

select count (f.*), d.nome from descricao d, funcionario f where f.cat = d.codcat group by d.nome

select d.nome, sum (f.salariototal) from funcionario f, descricao d where f.cat = d.codcat group by d.nome having sum (salariototal) > 30000

--3)
select f.nome, d.nome from funcionario f, descricao d where d.codcat = f.cat

--4)
select d.nome, sum(f.salariototal) as soma from descricao d, funcionario f where d.codcat = f.cat group by d.nome order by soma desc

--5)
select d.nome, count(f.*) as total, sum(f.salariototal) from descricao d, funcionario f where d.codcat = f.cat group by d.nome

--6)
select nome, fone from funcionario where salariototal = (select max(salariototal) from funcionario)

--7)
select d.nome from descricao d, funcionario f where d.codcat = f.cat group by d.nome having (sum(f.salariototal) > 30000)

--8)
select count(f.*) from funcionario f where  f.endereco like '%Canasvieiras%'

--9)
select count(f.*) from funcionario f where  f.endereco like '%Florianopolis%'

--10)
select f.nome from funcionario f where f.endereco like '%Centro%Florianopolis%'

--11)
select f.nome from funcionario f where f.endereco like '%Centro%'