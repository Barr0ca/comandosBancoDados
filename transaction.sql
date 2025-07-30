select * from alunos a where nom_alu ilike 'ian';
select * from alunos a where nom_alu ilike 'galvao';

begin transaction -- Inicio da transação

-- Executa o update enquanto a transação está ativa
	update alunos
		set nom_alu = 'Galvao'
	where mat_alu = 577318;
	
commit; -- Após o comando você pode dar commit para enviar para o banco de forma efetiva e fecha a transação em seguida 

rollback; -- Pode dar rollback enquanto a transação está ativa para voltar atrás em um comando