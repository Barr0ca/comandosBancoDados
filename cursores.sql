-- Dump é uma base de dados individual (backup lógico)
-- Backup físico e de Wals (Point-in-Time Recovery)
-- Comando pg_dump para realizar o backup Dump; Vai gerar um arquivo .sql com os comandos necessários para reconstrução da base de dados no momento do backup
-- Comando no Linux: pg_dump -f /.../bkp_academico.sql academico
-- Comando Windows: pg_dump -h localhost -U postgres -f "C:\...\bkp_academico.sql" DBAcademico

---------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION refAlunos() RETURNS void AS -- Criando função que declara um cursor BOUND 
$$
DECLARE 
	cursor_alunos CURSOR FOR SELECT * FROM alunos;
	aluno alunos%rowtype;
-- Acima declaração do cursor que retorna a linha em que o cursor está e armazena na variaável 'aluno'
BEGIN -- Começo da função
	OPEN cursor_alunos; -- Abre o cursor

	FETCH FIRST FROM cursor_alunos INTO aluno; -- Coloca o cursor no primeiro resultado (FIRST) 
	raise notice 'Nome: %', aluno.nom_alu;
	
	FETCH cursor_alunos INTO aluno; -- Coloca o cursor no resultado da sequência (PADRÃO), estava no primeiro foi pro segundo
	raise notice 'Nome: %', aluno.nom_alu;
	
	FETCH LAST FROM cursor_alunos INTO aluno; -- Coloca o cursor no último resultado (LAST)
	raise notice 'Nome: %', aluno.nom_alu;
	
	CLOSE cursor_alunos; -- Fecha o cursor
END; -- Fim da função
$$ LANGUAGE plpgsql;

SELECT refAlunos(); -- Chamando a função

---------------------------------------------------------------------------------------------------------

create or replace function refalunos2() returns void as 
$$
declare 
	cursor_alunos cursor for select * from alunos; -- Declaração de um cursor BOUND
begin
	for aluno in cursor_alunos loop -- Utilizando FOR, IN, LOOP para interar cada linha que for percorrida pelo cursor
	  raise notice 'Nome: %', aluno.nom_alu;
	end loop; -- Encerra o loop após o cursor chegar ao final
end;
$$ language plpgsql;
-- Podemos utilizar esse LOOP para fazer alterações, por exemplo, em cada uma das linha individualmente conforme é percorrida

SELECT refalunos2();

---------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION refRecuperacao() RETURNS void AS
$$
declare 
	cursor_recuperacao cursor for select distinct mat_alu from historicos_escolares where media < 6;
begin
	for aluno in cursor_recuperacao loop
	  raise notice 'Matrícula: %', aluno.mat_alu;
	end loop;
end;
$$ LANGUAGE plpgsql;

select mat_alu distinct from historicos_escolares where media < 6;

SELECT refRecuperacao();

---------------------------------------------------------------------------------------------------------
