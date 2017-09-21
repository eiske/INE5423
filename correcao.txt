-- 16)
select f.nome, f.rg from funcionario f where f.salario < 300 and (f.rg not in (select p.rg from paciente p)); -- equivale a - da algebra

-- 17)
select a.numeroa from ambulatorio a where a.numeroa not in (select distinct m.numeroa from medico m);

-- 18)
select f.nome, f.rg from funcionario f where f.rg in (select p.rg from paciente p);

-- 21)
select f.nome from funcionario f where f.rg in (select rg from paciente);

-- 22)
select p.nome, m.nome, c.data from paciente p 
LEFT JOIN consulta c ON (p.rg = c.rg)
LEFT JOIN medico m ON (m.crm = c.crm);

-- 23)
select p.nome, m.nome, c.data from paciente p
 left join consulta c on (c.rg = p.rg)
 full join medico m on (c.crm = m.crm);

-- 24)
select c.descricao from cidade c, funcionario f where c.codcidade = f.codcidade group by c.codcidade
having sum(f.salario) > 1000;

-- 25)
insert into cidade (descricao, UF) values ('Porto Alegre', 'RS');
select c.descricao, p.nome from cidade c
 left join paciente p on (p.codcidade = c.codcidade);
