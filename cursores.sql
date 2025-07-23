create or replace function refAlunos()
returns void as
$$
declare
	exemplo_cursor_alunos cursor for select * from alunos;
	aluno alunos%rowtype;
begin
	open exemplo_cursor_alunos;
	
	fetch first from exemplo_cursor_alunos into aluno;
	raise notice 'Nome: %', aluno.nom_alu;
	
	fetch exemplo_cursor_alunos into aluno;
	raise notice 'Nome: %', aluno.nom_alu;

	fetch last from exemplo_cursor_alunos into aluno;
	raise notice 'Nome: %', aluno.nom_alu;

	close exemplo_cursor_alunos;
end;
$$ language plpgsql;

select refAlunos();

-----------------------------------

create or replace function refAlunos2()
returns void as
$$
declare
	exemplo_cursor_alunos cursor for select * from alunos;
begin
	for aluno in exemplo_cursor_alunos loop
		raise notice 'Nome: %', aluno.nom_alu;
	end loop;
end;
$$ language plpgsql;

select refAlunos2();

-----------------------------------

create or replace function refReprov()
returns void as
$$
declare
	cursor_reprov_HE cursor for select distinct he.mat_alu  from historicos_escolares he  where he.media < 6 order by he.mat_alu asc;
begin
	for aluno in cursor_reprov_HE loop
		raise notice 'Matrícula: %', aluno.mat_alu;
	end loop;
end;
$$ language plpgsql;

select refReprov()

-----------------------------------

create or replace function refReprov()
returns void as
$$
declare
	cursor_reprov_HE cursor for select distinct he.mat_alu  from historicos_escolares he  where he.media < 6 order by he.mat_alu asc;
begin
	for aluno in cursor_reprov_HE loop
		raise notice 'Matrícula: %', aluno.mat_alu;
	end loop;
end;
$$ language plpgsql;

select refReprov()

-----------------------------------

select distinct he.mat_alu  from historicos_escolares he  where he.media < 6 order by he.mat_alu asc;

select * from historicos_escolares he; 
