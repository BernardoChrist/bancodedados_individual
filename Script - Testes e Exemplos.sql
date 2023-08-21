--exclusão de tabela
drop table carros;

--listar os filmes com language_id igual a 1
select
	*
from
	film
where
	language_id = 1;

--listar os filmes com language_id diferente de 


--listar os filmes de acordo com a linguagem, juntando as duas tabelas. A tabela l tera as primeiras infromações
select
	*
from
	language l
inner join film f on
	l.language_id = f.language_id;
	
--listar os filmes com colunas especificas das tabelas film f e language l. É so trocar o * pelaas colunas desejadas
--o comando "order by 'f.title' asc" ordena a coluna especifica na tabela especifica em ordem crescente 
select
	l.name,
	f.title,
	f.release_year 
from
	language l
inner join film f on
	l.language_id = f.language_id
order by 
	f.title asc;