select nome, max(salario) from funcionario group by nome;

select nome from funcionario where salario = (select max(salario) from funcionario);

select nome from funcionario where salario = max(salario) -- erro

select m.nome, c.data as qtd_consultas from medico m 
 left outer join consulta c on m.crm = c.crm;

select  c.data, p.nome from consulta c 
 right outer join paciente p on c.rg = p.rg;

select  m.nome as Medico,c.data as Data, p.nome as Paciente from medico m
 full outer join consulta c on c.crm = m.crm 
 full outer join paciente p on  p.rg = c.rg;
 
 select p.nome from paciente p where not exists (select * from consulta c where p.rg = c.rg and c.data between '2016-01-01' and '2016-12-31');
 
 CREATE VIEW paciente_view AS
	SELECT p.nome FROM paciente p, consulta c where p.rg = p.rg group by p.nome having count(c.coddoenca) > 1;

select * from paciente_view; 

drop view paciente_view