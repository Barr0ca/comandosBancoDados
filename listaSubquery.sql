-- Questão 1

-- Passo 1
select d.cod_disc  from disciplinas d where d.nom_disc like 'ALGORITMOS E ESTRUTURAS DE DADOS I';

-- Passo 2
select pr.cod_disc from pre_requisitos pr where pr.cod_disc_pre = 501869;

-- Passo 3
select d.cod_disc,d.nom_disc from disciplinas d where cod_disc in (
	select pr.cod_disc from pre_requisitos pr where cod_disc_pre = (
		select cod_disc from disciplinas d where nom_disc like 'ALGORITMOS E ESTRUTURAS DE DADOS I'
	)
);	

-- Questão 2

select * from disciplinas d 
inner join pre_requisitos pr on d.cod_disc = pr.cod_disc
where pr.cod_disc_pre = (
	select cod_disc from disciplinas d where nom_disc like 'ALGORITMOS E ESTRUTURAS DE DADOS I'
);

-- Questão 3

select  pr.cod_disc_pre, COUNT(cod_disc) 
from pre_requisitos pr 
group by cod_disc_pre 
order by COUNT(cod_disc) desc;

-- Questão 4 Incompleta

select * from disciplinas d 
where (select MAX(dependentes) 
		from (select COUNT(cod_disc) dependentes 
			from pre_requisitos pr group by cod_disc_pre)) = all (
				select pr.cod_disc_pre, COUNT(cod_disc) dependentes 
				from pre_requisitos pr group by cod_disc_pre)
	
select MAX(dependentes) d
from (select COUNT(cod_disc) dependentes 
		from pre_requisitos pr group by cod_disc_pre)
	

	
	
