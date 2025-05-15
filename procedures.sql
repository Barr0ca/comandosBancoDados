select * from alunos where mat_alu = 577318;
select * from turmas_matriculadas tm full outer join historicos_escolares he on tm.mat_alu = he.mat_alu where he.mat_alu = 934091;

create or replace procedure cadastrar_aluno(
	nome_aluno text,
	email_aluno text,
	matricula_aluno int,
	nascimento_aluno timestamp,
	cred int,
	mgp numeric
)
language sql as 
$$
	insert into alunos (nom_alu, email, mat_alu, dat_nasc, tot_cred, mgp)
	values (nome_aluno, email_aluno, matricula_aluno, nascimento_aluno, cred, mgp);
$$;

call cadastrar_aluno('Ian', 'ian@gmail.com', 577318, '2005-04-26', 100, 7);

create or replace procedure renomear_aluno(
	matricula int,
	nome text
)
language sql as
$$
	update alunos
	set nom_alu = nome
	where mat_alu = matricula; 
$$;

call renomear_aluno(577318, 'Galvão');

-- Exercício

-- Questão 1

create or replace procedure calcular_media(
	matricula int,
	cod_disciplina int
)
language sql as
$$
	select  nota_1, nota_2, nota_3, nota_4 from turmas_matriculadas tm where tm.mat_aluno = matricula and tm.cod_
$$;


-- Questão 2

create or replace procedure remove_aluno(
	matricula int
)
language sql as
$$
	delete from turmas_matriculadas
	where mat_alu = matricula;

	delete from historicos_escolares
	where mat_alu = matricula;

	delete from alunos
	where mat_alu = matricula;
$$;

call remove_aluno(577318);
