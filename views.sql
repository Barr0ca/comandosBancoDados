select a.nom_alu  from alunos a order by a.nom_alu  asc;
select distinct t.turma from turmas t where t.turma in (
	select tm.turma from turmas_matriculadas tm order by tm.media asc
);

create or replace view alunos_view as
select nom_alu
from alunos
order by nom_alu asc;

select * from alunos_view;

select * from alunos_view where nom_alu like 'A%';

create or replace view media_cursos as
select d.nom_disc, avg(h.media) from
	disciplinas d inner join historicos_escolares h
	on d.cod_disc = h.cod_disc
group by d.nom_disc
order by avg(h.media) desc;

select * from media_cursos;


-- Exercício
-- Q1
create or replace view boletim as
select a.mat_alu, a.nom_alu, he.cod_disc, he.semestre, a.mgp, he.faltas, he.situacao 
	from alunos a inner join historicos_escolares he 
	on a.mat_alu = he.mat_alu
	order by a.nom_alu asc

select * from boletim;

-- Q2
create or replace view prof_responsavel as
select 
	from alunos a inner join historicos_escolares he 
	on a.mat_alu = he.mat_alu
	order by a.nom_alu asc
