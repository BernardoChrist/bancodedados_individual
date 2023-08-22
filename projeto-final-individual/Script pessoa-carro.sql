-- criando o banco de dados
create database pessoacarro;

-- criando entidade pessoa
create table pessoa(
	pes_cd_id serial,
	pes_tx_nome varchar(50),
	pes_dt_dn date,
	pes_int_num_habilit integer,
	primary key (pes_cd_id)
);

-- renomeando sequence pes_cd_id
ALTER SEQUENCE public.pessoa_car_cd_id_seq RENAME TO seq_id_pessoa;

-- criando entidade carro
 create table carro(
 	car_cd_id serial,
 	car_tx_marca varchar(20),
 	car_tx_modelo varchar(20),
 	car_int_ano_modelo integer,
 	fk_pes_cd_id integer,
 	primary key (car_cd_id),
 	foreign key (fk_pes_cd_id) references pessoa(pes_cd_id)
 );
 
-- renomeando sequence car_cd_id
ALTER SEQUENCE public.carro_car_cd_id_seq RENAME TO seq_id_carro;

-- fazendo insert na entidade pessoa
insert into pessoa (pes_tx_nome, pes_dt_dn, pes_int_num_habilit)
values ('Beatriz', '2001-07-01', '456123789');

-- fazendo insert na entidade carro
insert into carro (car_tx_marca, car_tx_modelo, car_int_ano_modelo, fk_pes_cd_id)
values ('Fiat', '500', '2016', '4');

-- select na entidade pessoa
select * from pessoa;

-- select na entidade carro
select * from carro;

-- criando index para otimizar os select
create index pessoa_nasc
on pessoa (pes_tx_nome, pes_dt_dn, pes_int_num_habilit);

-- inner join para saber os carros dos usuários sem ser o Bernardo(id<>1)
select p.pes_tx_nome, c.car_tx_marca, c.car_tx_modelo
from pessoa p 
inner join carro c on p.pes_cd_id=c.fk_pes_cd_id
where p.pes_cd_id <> 1
order by p.pes_tx_nome asc;

-- Contando os modelos de carros usando o group by
select count(fk_pes_cd_id), car_tx_modelo 
from carro c 
group by car_tx_modelo;

-- Selecionando apenas os carros do Bernardo(id=1), mais velho pro mais novo
select car_tx_modelo, car_int_ano_modelo from carro c
where c.fk_pes_cd_id = 1
order by car_int_ano_modelo asc;

-- inner join para associar usuario, habilitação e modelo de carro
select p.pes_tx_nome, p.pes_int_num_habilit, c.car_tx_modelo  
from pessoa p 
inner join carro c on p.pes_cd_id=c.fk_pes_cd_id
order by p.pes_tx_nome asc;
