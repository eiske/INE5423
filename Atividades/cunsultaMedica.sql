drop table funcionario;
drop table consulta;
drop table paciente;
drop table doenca;
drop table medico;
drop table especialidade;
drop table ambulatorio;
drop table cidade;

CREATE TABLE ambulatorio(
  numeroA serial,
  andar integer,
  capacidade integer,
  PRIMARY KEY (numeroA));

  CREATE TABLE cidade(
  codCidade serial,
  descricao varchar(30),
  UF varchar(2),
  PRIMARY KEY (codCidade));

  CREATE TABLE especialidade(
  codEsp serial,
  nome varchar(30),
  PRIMARY KEY (codEsp));

  CREATE TABLE medico(
  CRM integer,
  nome varchar(30),
  idade integer,
  codCidade integer,
  codEsp integer,
  numeroA integer,
  PRIMARY KEY (CRM),
  FOREIGN KEY (codCidade) REFERENCES cidade (codCidade) ON UPDATE RESTRICT ON DELETE RESTRICT,
  FOREIGN KEY (codEsp) REFERENCES especialidade (codEsp) ON UPDATE RESTRICT ON DELETE RESTRICT,
  FOREIGN KEY (numeroA) REFERENCES ambulatorio (numeroA) ON UPDATE RESTRICT ON DELETE RESTRICT);

  CREATE TABLE doenca(
  codDoenca serial,
  descricao varchar(30),
  CONSTRAINT pk_doenca PRIMARY KEY (codDoenca));

  CREATE TABLE paciente(
  RG integer,
  nome varchar(30),
  idade integer,
  codCidade integer,
  CONSTRAINT pk_paciente PRIMARY KEY (RG),
  CONSTRAINT paciente_cidade_fkey FOREIGN KEY (codCidade) REFERENCES cidade (codCidade) ON UPDATE RESTRICT ON DELETE RESTRICT);

  CREATE TABLE consulta(
  CRM integer,
  RG integer,
  data date,
  hora integer,
  codDoenca integer,
  CONSTRAINT pk_consulta PRIMARY KEY (CRM, RG, data),
  CONSTRAINT consulta_medico_fkey FOREIGN KEY (CRM) REFERENCES medico (CRM) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT consulta_paciente_fkey FOREIGN KEY (RG) REFERENCES paciente (RG) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT consulta_doenca_fkey FOREIGN KEY (codDoenca) REFERENCES doenca (codDoenca) ON UPDATE RESTRICT ON DELETE RESTRICT);

  CREATE TABLE funcionario(
  RG integer,
  nome varchar(30),
  idade integer,
  codCidade integer,
  salario float,
  CONSTRAINT pk_funcionario PRIMARY KEY (RG),
  CONSTRAINT funcionario_cidade_fkey FOREIGN KEY (codCidade) REFERENCES cidade (codCidade) ON UPDATE RESTRICT ON DELETE RESTRICT);

insert into cidade (descricao, uf) values ('Angelina', 'SC');
insert into cidade (descricao, uf) values ('Biguacu', 'SC');
insert into cidade (descricao, uf) values ('Palhoca', 'SC');
insert into cidade (descricao, uf) values ('São Jose', 'SC');
insert into cidade (descricao, uf) values ('Florianopolis', 'SC');

insert into especialidade (nome) values ('Ortopedia');
insert into especialidade (nome) values ('Infectologia');

insert into doenca (descricao) values ('sarampo');
insert into doenca (descricao) values ('rubeola');

insert into ambulatorio (andar, capacidade) values (1, 100);
insert into ambulatorio (andar, capacidade) values (1, 10);
insert into ambulatorio (andar, capacidade) values (2, 120);
insert into ambulatorio (andar, capacidade) values (3, 50);
insert into ambulatorio (andar, capacidade) values (4, 70);
insert into ambulatorio (andar, capacidade) values (4, 63);
insert into ambulatorio (andar, capacidade) values (5, 30);
insert into ambulatorio (andar, capacidade) values (5, 140);
insert into ambulatorio (andar, capacidade) values (5, 110);

insert into Medico values (12345, 'João da Silva', 39, 1, 2, 2);
insert into Medico values (12133, 'Camila da Silva Santos', 45, 2, 1, 1);
insert into Medico values (65464, 'João dos Santos', 35, 3, 2, 3);
insert into Medico values (23424, 'Jose da Silva', 55, 4, 1, 5);
insert into Medico values (85675, 'Joana Vieira', null, 3, 2, 7);

insert into paciente values (12312, 'Camila Vieira', 12, 1);
insert into paciente values (13123, 'Caio da Silva', 15, 2);
insert into paciente values (34345, 'Joana Pereira', 7, 3);
insert into paciente values (45645, 'Não Informado', 9, 4);
insert into paciente values (67867, 'Tiago Santos', 14, 5);
insert into paciente values (56757, 'Guilherme Vieira', 12, 1);
insert into paciente values (35435, 'Não Informado', 11, 2);
insert into paciente values (53453, 'Renata Salvador', 9, 3);
insert into paciente values (64758, 'Jessica Souza', 10, 4);
insert into paciente values (97865, 'Bianca Souza', 10, 5);

