-- Questão 3
create or replace procedure CRUD_Filme(
	id integer,
	titulo_filme text,
	desc_filme text,
	ano_filme date,
	dur_aluguel integer,
	tx_aluguel numeric,
	tam int,
	custo_repo numeric,
	tx numeric,
	caract_esp text,
	id_idioma integer,
	opcao integer
) as 
$$
	begin
		if opcao == -1 then
			delete from filme 
			where filme_id = id;
		elsif opcao == 0 then
			update filme
			set titulo = titulo_filme, descricao = desc_filme, ano_lancamento = ano_filme, dur_aluguel = duracao_aluguel, 
				taxa_aluguel = tx_aluguel, tamanho = tam, custo_reposicao = custo_repo, taxa = tx, caracteristicas_especiais = caract_esp, idioma = id_idioma
			where filme_id = id;
		elsif opcao == 1 then
			insert into filme (titulo, descricao, ano_lancamento, dur_aluguel, taxa_aluguel, tamanho, custo_reposicao, taxa, caracteristicas_especiais, idioma)
			values (titulo_filme, desc_filme, ano_filme, dur_aluguel, tx_aluguel, tam, custo_repo, tx, caract_esp, id_idioma);
		else 
		end if;
	end;
$$ language plpgsql;

call CRUD_Filme(); -- Inserir valores para testar

-- Questão 5

