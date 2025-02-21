-- Inicio da criacao das tabelas --
CREATE TABLE Idioma (
	idioma_id serial PRIMARY KEY,
	nome VARCHAR(80),
	ultima_atualizacao timestamp
);

CREATE TABLE Ator (
	ator_id serial PRIMARY KEY,
	nome VARCHAR(20),
	sobrenome VARCHAR(50),
	ultima_atualizacao timestamp
);

CREATE TABLE Categoria (
	categoria_id serial PRIMARY KEY,
	nome VARCHAR(50),
	ultima_atualizacao timestamp
);

CREATE TABLE Filme (
	filme_id serial PRIMARY KEY,
	titulo VARCHAR(50),
	descricao text,
	ano_lancamento date,
	idioma int REFERENCES idioma(idioma_id),
	duracao_aluguel int,
	taxa_aluguel int,
	tamanho numeric,
	custo_reposicao int,
	taxa int,
	ultima_atualizacao timestamp,
	caracteristicas_especiais text
);

CREATE TABLE ator_filme (
	filme_id int,
	ator_id int,
	FOREIGN KEY (filme_id) REFERENCES Filme(filme_id),
	FOREIGN KEY (ator_id) REFERENCES Ator(ator_id),
	ultima_atualizacao timestamp
);

CREATE TABLE categoria_filme (
	filme_id int,
	categoria_id int,
	FOREIGN KEY (filme_id) REFERENCES Filme(filme_id),
	FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id),
	ultima_atualizacao timestamp
);

-- Aula 31/01/2025 (faltei) --

CREATE TABLE pais(
	pais_id serial PRIMARY KEY,
	pais VARCHAR(50),
	ultima_atualizacao timestamp
);

CREATE TABLE cidade(
	cidade_id serial PRIMARY KEY,
	cidade text,
	pais_id int REFERENCES pais(pais_id),
	ultima_atualizacao timestamp
);

ALTER TABLE cidade ADD COLUMN cidade text; -- Correção 

CREATE TABLE endereco(
	endereco_id serial PRIMARY KEY,
	endereco text,
	endereco2 text,
	bairro text,
	cidade_id int REFERENCES cidade(cidade_id),
	cep varchar(30),
	telefone varchar(30),
	ultima_atualizacao timestamp
);

CREATE TABLE loja(
	loja_id serial PRIMARY KEY,
	endereco_id int REFERENCES endereco(endereco_id),
	ultima_atualizacao timestamp
);

CREATE TABLE inventario(
	inventario_id serial PRIMARY KEY,
	filme_id int REFERENCES filme(filme_id),
	loja_id int REFERENCES loja(loja_id),
	ultima_atualizacao timestamp
);

CREATE TABLE cliente(
	cliente_id serial PRIMARY KEY,
	nome text,
	sobrenome text,
	email text,
	ativo bool,
	loja_id int REFERENCES loja(loja_id),
	endereco_id int REFERENCES endereco(endereco_id),
	data_criacao timestamp,
	ultima_atualizacao timestamp
);

CREATE TABLE funcionario(
	funcionario_id serial PRIMARY KEY,
	nome text,
	sobrenome text,
	email text,
	ativo bool,
	gerente bool,
	login text,
	senha text,
	foto bytea,
	endereco_id int REFERENCES endereco(endereco_id),
	loja_id int REFERENCES loja(loja_id),
	ultima_atualizacao timestamp
);

CREATE TABLE pagamento(
	pagamento_id serial PRIMARY KEY,
	valor real,
	funcionario_id int REFERENCES funcionario(funcionario_id),
	cliente_id int REFERENCES cliente(cliente_id),
	aluguel_id int REFERENCES aluguel(aluguel_id),
	data_pagamento timestamp
);

CREATE TABLE aluguel(
	aluguel_id serial PRIMARY KEY,
	cliente_id int REFERENCES cliente(cliente_id),
	funcionario_id int REFERENCES funcionario(funcionario_id),
	inventario_id int REFERENCES inventario(inventario_id),
	data_aluguel timestamp,
	data_retorno timestamp,
	ultima_atualizacao timestamp
);

-- Aula 05/02/2025 --
INSERT INTO ator(nome, sobrenome)
	VALUES('Peter', 'Dinklage');
	
INSERT INTO ator(nome, sobrenome)
	VALUES('Kit', 'Harington');

INSERT INTO filme(titulo, descricao, ano_lancamento, idioma, duracao_aluguel, taxa_aluguel, 
					tamanho, custo_reposicao, taxa, caracteristicas_especiais)
	VALUES('Game of Trhones', 'Ha muito tempo...', '2011-01-01', 2, 3, 3, 1, 30, 5, 'Serie');
	-- ERROR PORQUE NÃO EXISTE UM IDIOMA COM ID CORRESPONDENTE 

INSERT INTO idioma(nome) 
	VALUES('Francês'), ('Italiano'), ('Inglês'), ('Japonês'), ('Espanhol'), ('Português');
	-- ADICIONANDO IDIOMAS A TABELA IDIOMA

