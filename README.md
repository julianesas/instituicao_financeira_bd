# Banco de dados de uma instituição financeira

Autora: Juliane Simão de Andrade  
Data: 28/11/2021

## Sobre o projeto 

Projeto desenvolvido no treinamento do Banco bv/gama com objetivo criar um schema de banco de dados de uma instituição financeira, considerando a parte de cadastro de clientes e contas. Cabe ressaltar, que neste projeto buscou-se simplificar o modelo, limitando a modelagem em apenas 5 entidades, já que o objetivo principal era trazer estas tabelas para um banco de dados não relacional e praticar consultas através de `Selects`. 
Inicialmente foi desenvolvido um Modelo de Entidade de Relacionamento  no **dbdesigner** com 5 endidades: Agência, conta, cliente, endereço, movimentação.  Posteriormente, através do banco Maria DB, as tabelas foram criadas e populadas utilizando a linguagem `sql`.
Após a população das tabelas, elas foram extraídas em arquivos com formato CSV e importadas no Databricks, onde foram criadas tabelas desnormalizadas e a partir delas respondidas algumas perguntas de negócio.

## Modelo de entidade de relacionamento - MER

O MER foi desenvolvido considerando 5 endidades:
- agencia;
- conta;
- cliente;
- movimentação;
- endereço.

### Relações

Endereço pertence a cliente(1:N), Endereço pertence a Agência(1:N), Cliente tem conta (1:N), agencia tem conta (1:N), Conta tem movimentação (1:N)

