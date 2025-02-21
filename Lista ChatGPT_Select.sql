-- Lista sobre SELECT ChatGPT
-- Q1
SELECT titulo, ano_lancamento FROM filme; 
-- Q2
SELECT nome, sobrenome FROM ator WHERE sobrenome ILIKE 'smith';
-- Q3
SELECT titulo, ano_lancamento FROM filme ORDER BY ano_lancamento DESC;
-- Q9
SELECT AVG(taxa_aluguel) FROM filme;
-- Q10
SELECT titulo, taxa_aluguel	 
	FROM filme WHERE taxa_aluguel > (
		SELECT AVG(taxa_aluguel) FROM filme
		);
-- Q12
SELECT titulo, ano_lancamento
	FROM filme WHERE ano_lancamento BETWEEN '2010-01-01' AND '2026-01-01';