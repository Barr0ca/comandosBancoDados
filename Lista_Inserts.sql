-- Questão 1 (a e b)
-- A
ALTER TABLE filme ADD CONSTRAINT taxa_aluguel_positivo CHECK(taxa_aluguel > 0);
ALTER TABLE filme ADD CONSTRAINT custo_reposicao_positivo CHECK(custo_reposicao > 0);
ALTER TABLE filme ADD CONSTRAINT taxa_positivo CHECK(taxa > 0);
-- B
ALTER TABLE filme ALTER COLUMN taxa_aluguel SET NOT NULL;
ALTER TABLE filme ALTER COLUMN custo_reposicao SET NOT NULL;
ALTER TABLE filme ALTER COLUMN taxa SET NOT NULL;
ALTER TABLE filme ALTER COLUMN titulo SET NOT NULL;
ALTER TABLE filme ALTER COLUMN idioma SET NOT NULL;
ALTER TABLE filme ALTER COLUMN ano_lancamento SET NOT NULL;
ALTER TABLE filme ALTER COLUMN tamanho SET NOT NULL;
-- Questão 2
ALTER TABLE idioma ALTER COLUMN nome SET NOT NULL;
-- Questão 3
ALTER TABLE ator ALTER COLUMN nome SET NOT NULL;
ALTER TABLE ator ALTER COLUMN sobrenome SET NOT NULL;
-- Questão 4
ALTER TABLE categoria ALTER COLUMN nome SET NOT NULL;
-- Questão 5 (a, b e c)
-- A
ALTER TABLE aluguel ALTER COLUMN data_aluguel SET NOT NULL;
ALTER TABLE aluguel ALTER COLUMN data_retorno SET NOT NULL;
-- B
ALTER TABLE aluguel ALTER COLUMN funcionario_id SET NOT NULL;
ALTER TABLE aluguel ALTER COLUMN cliente_id SET NOT NULL;
ALTER TABLE aluguel ALTER COLUMN inventario_id SET NOT NULL;
-- C
ALTER TABLE aluguel ADD CONSTRAINT data_retorno_valido CHECK(data_retorno > data_aluguel);
-- Questão 6 (a, b e c)
-- A
ALTER TABLE pagamento ALTER COLUMN valor SET NOT NULL;
-- B
ALTER TABLE pagamento ALTER COLUMN funcionario_id SET NOT NULL;
ALTER TABLE pagamento ALTER COLUMN aluguel_id SET NOT NULL;
ALTER TABLE pagamento ALTER COLUMN cliente_id SET NOT NULL;
-- C
ALTER TABLE pagamento ADD CONSTRAINT valor_positivo CHECK(valor > 0);
-- Questão 7
ALTER TABLE inventario ALTER COLUMN filme_id SET NOT NULL;
ALTER TABLE inventario ALTER COLUMN loja_id SET NOT NULL;
-- Questão 8 (a e b)
-- A
ALTER TABLE funcionario ALTER COLUMN nome SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN sobrenome SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN email SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN ativo SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN gerente SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN login SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN senha SET NOT NULL;
-- B
ALTER TABLE funcionario ALTER COLUMN endereco_id SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN loja_id SET NOT NULL;
-- Questão 9
ALTER TABLE pais ALTER COLUMN pais SET NOT NULL;
-- Questão 10
ALTER TABLE cidade ALTER COLUMN cidade SET NOT NULL;
ALTER TABLE cidade ALTER COLUMN pais_id SET NOT NULL;
-- Questão 11
ALTER TABLE endereco ALTER COLUMN endereco SET NOT NULL;
ALTER TABLE endereco ALTER COLUMN bairro SET NOT NULL;
ALTER TABLE endereco ALTER COLUMN cidade_id SET NOT NULL;
ALTER TABLE endereco ALTER COLUMN cep SET NOT NULL;
ALTER TABLE endereco ALTER COLUMN telefone SET NOT NULL;
-- Questão 12
ALTER TABLE cliente ALTER COLUMN loja_id SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN nome SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN sobrenome SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN email SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN endereco_id SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN ativo SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN data_criacao SET NOT NULL;
-- Questão 13
ALTER TABLE loja ALTER COLUMN loja_id SET NOT NULL;

--------------------------------------------------------------------------------------------------------

-- Testes
INSERT INTO filme(descricao, ano_lancamento, idioma, duracao_aluguel, taxa_aluguel, 
					tamanho, custo_reposicao, taxa, caracteristicas_especiais)	
		VALUES ('Musical e Infantil', '2011-01-01', 3, 5, 1, 8, 1, 1, 'Série');
INSERT INTO idioma(idioma_id) Values (7);
INSERT INTO ator(nome) 
	VALUES ('Tom');
INSERT INTO categoria(categoria_id) 
	VALUES (6);

SELECT * FROM IDIOMA;
SELECT * FROM categoria;
SELECT * FROM aluguel;
SELECT * FROM pagamento;
SELECT * FROM cidade;
