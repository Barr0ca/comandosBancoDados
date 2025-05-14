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

select  pr.cod_disc_pre, COUNT(cod_disc) qtd from pre_requisitos pr 
group by pr.cod_disc_pre
order by qtd desc limit 1
		
-- Questão 5
		
select c.nom_curso , COUNT(a.mat_alu)
from cursos c full outer join alunos a 
on c.cod_curso = a.cod_curso 
group by c.nom_curso; 

-- Questão 6

select a.nom_alu from alunos a where a.mat_alu in (
	select tm.mat_alu  from turmas_matriculadas tm where tm.turma  in (
		select t.turma  from turmas t where t.cod_disc in (
			select d.cod_disc  from disciplinas d where d.qtd_cred > 5)
			)
		);
-- Correção da 6

select distinct a.mat_alu, a.nom_alu  from turmas_matriculadas tm 
inner join alunos a on tm.mat_alu = a.mat_alu
	where tm.cod_disc in (select d.cod_disc from disciplinas d where d.qtd_cred > 5
		);
	
-- Questão 7
	
select distinct a.mat_alu, a.nom_alu from turmas_matriculadas tm 
inner join alunos a on tm.mat_alu = a.mat_alu
	where tm.turma in (
		select tm.turma from turmas_matriculadas tm 
			where 2023 not in (select tm.ano  from turmas_matriculadas tm )
			);
			
-- Questão 8
			
select distinct a.mat_alu, a.nom_alu   from alunos a 
full outer join historicos_escolares he 
on a.mat_alu = he.mat_alu
where he.faltas > 3;

-- Questão 9

select distinct a.mat_alu, a.nom_alu, he.media from alunos a 
full outer join historicos_escolares he 
on a.mat_alu = he.mat_alu
where he.media > 7;

-- Questão 10

select a.mat_alu, a.nom_alu from alunos a 
where a.mat_alu in (
	select he.mat_alu from historicos_escolares he  where  he.cod_disc  in (
		select t.cod_disc from turmas t  where t.cod_prof in (
			select p.cod_prof  from professores p  where t.cod_prof = 205 )
		) 
	);

-- Questão 11

select * from alunos a 
where a.mat_alu in (
	select tm.mat_alu from turmas_matriculadas tm where )
	
	

