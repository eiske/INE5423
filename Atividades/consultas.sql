--  1)
select m.nome from medico m where m.nome like '%Silva%';

-- 2)
select * from funcionario where nome like '_____%Silva%';

-- 3)
select * from paciente p where p.nome like 'C%';

/*
select a,
	case when a = 1 then 'um'
	     when a = 2 then 'dois'
	     else 'outro'
	end
from teste;
*/

-- 4)
select *,
 case when salario < 600 then 'salario baixo'
      when salario < 1200 then 'salario mediano'
      when salario >= 1200 then 'salario alto'
 end from funcionario;

-- 5)
select sum(a.capacidade), a.andar from ambulatorio a group by a.andar having sum(a.capacidade) > 100;

-- 6)
select count(c.crm) from medico m, consulta c where c.crm = m.crm and (date_part('month', c.data) = 5);

-- 7)
select max(data) - min(data), p.nome from consulta c, paciente p where c.rg = p.rg group by p.nome;

-- 8)
select max(data) - min(data), p.nome from consulta c, paciente p where c.rg = p.rg group by p.nome having (max(data) - min(data)) > 365;