![instituicao_financeira](https://user-images.githubusercontent.com/77210732/143798201-91c795c5-69f0-4b64-a812-f92a35bf7484.png)

## Criação das tabelas no databricks a partir dos arquivos extraídos do Maria DB em formato CSV.

### Criando o schema instituicao_financeira_bd
```sql
  
CREATE DATABASE IF NOT EXISTS instituicao_financeira_bd;
```

### Selecionando o schema instituicao_financeira_bd

```sql
  
USE instituicao_financeira_bd;
```
### Criando a tabela agencia

```sql
  
CREATE TABLE IF NOT EXISTS agencia(
  id_agencia int,
  nome string,
  complemento string,
  id_endereco int
)
USING CSV
LOCATION "dbfs:/FileStore/tables/tabelas_instituicao_financeira/agencia.csv"
OPTIONS (header "true", inferSchema "false");
```

### Consultando tabela Agencia

```sql
SELECT * FROM agencia;
```

<table>													
<tr>	<th>	id_agencia	</th>	<th>	nome	</th>	<th>	complemento	</th>	<th>	id_endereco	</th>	</tr>
<tr>	<td>	1	</td>	<td>	Agencia da Torre	</td>	<td>	numero 29	</td>	<td>	1	</td>	</tr>
<tr>	<td>	2	</td>	<td>	Agencia Manaíra	</td>	<td>	numero 49	</td>	<td>	2	</td>	</tr>
<tr>	<td>	3	</td>	<td>	Agência Manauara	</td>	<td>	numero 66	</td>	<td>	3	</td>	</tr>
</table>													

### Criando tabela cliente
```sql
CREATE TABLE IF NOT EXISTS cliente(
  id_cliente int,
  nome string,
  sobrenome string,
  cpf string,
  data_nascimento timestamp,
  data_cadastro timestamp,
  complemento_endereco string,
  telefone string,
  status string,
  id_endereco int
)
USING CSV
LOCATION "dbfs:/FileStore/tables/tabelas_instituicao_financeira/cliente.csv"
OPTIONS (header "true", inferSchema "false")
```
### Consultando tabela cliente
```sql
SELECT * FROM cliente;
```

<table>																														
<tr>	<th>	id_cliente	</th>	<th>	nome	</th>	<th>	sobrenome	</th>	<th>	cpf	</th>	<th>	data_nascimento	</th>	<th>	data_cadastro	</th>	<th>	complemento_endereco	</th>	<th>	telefone	</th>	<th>	status	</th>	<th>	id_endereco	</tr>
<tr>	<td>	1	</td>	<td>	Arthur	</td>	<td>	Silva	</td>	<td>	11122233344	</td>	<td>	1990-06-30T00:00:00.000+0000	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	casa 29	</td>	<td>	83999992568	</td>	<td>	ativo	</td>	<td>	4	</tr>
<tr>	<td>	2	</td>	<td>	Marcos	</td>	<td>	Simão	</td>	<td>	11122233355	</td>	<td>	1965-02-01T00:00:00.000+0000	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	casa29	</td>	<td>	83999668877	</td>	<td>	ativo	</td>	<td>	4	</tr>
<tr>	<td>	3	</td>	<td>	Juliane	</td>	<td>	Andrade	</td>	<td>	11122233366	</td>	<td>	1994-12-10T00:00:00.000+0000	</td>	<td>	2015-08-15T00:00:00.000+0000	</td>	<td>	numero 1965	</td>	<td>	83986995544	</td>	<td>	ativo	</td>	<td>	2	</tr>
<tr>	<td>	4	</td>	<td>	Barbara	</td>	<td>	Oliveira	</td>	<td>	11122233377	</td>	<td>	1992-12-30T00:00:00.000+0000	</td>	<td>	2015-05-20T00:00:00.000+0000	</td>	<td>	casa 19 quadra 3	</td>	<td>	92966558877	</td>	<td>	ativo	</td>	<td>	7	</tr>
<tr>	<td>	5	</td>	<td>	Bruno	</td>	<td>	Costa	</td>	<td>	11122233388	</td>	<td>	1980-07-30T00:00:00.000+0000	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	casa 88	</td>	<td>	92955887744	</td>	<td>	ativo	</td>	<td>	8	</tr>
<tr>	<td>	6	</td>	<td>	Luciana	</td>	<td>	Menezes	</td>	<td>	11122233399	</td>	<td>	1950-09-30T00:00:00.000+0000	</td>	<td>	1990-09-17T00:00:00.000+0000	</td>	<td>	casa 29	</td>	<td>	87966887722	</td>	<td>	ativo	</td>	<td>	1	</tr>
<tr>	<td>	7	</td>	<td>	Marina	</td>	<td>	Mendes	</td>	<td>	11122233410	</td>	<td>	2000-05-25T00:00:00.000+0000	</td>	<td>	2020-07-25T00:00:00.000+0000	</td>	<td>	condominio joaquim melo	</td>	<td>	83988775566	</td>	<td>	ativo	</td>	<td>	5	</tr>
<tr>	<td>	8	</td>	<td>	Fernando	</td>	<td>	Silva	</td>	<td>	11122233421	</td>	<td>	1990-04-15T00:00:00.000+0000	</td>	<td>	2020-05-17T00:00:00.000+0000	</td>	<td>	casa 75	</td>	<td>	81977558822	</td>	<td>	inativo	</td>	<td>	6	</tr>
<tr>	<td>	9	</td>	<td>	Flavio	</td>	<td>	Andrade	</td>	<td>	11122233432	</td>	<td>	1989-07-30T00:00:00.000+0000	</td>	<td>	2010-08-02T00:00:00.000+0000	</td>	<td>	casa 89	</td>	<td>	81966332255	</td>	<td>	ativo	</td>	<td>	10	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim	</td>	<td>	Costa	</td>	<td>	11122233443	</td>	<td>	1970-01-05T00:00:00.000+0000	</td>	<td>	1994-10-13T00:00:00.000+0000	</td>	<td>	casa 77	</td>	<td>	81988445533	</td>	<td>	ativo	</td>	<td>	9	</tr>
</table>

### Criando tabela conta
```sql
CREATE TABLE IF NOT EXISTS conta(
  id_conta int,
  numero_conta string,
  digito string,
  data_abertura timestamp,
  tipo_conta string,
  id_agencia int,
  id_cliente int,
  status string
)
USING CSV
LOCATION "dbfs:/FileStore/tables/tabelas_instituicao_financeira/conta.csv"
OPTIONS (header "true", inferSchema "false")
```																						
### Consultando tabela conta

```sql
SELECT * FROM conta;
```
<table>																								
<tr>	<th>	id_conta	</th>	<th>	numero_conta	</th>	<th>	digito	</th>	<th>	data_abertura	</th>	<th>	tipo_conta	</th>	<th>	id_agencia	</th>	<th>	id_cliente	</th>	<th>	status	</tr>
<tr>	<td>	1	</td>	<td>	234156	</td>	<td>	x	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	1	</td>	<td>	1	</td>	<td>	ativo	</tr>
<tr>	<td>	2	</td>	<td>	234567	</td>	<td>	1	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	1	</td>	<td>	2	</td>	<td>	ativo	</tr>
<tr>	<td>	3	</td>	<td>	127788	</td>	<td>	2	</td>	<td>	2015-08-15T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	1	</td>	<td>	3	</td>	<td>	ativo	</tr>
<tr>	<td>	4	</td>	<td>	335298	</td>	<td>	3	</td>	<td>	2015-05-20T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	2	</td>	<td>	4	</td>	<td>	ativo	</tr>
<tr>	<td>	5	</td>	<td>	145377	</td>	<td>	5	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	2	</td>	<td>	5	</td>	<td>	ativo	</tr>
<tr>	<td>	6	</td>	<td>	987765	</td>	<td>	7	</td>	<td>	1990-09-17T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	2	</td>	<td>	6	</td>	<td>	ativo	</tr>
<tr>	<td>	7	</td>	<td>	435677	</td>	<td>	2	</td>	<td>	2020-07-25T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	3	</td>	<td>	7	</td>	<td>	ativo	</tr>
<tr>	<td>	8	</td>	<td>	223670	</td>	<td>	1	</td>	<td>	2021-05-17T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	3	</td>	<td>	8	</td>	<td>	inativo	</tr>
<tr>	<td>	9	</td>	<td>	998755	</td>	<td>	4	</td>	<td>	2010-08-02T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	3	</td>	<td>	9	</td>	<td>	ativo	</tr>
<tr>	<td>	10	</td>	<td>	654848	</td>	<td>	6	</td>	<td>	1994-10-13T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	3	</td>	<td>	10	</td>	<td>	ativo	</tr>
<tr>	<td>	11	</td>	<td>	345598	</td>	<td>	2	</td>	<td>	2000-10-13T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	3	</td>	<td>	10	</td>	<td>	ativo	</tr>
<tr>	<td>	12	</td>	<td>	224376	</td>	<td>	3	</td>	<td>	2016-05-20T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	2	</td>	<td>	4	</td>	<td>	ativo	</tr>
<tr>	<td>	13	</td>	<td>	123890	</td>	<td>	9	</td>	<td>	2001-12-25T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	2	</td>	<td>	5	</td>	<td>	ativo	</tr>
<tr>	<td>	14	</td>	<td>	996534	</td>	<td>	x	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	1	</td>	<td>	1	</td>	<td>	inativo	</tr>
</table>																								
### Criando Tabela endereço

```sql
CREATE TABLE IF NOT EXISTS endereco(
  id_endereco int,
  cep string,
  logradouro string,
  cidade string,
  uf string
)
USING CSV
LOCATION "dbfs:/FileStore/tables/tabelas_instituicao_financeira/endereco.csv"
OPTIONS (header "true", inferSchema "false");
```
### Consultando tabela endereço 

```sql
SELECT * FROM endereco;
```

<table>																
<tr>	<th>	id_endereco	</th>	<th>	cep	</th>	<th>	logradouro	</th>	<th>	cidade	</th>	<th>	uf	</th>	</tr>
<tr>	<td>	1	</td>	<td>	58260001	</td>	<td>	Rua joaquim melo	</td>	<td>	Recife	</td>	<td>	pe	</td>	</tr>
<tr>	<td>	2	</td>	<td>	55023699	</td>	<td>	Avenida São Judas Tadeu	</td>	<td>	João Pessoa	</td>	<td>	pb	</td>	</tr>
<tr>	<td>	3	</td>	<td>	58774411	</td>	<td>	Rua Barros Peixoto	</td>	<td>	Manaus	</td>	<td>	am	</td>	</tr>
<tr>	<td>	4	</td>	<td>	55982311	</td>	<td>	Rua Atistides costa	</td>	<td>	João pessoa	</td>	<td>	pb	</td>	</tr>
<tr>	<td>	5	</td>	<td>	55982311	</td>	<td>	Rua Clovis pessoa	</td>	<td>	João pessoa	</td>	<td>	pb	</td>	</tr>
<tr>	<td>	6	</td>	<td>	23238292	</td>	<td>	Rua Carmelita	</td>	<td>	Recife	</td>	<td>	pe	</td>	</tr>
<tr>	<td>	7	</td>	<td>	44559922	</td>	<td>	Rua Manoel Peixoto	</td>	<td>	Manaus	</td>	<td>	am	</td>	</tr>
<tr>	<td>	8	</td>	<td>	45667722	</td>	<td>	Rua São Miguel	</td>	<td>	Manaus	</td>	<td>	am	</td>	</tr>
<tr>	<td>	9	</td>	<td>	58774411	</td>	<td>	Avenida Belmiro Correia	</td>	<td>	Recife	</td>	<td>	pe	</td>	</tr>
<tr>	<td>	10	</td>	<td>	58774411	</td>	<td>	Rua Serinhaém	</td>	<td>	Recife	</td>	<td>	pe	</td>	</tr>
</table>																

### Criando Tabela movimentação
```sql

CREATE TABLE IF NOT EXISTS movimentacao(
  id_movimentacao int,
  data_movimentacao timestamp,
  valor double,
  saldo_inicio double,
  saldo_fim double,
  tipo_movimentacao string,
  id_conta int
)
USING CSV
LOCATION "dbfs:/FileStore/tables/tabelas_instituicao_financeira/movimentacao.csv"
OPTIONS (header "true", inferSchema "false");
```
### Consultando tabela movimentação

```sql
SELECT * FROM movimentacao;
```

<table>																						
<tr>	<th>	id_movimentacao	</th>	<th>	data_movimentacao	</th>	<th>	valor	</th>	<th>	saldo_inicio	</th>	<th>	saldo_fim	</th>	<th>	tipo_movimentacao	</th>	<th>	id_conta	</th>	</tr>
<tr>	<td>	1	</td>	<td>	2021-01-20T00:00:00.000+0000	</td>	<td>	9000	</td>	<td>	0	</td>	<td>	9000	</td>	<td>	C	</td>	<td>	2	</td>	</tr>
<tr>	<td>	2	</td>	<td>	2021-01-22T00:00:00.000+0000	</td>	<td>	500	</td>	<td>	4000	</td>	<td>	3500	</td>	<td>	D	</td>	<td>	3	</td>	</tr>
<tr>	<td>	3	</td>	<td>	2021-02-05T00:00:00.000+0000	</td>	<td>	400	</td>	<td>	0	</td>	<td>	400	</td>	<td>	C	</td>	<td>	4	</td>	</tr>
<tr>	<td>	4	</td>	<td>	2021-02-20T00:00:00.000+0000	</td>	<td>	200	</td>	<td>	200	</td>	<td>	400	</td>	<td>	C	</td>	<td>	5	</td>	</tr>
<tr>	<td>	5	</td>	<td>	2021-03-20T00:00:00.000+0000	</td>	<td>	1000	</td>	<td>	0	</td>	<td>	1000	</td>	<td>	C	</td>	<td>	6	</td>	</tr>
<tr>	<td>	6	</td>	<td>	2021-03-30T00:00:00.000+0000	</td>	<td>	20	</td>	<td>	100	</td>	<td>	80	</td>	<td>	D	</td>	<td>	7	</td>	</tr>
<tr>	<td>	7	</td>	<td>	2021-04-07T00:00:00.000+0000	</td>	<td>	900	</td>	<td>	0	</td>	<td>	900	</td>	<td>	C	</td>	<td>	9	</td>	</tr>
<tr>	<td>	8	</td>	<td>	2021-05-15T00:00:00.000+0000	</td>	<td>	100	</td>	<td>	0	</td>	<td>	1000	</td>	<td>	C	</td>	<td>	9	</td>	</tr>
<tr>	<td>	9	</td>	<td>	2021-05-17T00:00:00.000+0000	</td>	<td>	350	</td>	<td>	0	</td>	<td>	350	</td>	<td>	C	</td>	<td>	10	</td>	</tr>
<tr>	<td>	10	</td>	<td>	2021-05-20T00:00:00.000+0000	</td>	<td>	600	</td>	<td>	0	</td>	<td>	600	</td>	<td>	C	</td>	<td>	11	</td>	</tr>
<tr>	<td>	11	</td>	<td>	2021-06-20T00:00:00.000+0000		<td>	500	</td>	<td>	0	</td>	<td>	500	</td>	<td>	C	</td>	<td>	12	</td>	</tr>
<tr>	<td>	12	</td>	<td>	2021-06-20T00:00:00.000+0000		<td>	2000	</td>	<td>	0	</td>	<td>	2000	</td>	<td>	C	</td>	<td>	13	</td>	</tr>
<tr>	<td>	13	</td>	<td>	2021-07-20T00:00:00.000+0000		<td>	2000	</td>	<td>	2000	</td>	<td>	0	</td>	<td>	D	</td>	<td>	13	</td>	</tr>
<tr>	<td>	14	</td>	<td>	2021-07-20T00:00:00.000+0000		<td>	8000	</td>	<td>	9000	</td>	<td>	1000	</td>	<td>	D	</td>	<td>	2	</td>	</tr>
<tr>	<td>	15	</td>	<td>	2021-07-20T00:00:00.000+0000		<td>	300	</td>	<td>	350	</td>	<td>	50	</td>	<td>	D	</td>	<td>	10	</td>	</tr>
<tr>	<td>	16	</td>	<td>	2021-07-20T00:00:00.000+0000		<td>	400	</td>	<td>	0	</td>	<td>	400	</td>	<td>	C	</td>	<td>	1	</td>	</tr>
<tr>	<td>	17	</td>	<td>	2021-07-10T00:00:00.000+0000		<td>	200	</td>	<td>	600	</td>	<td>	400	</td>	<td>	D	</td>	<td>	11	</td>	</tr>
<tr>	<td>	18	</td>	<td>	2021-07-15T00:00:00.000+0000		<td>	300	</td>	<td>	400	</td>	<td>	100	</td>	<td>	D	</td>	<td>	11	</td>	</tr>
</table>																						

## Criação de tabela resultante da junção das tabelas criadas anteriormente no intiudo de orimizar consultas

### Criando o schema relatorio_bd

```sql
CREATE DATABASE IF NOT EXISTS relatorio_bd;
```

### Selecionando o schema relatorio_bd
```sql
use relatorio_bd;
```

### Criando tb_relatorio(desnormalizada)  dentro do schema relatório_bd com creat, select e join

```sql
CREATE TABLE tb_relatorio AS 
SELECT 
  cliente.id_cliente,
  cliente.nome,
  cliente.data_nascimento,
  cliente.data_cadastro,
  cliente.status status_cliente,
  conta.id_conta,
  conta.numero_conta, 
  conta.digito,
  conta.data_abertura data_abertura_conta,
  conta.tipo_conta,
  conta.status status_conta,
  movimentacao.id_movimentacao,
  movimentacao.valor,
  movimentacao.tipo_movimentacao,
  movimentacao.saldo_inicio,
  movimentacao.saldo_fim
FROM instituicao_financeira_bd.cliente
LEFT JOIN instituicao_financeira_bd.conta
ON cliente.id_cliente = conta.id_cliente
LEFT JOIN instituicao_financeira_bd.movimentacao
ON movimentacao.id_conta = conta.id_conta;
```

### Consultando tabela tb_relatorio

```sql
SELECT * FROM tb_relatorio;
```

<table>																																																	
<tr>	<th>	id_cliente	</th>	<th>	nome	</th>	<th>	data_nascimento	</th>	<th>	data_cadastro	</th>	<th>	status_cliente	</th>	<th>	id_conta	</th>	<th>	numero_conta	</th>	<th>	digito	</th>	<th>	data_abertura_conta	</th>	<th>	tipo_conta	</th>	<th>	status_conta	</th>	<th>	id_movimentacao	</th>	<th>	valor	</th>	<th>	tipo_movimentacao	</th>	<th>	saldo_inicio	</th>	<th>	saldo_fim	</th>	</tr>
<tr>	<td>	1	</td>	<td>	Arthur	</td>	<td>	1990-06-30T00:00:00.000+0000	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	14	</td>	<td>	996534	</td>	<td>	x	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	inativo	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	</tr>
<tr>	<td>	1	</td>	<td>	Arthur	</td>	<td>	1990-06-30T00:00:00.000+0000	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	1	</td>	<td>	234156	</td>	<td>	x	</td>	<td>	2010-05-22T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	16	</td>	<td>	400	</td>	<td>	C	</td>	<td>	0	</td>	<td>	400	</td>	</tr>
<tr>	<td>	2	</td>	<td>	Marcos	</td>	<td>	1965-02-01T00:00:00.000+0000	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	2	</td>	<td>	234567	</td>	<td>	1	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	14	</td>	<td>	8000	</td>	<td>	D	</td>	<td>	9000	</td>	<td>	1000	</td>	</tr>
<tr>	<td>	2	</td>	<td>	Marcos	</td>	<td>	1965-02-01T00:00:00.000+0000	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	2	</td>	<td>	234567	</td>	<td>	1	</td>	<td>	2000-07-23T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	1	</td>	<td>	9000	</td>	<td>	C	</td>	<td>	0	</td>	<td>	9000	</td>	</tr>
<tr>	<td>	3	</td>	<td>	Juliane	</td>	<td>	1994-12-10T00:00:00.000+0000	</td>	<td>	2015-08-15T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	3	</td>	<td>	127788	</td>	<td>	2	</td>	<td>	2015-08-15T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	ativo	</td>	<td>	2	</td>	<td>	500	</td>	<td>	D	</td>	<td>	4000	</td>	<td>	3500	</td>	</tr>
<tr>	<td>	4	</td>	<td>	Barbara	</td>	<td>	1992-12-30T00:00:00.000+0000	</td>	<td>	2015-05-20T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	12	</td>	<td>	224376	</td>	<td>	3	</td>	<td>	2016-05-20T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	11	</td>	<td>	500	</td>	<td>	C	</td>	<td>	0	</td>	<td>	500	</td>	</tr>
<tr>	<td>	4	</td>	<td>	Barbara	</td>	<td>	1992-12-30T00:00:00.000+0000	</td>	<td>	2015-05-20T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	4	</td>	<td>	335298	</td>	<td>	3	</td>	<td>	2015-05-20T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	ativo	</td>	<td>	3	</td>	<td>	400	</td>	<td>	C	</td>	<td>	0	</td>	<td>	400	</td>	</tr>
<tr>	<td>	5	</td>	<td>	Bruno	</td>	<td>	1980-07-30T00:00:00.000+0000	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	13	</td>	<td>	123890	</td>	<td>	9	</td>	<td>	2001-12-25T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	13	</td>	<td>	2000	</td>	<td>	D	</td>	<td>	2000	</td>	<td>	0	</td>	</tr>
<tr>	<td>	5	</td>	<td>	Bruno	</td>	<td>	1980-07-30T00:00:00.000+0000	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	13	</td>	<td>	123890	</td>	<td>	9	</td>	<td>	2001-12-25T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	12	</td>	<td>	2000	</td>	<td>	C	</td>	<td>	0	</td>	<td>	2000	</td>	</tr>
<tr>	<td>	5	</td>	<td>	Bruno	</td>	<td>	1980-07-30T00:00:00.000+0000	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	5	</td>	<td>	145377	</td>	<td>	5	</td>	<td>	2000-12-25T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	ativo	</td>	<td>	4	</td>	<td>	200	</td>	<td>	C	</td>	<td>	200	</td>	<td>	400	</td>	</tr>
<tr>	<td>	6	</td>	<td>	Luciana	</td>	<td>	1950-09-30T00:00:00.000+0000	</td>	<td>	1990-09-17T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	6	</td>	<td>	987765	</td>	<td>	7	</td>	<td>	1990-09-17T00:00:00.000+0000	</td>	<td>	conta universitária	</td>	<td>	ativo	</td>	<td>	5	</td>	<td>	1000	</td>	<td>	C	</td>	<td>	0	</td>	<td>	1000	</td>	</tr>
<tr>	<td>	7	</td>	<td>	Marina	</td>	<td>	2000-05-25T00:00:00.000+0000	</td>	<td>	2020-07-25T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	7	</td>	<td>	435677	</td>	<td>	2	</td>	<td>	2020-07-25T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	ativo	</td>	<td>	6	</td>	<td>	20	</td>	<td>	D	</td>	<td>	100	</td>	<td>	80	</td>	</tr>
<tr>	<td>	8	</td>	<td>	Fernando	</td>	<td>	1990-04-15T00:00:00.000+0000	</td>	<td>	2020-05-17T00:00:00.000+0000	</td>	<td>	inativo	</td>	<td>	8	</td>	<td>	223670	</td>	<td>	1	</td>	<td>	2021-05-17T00:00:00.000+0000	</td>	<td>	conta salário	</td>	<td>	inativo	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	<td>	null	</td>	</tr>
<tr>	<td>	9	</td>	<td>	Flavio	</td>	<td>	1989-07-30T00:00:00.000+0000	</td>	<td>	2010-08-02T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	9	</td>	<td>	998755	</td>	<td>	4	</td>	<td>	2010-08-02T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	8	</td>	<td>	100	</td>	<td>	C	</td>	<td>	0	</td>	<td>	1000	</td>	</tr>
<tr>	<td>	9	</td>	<td>	Flavio			1989-07-30T00:00:00.000+0000			2010-08-02T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	9	</td>	<td>	998755	</td>	<td>	4	</td>	<td>	2010-08-02T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	7	</td>	<td>	900	</td>	<td>	C	</td>	<td>	0	</td>	<td>	900	</td>	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim			1970-01-05T00:00:00.000+0000			1994-10-13T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	11	</td>	<td>	345598	</td>	<td>	2	</td>	<td>	2000-10-13T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	18	</td>	<td>	300	</td>	<td>	D	</td>	<td>	400	</td>	<td>	100	</td>	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim			1970-01-05T00:00:00.000+0000			1994-10-13T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	11	</td>	<td>	345598	</td>	<td>	2	</td>	<td>	2000-10-13T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	17	</td>	<td>	200	</td>	<td>	D	</td>	<td>	600	</td>	<td>	400	</td>	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim			1970-01-05T00:00:00.000+0000			1994-10-13T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	11	</td>	<td>	345598	</td>	<td>	2	</td>	<td>	2000-10-13T00:00:00.000+0000	</td>	<td>	conta corrente	</td>	<td>	ativo	</td>	<td>	10	</td>	<td>	600	</td>	<td>	C	</td>	<td>	0	</td>	<td>	600	</td>	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim			1970-01-05T00:00:00.000+0000			1994-10-13T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	10	</td>	<td>	654848	</td>	<td>	6	</td>	<td>	1994-10-13T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	15	</td>	<td>	300	</td>	<td>	D	</td>	<td>	350	</td>	<td>	50	</td>	</tr>
<tr>	<td>	10	</td>	<td>	Joaquim			1970-01-05T00:00:00.000+0000			1994-10-13T00:00:00.000+0000	</td>	<td>	ativo	</td>	<td>	10	</td>	<td>	654848	</td>	<td>	6	</td>	<td>	1994-10-13T00:00:00.000+0000	</td>	<td>	conta poupança	</td>	<td>	ativo	</td>	<td>	9	</td>	<td>	350	</td>	<td>	C	</td>	<td>	0	</td>	<td>	350	</td>	</tr>
</table>																																																	

## Perguntas de negócio

### Qual o nome dos clientes cadastrados no banco de dados?

```sql
SELECT nome, id_cliente  
FROM (SELECT DISTINCT(id_cliente), nome from tb_relatorio) as nome
order by id_cliente;
```
<table>							
<tr>	<th>	nome	</th>	<th>	id_cliente	</th>	</tr>
<tr>	<td>	Arthur	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Marcos	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Juliane	</td>	<td>	3	</td>	</tr>
<tr>	<td>	Barbara	</td>	<td>	4	</td>	</tr>
<tr>	<td>	Bruno	</td>	<td>	5	</td>	</tr>
<tr>	<td>	Luciana	</td>	<td>	6	</td>	</tr>
<tr>	<td>	Marina	</td>	<td>	7	</td>	</tr>
<tr>	<td>	Fernando	</td>	<td>	8	</td>	</tr>
<tr>	<td>	Flavio	</td>	<td>	9	</td>	</tr>
<tr>	<td>	Joaquim	</td>	<td>	10	</td>	</tr>
</table>

### 2. Qual o total de clientes cadastrados no banco de dados?

```sql
SELECT COUNT(DISTINCT id_cliente) total_clientes
FROM tb_relatorio;
```

<table>				
<tr>	<th>	total_clientes	</th>	</tr>
<tr>	<td>	10	</td>	</tr>
</table>	

### 3. Qual o total de clientes ativos?

```sql
SELECT count(distinct id_cliente) clientes_ativo
FROM tb_relatorio
WHERE status_cliente = "ativo";
``` 
<table>				
<tr>	<th>	clientes_ativo	</th>	</tr>
<tr>	<td>	9	</td>	</tr>
</table>				

### 4. Qual o total de clientes inativos?
```sql
SELECT count(distinct id_cliente) clientes_ativo
FROM tb_relatorio
WHERE status_cliente = "ativo";
``` 
<table>				
<tr>	<th>	clientes_ativo	</th>	</tr>
<tr>	<td>	1	</td>	</tr>
</table>				

### 5. Qual a quantidade de contas por cliente?

```sql
SELECT nome, count(distinct tipo_conta) qtd_conta_por_cliente 
FROM tb_relatorio
group by nome;
```
<table>							
<tr>	<th>	nome	</th>	<th>	qtd_conta_por_cliente	</th>	</tr>
<tr>	<td>	Bruno	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Joaquim	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Barbara	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Arthur	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Marcos	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Fernando	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Flavio	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Marina	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Luciana	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Juliane	</td>	<td>	1	</td>	</tr>
</table>							
### 6. Qual a quantidade de contas distintas por cliente que estão ativas?

```sql
SELECT nome, count(distinct tipo_conta) qtd_conta_por_cliente 
FROM tb_relatorio
where status_conta = "ativo"
group by nome;
```

<table>							
<tr>	<th>	nome	</th>	<th>	qtd_conta_por_cliente	</th>	</tr>
<tr>	<td>	Bruno	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Joaquim	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Barbara	</td>	<td>	2	</td>	</tr>
<tr>	<td>	Arthur	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Marcos	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Flavio	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Marina	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Luciana	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Juliane	</td>	<td>	1	</td>	</tr>
</table>							

### 7. Qual a quantidade de contas distintas por cliente que estão inativas

```sql
SELECT nome, count(distinct tipo_conta) qtd_conta_por_cliente 
FROM tb_relatorio
where status_conta = "inativo"
group by nome;
```

<table>							
<tr>	<th>	nome	</th>	<th>	qtd_conta_por_cliente	</th>	</tr>
<tr>	<td>	Arthur	</td>	<td>	1	</td>	</tr>
<tr>	<td>	Fernando	</td>	<td>	1	</td>	</tr>
</table>							

### 8. Quais os tipos de contas existentes no banco de dados?

```sql
SELECT distinct tipo_conta 
FROM tb_relatorio;
```

<table>				
<tr>	<th>	tipo_conta	</th>	</tr>
<tr>	<td>	conta corrente	</td>	</tr>
<tr>	<td>	conta universitária	</td>	</tr>
<tr>	<td>	conta salário	</td>	</tr>
<tr>	<td>	conta poupança	</td>	</tr>
</table>				

### 9. Quantos grupos de contas há?

```sql
SELECT count(distinct tipo_conta) qtd_tipos_contas
FROM tb_relatorio;
```

<table>				
<tr>	<th>	qtd_tipos_contas	</th>	</tr>
<tr>	<td>	4	</td>	</tr>
</table>				

### 10. Qual a quantidade de contas ativas cadastradas em cada grupo de conta? 

```sql
SELECT tipo_conta, count(DISTINCT numero_conta) numero_contas
FROM tb_relatorio
WHERE status_conta = "ativo"
GROUP BY tipo_conta;
```

<table>							
<tr>	<th>	tipo_conta	</th>	<th>	numero_contas	</th>	</tr>
<tr>	<td>	conta corrente	</td>	<td>	4	</td>	</tr>
<tr>	<td>	conta universitária	</td>	<td>	3	</td>	</tr>
<tr>	<td>	conta salário	</td>	<td>	2	</td>	</tr>
<tr>	<td>	conta poupança	</td>	<td>	3	</td>	</tr>
</table>	

<img src="https://user-images.githubusercontent.com/77210732/143805706-add34e33-f429-4b42-a178-7bec4c9472f3.png" width="350">

### 11. Qual grupo de conta há mais contas cadastradas? 

```sql
SELECT tipo_conta, count(DISTINCT numero_conta) numero_contas
FROM tb_relatorio
WHERE status_conta = "ativo"
GROUP BY tipo_conta
ORDER BY numero_contas DESC
LIMIT 1;
```

<table>							
<tr>	<th>	tipo_conta	</th>	<th>	numero_contas	</th>	</tr>
<tr>	<td>	conta corrente	</td>	<td>	4	</td>	</tr>
</table>							

### 12. Qual o numero de movimentação bancária?

```sql

SELECT count(tipo_movimentacao) numero_movimentacao
FROM tb_relatorio;
```
<table>				
<tr>	<th>	numero_movimentacao	</th>	</tr>
<tr>	<td>	18	</td>	</tr>
</table>				

### 13. Qual o valor total de créditos por conta bancária?

```sql
select  id_conta, sum(valor) total_debito 
from tb_relatorio 
where tipo_movimentacao = "C" 
group by id_conta
order by id_conta asc;
```

<table>							
<tr>	<th>	id_conta	</th>	<th>	total_debito	</th>	</tr>
<tr>	<td>	1	</td>	<td>	400	</td>	</tr>
<tr>	<td>	2	</td>	<td>	9000	</td>	</tr>
<tr>	<td>	4	</td>	<td>	400	</td>	</tr>
<tr>	<td>	5	</td>	<td>	200	</td>	</tr>
<tr>	<td>	6	</td>	<td>	1000	</td>	</tr>
<tr>	<td>	9	</td>	<td>	1000	</td>	</tr>
<tr>	<td>	10	</td>	<td>	350	</td>	</tr>
<tr>	<td>	11	</td>	<td>	600	</td>	</tr>
<tr>	<td>	12	</td>	<td>	500	</td>	</tr>
<tr>	<td>	13	</td>	<td>	2000	</td>	</tr>
</table>							

### 14.  Qual o valor total de débitos por conta bancária?

```sql
select  id_conta, sum(valor) total_debito 
from tb_relatorio 
where tipo_movimentacao = "D" 
group by id_conta
order by id_conta asc;
```

<table>							
<tr>	<th>	id_conta	</th>	<th>	total_debito	</th>	</tr>
<tr>	<td>	2	</td>	<td>	8000	</td>	</tr>
<tr>	<td>	3	</td>	<td>	500	</td>	</tr>
<tr>	<td>	7	</td>	<td>	20	</td>	</tr>
<tr>	<td>	10	</td>	<td>	300	</td>	</tr>
<tr>	<td>	11	</td>	<td>	500	</td>	</tr>
<tr>	<td>	13	</td>	<td>	2000	</td>	</tr>
</table>							

###  15. Qual o valor total de débitos e créditos por conta bancária?
```sql
Select
  Id_conta,
  Sum(case when tipo_movimentacao = 'C'  then valor else 0 end) total_creditos,
  Sum(case when tipo_movimentacao = 'D'  then valor else 0 end) total_debitos
From tb_relatorio
Group by id_conta:
```

<table>										
<tr>	<th>	Id_conta	</th>	<th>	total_creditos	</th>	<th>	total_debitos	</th>	</tr>
<tr>	<td>	12	</td>	<td>	500	</td>	<td>	0	</td>	</tr>
<tr>	<td>	1	</td>	<td>	400	</td>	<td>	0	</td>	</tr>
<tr>	<td>	13	</td>	<td>	2000	</td>	<td>	2000	</td>	</tr>
<tr>	<td>	6	</td>	<td>	1000	</td>	<td>	0	</td>	</tr>
<tr>	<td>	3	</td>	<td>	0	</td>	<td>	500	</td>	</tr>
<tr>	<td>	5	</td>	<td>	200	</td>	<td>	0	</td>	</tr>
<tr>	<td>	9	</td>	<td>	1000	</td>	<td>	0	</td>	</tr>
<tr>	<td>	4	</td>	<td>	400	</td>	<td>	0	</td>	</tr>
<tr>	<td>	8	</td>	<td>	0	</td>	<td>	0	</td>	</tr>
<tr>	<td>	7	</td>	<td>	0	</td>	<td>	20	</td>	</tr>
<tr>	<td>	10	</td>	<td>	350	</td>	<td>	300	</td>	</tr>
<tr>	<td>	11	</td>	<td>	600	</td>	<td>	500	</td>	</tr>
<tr>	<td>	14	</td>	<td>	0	</td>	<td>	0	</td>	</tr>
<tr>	<td>	2	</td>	<td>	9000	</td>	<td>	8000	</td>	</tr>
</table>										

### 16. Qual a média de valores creditados nas contas bancárias? 

```sql
select 
  round(mean(valor),2) media
from tb_relatorio
where tipo_movimentacao = "C";

```
<table>				
<tr>	<th>	media	</th>	</tr>
<tr>	<td>	1404.55	</td>	</tr>
</table>				

### 17. Qual a média de valores creditados nas contas bancárias? 


```sql
select 
  round(mean(valor),2) media
from tb_relatorio
where tipo_movimentacao = "C";

```
<table>				
<tr>	<th>	media	</th>	</tr>
<tr>	<td>	1404.55	</td>	</tr>
</table>		




