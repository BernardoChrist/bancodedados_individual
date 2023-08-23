## Banco de Dados - Trabalho Final
### **Criação de uma MER**
<hr>

### Relacionamento: pessoa - carro
<hr>

### Contexto: A família Christ tem alguns carros, cada pessoa pode ter 1 ou mais carros, é o caso do Bernardo e da Simone, já o Andre e a Beatriz possuem apenas 1. É interessante que o banco de dados guarda características das pessoas e também dos carros.
<hr>

### Diagramas:
1. Modelo Conceitual

![Captura de tela 2023-08-21 003453](https://github.com/BernardoChrist/bancodedados_individual/assets/141193675/39f79bb7-f04f-44a3-bc44-8c4f467e764e)

<hr>
2. Modelo Lógico

![Captura de tela 2023-08-21 003716](https://github.com/BernardoChrist/bancodedados_individual/assets/141193675/8e5a4352-5315-4171-aa65-acfe8435e242)

<hr>
3. Modelo Físico

```
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
alter sequence public.pessoa_car_cd_id_seq rename to seq_id_pessoa;
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
alter sequence public.carro_car_cd_id_seq rename to seq_id_carro;
-- fazendo insert na entidade pessoa
insert
	into
	pessoa (pes_tx_nome,
	pes_dt_dn,
	pes_int_num_habilit)
values ('Beatriz',
'2001-07-01',
'456123789');
-- fazendo insert na entidade carro
insert
	into
	carro (car_tx_marca,
	car_tx_modelo,
	car_int_ano_modelo,
	fk_pes_cd_id)
values ('Fiat',
'500',
'2016',
'4');
-- select na entidade pessoa
select
	*
from
	pessoa;
-- select na entidade carro
select
	*
from
	carro;
-- criando index para otimizar os select
create index pessoa_nasc
on
pessoa (pes_tx_nome,
pes_dt_dn,
pes_int_num_habilit);
-- inner join para saber os carros dos usuários sem ser o Bernardo(id<>1)
select
	p.pes_tx_nome,
	c.car_tx_marca,
	c.car_tx_modelo
from
	pessoa p
inner join carro c on
	p.pes_cd_id = c.fk_pes_cd_id
where
	p.pes_cd_id <> 1
order by
	p.pes_tx_nome asc;
-- Contando os modelos de carros usando o group by
select
	count(fk_pes_cd_id),
	car_tx_modelo
from
	carro c
group by
	car_tx_modelo;
-- Selecionando apenas os carros do Bernardo(id=1), mais velho pro mais novo
select
	car_tx_modelo,
	car_int_ano_modelo
from
	carro c
where
	c.fk_pes_cd_id = 1
order by
	car_int_ano_modelo asc;
-- inner join para associar usuario, habilitação e modelo de carro
select
	p.pes_tx_nome,
	p.pes_int_num_habilit,
	c.car_tx_modelo
from
	pessoa p
inner join carro c on
	p.pes_cd_id = c.fk_pes_cd_id
order by
	p.pes_tx_nome asc;
```

![Captura de tela 2023-08-21 213839](https://github.com/BernardoChrist/bancodedados_individual/assets/141193675/949e8839-df2d-40c0-bc61-af5cf35e0e59)

<hr>

## Tecnologias utilizadas:
### - SQL; DBeaver; DrawIO
<hr>

## Elaborado por: 
[Bernardo Christ Estrella](https://github.com/BernardoChrist)
