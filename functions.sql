create or replace function add(integer, integer) returns integer as 
$$
	select $1 + $2;
$$ language sql
immutable strict;

select add(-10, 10);

create or replace function increment(i integer) returns integer as 
$$
	begin
		return i + 1;
	end;
$$ language plpgsql;

select increment(7);

create or replace function select_alunos(mat integer) returns alunos language sql as
$$ 
	select * from alunos where mat_alu = mat;
$$;

select select_alunos(911094);

create or replace function nome_alunos(mat integer) returns text as
$$ 
	select nom_alu from alunos where mat_alu = mat;
$$ language sql;

select nome_alunos(911094);


create or replace function insert_alunos(cod_curso int, dat_nasc date, tot_cred int, 
    mgp numeric, nom_alu text, email text) returns int as
$$
    insert into alunos(cod_curso, dat_nasc, tot_cred, mgp, nom_alu, email)
    values($1,$2,$3,$4,$5,$6)
    returning mat_alu;
$$ language sql;


create or replace function registar_media_aluno(nome text, n1 int, n2 int, n3 int, n4 int) returns void as
$$
	declare
	  id integer;
	  media numeric;
	begin
		media := (n1+n2+n3+n4)/4;
		
		select mat_alu into id from alunos where nom_alu '%' || nom_alu || '%';
		
		if not found then
			raise exception 'Não foi encontrado o(a) aluno %', nome;
		else
			update alunos a 
				set mgp = media
			where mat_alu = id;
		end if;
	end;
$$ language plpgsql;

select registrar_media_aluno('Benetti', 4, 5, 8, 8);