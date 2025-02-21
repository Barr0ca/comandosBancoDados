INSERT INTO ator(nome, sobrenome) 
	VALUES ('Tom', 'Cruise'), ('Dwayne', 'Johnson'), ('Johnny', 'Depp'), ('Leonardo', 'DiCaprio'), 
		   ('Will', 'Smith'), ('Robert', 'Downey Jr.'), ('Jason', 'Statham'), ('Adam', 'Sandler');

INSERT INTO filme(titulo, descricao, ano_lancamento, idioma, duracao_aluguel, taxa_aluguel, 
					tamanho, custo_reposicao, taxa, caracteristicas_especiais)	
	VALUES ('Game of Throne', 'Fantasia medieval épica', '2011-01-01', 3, 5, 5, 8, 50, 6, 'Série'), ('Inception', 'Ficção científica', '2010-07-16', 3, 5, 5, 1, 50, 6, 'Filme'), 
		   ('Breaking Bad', 'Drama e Crime', '2008-01-20', 3, 5, 5, 10, 50, 6, 'Série'), ('Gladiator', 'Ação e Drama', '2000-05-05', 3, 5, 4, 1, 50, 6, 'Filme'),
		   ('The Matrix', 'Ficção científica', '1999-03-31', 3, 5, 5, 1, 30, 6, 'Filme'), ('The Sopranos', 'Drama e Crime', '1999-01-10', 3, 5, 5, 6, 30, 6, 'Série'),
		   ('Chernobyl', 'Drama e História', '2019-05-06', 3, 5, 5, 10, 55, 6, 'Série'), ('The Dark Knight', 'Ação e Suspense', '2008-07-18', 3, 5, 5, 1, 60, 6, 'Filme'), 
		   ('Interstellar', 'Ficção científica', '2014-11-07', 3, 5, 5, 1, 50, 6, 'Filme'), ('The Wire', 'Drama e Crime', '2002-06-02', 3, 5, 5, 5, 60, 6, 'Série');

INSERT INTO categoria(nome) 
	VALUES ('Romance'),('Criminal'), ('Drama'), 
		   ('Ficção Científica'), ('Fantasia');

INSERT INTO cidade(cidade, pais_id) 
	VALUES('Viena', 2), ('Rio de Janeiro', 6), ('Hollywood', 3), 
		  ('Barcelona', 5), ('Washington', 3), ('Las Vegas', 3);

INSERT INTO idioma(nome) 
	VALUES('Francês'), ('Italiano'), ('Inglês'), ('Japonês'), ('Espanhol'), ('Português');

INSERT INTO pais(pais) 
	VALUES('França'), ('Itália'), ('Estados Unidos'), ('Japão'), ('Espanha'), ('Brasil');