insert into consulta values (12345, 12312, date('2015-01-03'),  14 ,1);
insert into consulta values (12133, 13123, date('2015-01-05'),  15 ,1);
insert into consulta values (65464, 34345, date('2015-02-01'),  16 ,1);
insert into consulta values (65464, 45645, date('2015-02-03'),  17 ,1);
insert into consulta values (23424, 67867, date('2015-03-03'),  18 ,1);
insert into consulta values (85675, 56757, date('2015-04-22'),  20 ,2);
insert into consulta values (12345, 35435, date('2015-05-24'),  10 ,2);
insert into consulta values (12133, 53453, date('2015-05-23'),  11 ,2);
insert into consulta values (23424, 64758, date('2015-05-29'),  12 ,2);
insert into consulta values (85675, 97865, date('2015-05-30'),  14 ,2);

insert into consulta values (12345, 12312, date('2014-06-03'),  14 ,1);
insert into consulta values (12133, 13123, date('2014-06-05'),  15 ,1);
insert into consulta values (65464, 34345, date('2014-06-01'),  16 ,1);
insert into consulta values (65464, 45645, date('2014-07-03'),  17 ,1);
insert into consulta values (23424, 67867, date('2014-08-03'),  18 ,1);
insert into consulta values (85675, 56757, date('2014-08-22'),  20 ,2);
insert into consulta values (12345, 35435, date('2014-10-24'),  10 ,2);
insert into consulta values (12133, 53453, date('2014-11-23'),  11 ,2);
insert into consulta values (23424, 64758, date('2013-12-29'),  12 ,2);
insert into consulta values (85675, 97865, date('2013-12-30'),  14 ,2);

insert into funcionario values (2324234, 'João Ramos', 55, 1, 1200);
insert into funcionario values (3454464, 'Bianca Silva', 23, 2, 500);
insert into funcionario values (4343242, 'Ana Duarte', 34, 3, 550);
insert into funcionario values (4565756, 'Mariana Souza', 44, 4, 601);
insert into funcionario values (8678678, 'Daniel Ventura', 23, 5, 1900);
insert into funcionario values (4563434, 'João Ramos', 54, 5, 2000);

--1)
select * from paciente p, doenca d, consulta c where p.rg = c.rg and d.coddoenca = c.coddoenca and d.descricao = 'sarampo'

--2)
select * from medico m, especialidade e where e.nome = 'Ortopedia' and m.idade > 40

--3)
select * from consulta where crm != 46 or crm != 79

--4)
select * from ambulatorio where andar = 4 and (capacidade = 50 or numeroa > 10)

--5)
select m.nome, e.nome from medico m, especialidade e where m.codesp = e.codesp

-- 6)
select a.numeroa from ambulatorio a where a.andar = 3;

-- 7)
select c.crm as crmMedico, c.data from consulta c where c.rg = 122 or c.rg = 725

-- 8)
select numeroa from ambulatorio where capacidade > 50 and andar != 2 and andar != 4

-- 9)
select m.nome, c.data from medico m, consulta c where m.crm = c.crm;

-- 10)
select a.numeroa, a.capacidade, m.nome from ambulatorio a, medico m where a.andar = 5 and m.numeroa = a.numeroa;

-- 11)
select m.nome as medico, p.nome as paciente  from medico m, paciente p, cunsulta c where c.crm = m.crm and c.rg = p.rg

-- 12)
select m.nome from medico m, consulta c where m.crm = c.crm and m.codesp = 1 and c.data = '03-04-15' and (c.hora > 7 or c.hora < 12);

-- 13) ??
select p.nome from paciente p, consulta c, medico m where c.coddoenca = 1 and c.rg = p.rg and c.crm = m.crm and (m.nome = 'João da Silva' or m.nome = 'Camila da Silva Santos')

-- 14) ??
select distinct p.nome as paciente, m.nome as medico from paciente p, medico m
select nome from paciente union select nome from medico

-- 15)
select m.nome as medico, m.idade,
    p.nome as paciente, p.idade,
    f.nome as funcionario, f.idade
    from medico m, paciente p, funcionario f where m.codcidade = 5 and p.codcidade = 5 and f.codcidade = 5;

-- 16)
select f.nome, f.rg from funcionario f where f.salario < 300 and (f.rg not in (select p.rg from paciente p)); -- equivale a - da algebra

-- 17)
select a.numeroa from ambulatorio a where a.numeroa not in (select distinct m.numeroa from medico m);

-- 18)
select f.nome, f.rg from funcionario f where f.rg in (select p.rg from paciente p);

-- 19)
select f.nome, f.rg from funcionario f intersect select p.nome, p.rg from paciente p 

-- 20)
select f.nome from funcionario f join paciente p on f.rg = p.rg;

-- 21)
select f.nome from funcionario f where f.rg in (select rg from paciente);

-- 22)
select p.nome, m.nome, c.data from paciente p 
 LEFT JOIN consulta c ON (p.rg = c.rg)
 LEFT JOIN medico m ON (m.crm = c.crm);


-- 23)??
select p.nome, m.nome, c.data from paciente p
 left join consulta c on (c.rg = p.rg)
 full join medico m on (c.crm = m.crm);

-- 24)
select c.descricao from cidade c, funcionario f 
 where c.codcidade = f.codcidade
 group by c.codcidade 
 having sum(f.salario) > 1000;

 -- 25)
insert into cidade (descricao, UF) values ('Porto Alegre', 'RS');
select c.descricao, p.nome from cidade c
 left join paciente p on (p.codcidade = c.codcidade);