INSERT INTO pais(pais) 
	VALUES('França'), ('Itália'), ('Estados Unidos'), ('Japão'), ('Espanha'), ('Brasil');

INSERT INTO cidade(cidade, pais_id) 
	VALUES('Viena', 2), ('Rio de Janeiro', 6), ('Hollywood', 3), ('Barcelona', 5), ('Washington', 3), ('Las Vegas', 3);

-- Exercicio
-- Q01
INSERT INTO idioma(nome) 
	VALUES('Francês'), ('Italiano'), ('Inglês'), ('Japonês'), ('Espanhol'), ('Português'), ('Chinês');
-- Q02
INSERT INTO filme(titulo, descricao, ano_lancamento, idioma, duracao_aluguel, taxa_aluguel, 
					tamanho, custo_reposicao, taxa, caracteristicas_especiais)
	VALUES('Interestelar', 'Ficção científica', '2014-01-01', 3, 5, 3, 1, 50, 5, 'Filme'),
		  ('V de Vingança', 'Super-heroi', '2005-01-01', 3, 5, 3, 1, 25, 5, 'Filme');

-- Aula 07/02/2005 --

SELECT 18; -- Pega o valor e projeta. Projeta 18
SELECT 5*4; -- Projeta 20 
SELECT 'EXEMPLO QUERY'; -- Projeta a string: EXEMPLO QUERY

SELECT * FROM filme;
SELECT titulo, descricao FROM filme;
SELECT titulo, descricao, (2 * taxa) FROM filme;
SELECT *, (2 * taxa) FROM filme;

SELECT * FROM ator;
SELECT ator_id FROM ator;
SELECT * FROM ator WHERE (ator_id = 5); -- Atores com ID 5
SELECT * FROM ator ORDER BY nome; -- Ordena as linhas, nesse caso por nome, ordem padrão crescente (A-Z)
SELECT * FROM ator ORDER BY nome, sobrenome; -- Utiliza dois critérios, primeiro nome e depois o sobrenome
SELECT * FROM ator ORDER BY nome DESC;  -- Ordena em ordem decrescente (Z-A)
SELECT * FROM ator WHERE nome iLIKE 'peter' -- Atores com nome 'peter'
SELECT * FROM ator WHERE nome iLIKE 'd%' -- Atores que comecam com 'D'
SELECT * FROM ator WHERE nome iLIKE '%d%' -- Atores que possuem 'd' no nome
-- OBSERVAÇÃO: O "i" em "iLIKE" significa "indiferente", tanto faz se é "d" minusculo ou "D" maiusculo --
SELECT nome, sobrenome FROM ator WHERE ator_id IN (
	SELECT ator_id FROM ator_filme af WHERE af.filme_id = (
		SELECT filme_id FROM filme WHERE filme.titulo iLIKE 'limitless%')
);

SELECT * FROM idioma;
SELECT * FROM idioma WHERE nome IN ('Francês', 'Português');
SELECT * FROM idioma WHERE nome NOT IN ('Francês', 'Português')
SELECT * FROM idioma WHERE idioma_id IN (1,6);
SELECT * FROM idioma WHERE idioma_id IN (
	SELECT idioma_id FROM idioma WHERE nome iLIKE 'francês' or nome iLIKE 'português'
);


SELECT * FROM ator WHERE ator_id IN(
	SELECT ator_id FROM ator_filme WHERE filme_id = (
		SELECT filme_id FROM filme WHERE titulo ilike 'limitless%'
	);
);

-- Aula 12/06/2025 --

SELECT * FROM ator_filme
SELECT ator_id, COUNT(filme_id) -- Função de agregação "COUNT()" conta os indícios dessa ocorrência 
	FROM ator_filme af
	GROUP BY ator_id
	HAVING COUNT(filme_id) > 1
	--ORDER BY COUNT(filme_id) DESC

SELECT filme_id, COUNT(ator_id)
	FROM ator_filme af 
	GROUP BY filme_id
	HAVING filme_id = 5

SELECT * FROM ator_filme LIMIT 10;

SELECT * FROM ator_filme OFFSET 10;

-- Exercício
-- Questão 1
SELECT * FROM IDIOMA;

-- Questão 2
SELECT nome, sobrenome FROM ator
	ORDER BY nome DESC
	
-- Questão 3
-- SELECT * FROM cidade
SELECT pais_id, COUNT(cidade_id) 
	FROM cidade
	GROUP BY pais_id
	
-- Questão 4
-- INSERT INTO cidade(cidade, pais_id) VALUES ('Mossoró', 6)
SELECT * FROM cidade WHERE cidade iLIKE 'mossoró'

-- Questão 5
-- SELECT * FROM ator
SELECT nome, sobrenome FROM ator
	WHERE nome iLIKE 'pet%'

-- Questão 6
-- SELECT * FROM filme
SELECT AVG(taxa_aluguel)
	FROM filme