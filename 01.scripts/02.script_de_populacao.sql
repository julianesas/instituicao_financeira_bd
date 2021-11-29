INSERT into	endereco	( cep, logradouro, cidade,	uf)
values	( "58260001", "Rua joaquim melo", "Recife", "pe"),
	( "55023699", "Avenida São Judas Tadeu", "João Pessoa", "pb"),
	( "58774411", "Rua Barros Peixoto", "Manaus", "am"),
	( "55982311", "Rua Atistides costa", "João pessoa", "pb"),
	( "55982311", "Rua Clovis pessoa", "João pessoa", "pb"),
	( "23238292", "Rua Carmelita", "Recife", "pe"),
	( "44559922", "Rua Manoel Peixoto", "Manaus", "am"),
	( "45667722", "Rua São Miguel" , "Manaus", "am"),
	( "58774411", "Avenida Belmiro Correia", "Recife", "pe"),
	( "58774411", "Rua Serinhaém", "Recife", "pe");

INSERT INTO	cliente	( nome,	sobrenome, cpf,	data_nascimento, data_cadastro,	complemento_endereco, telefone, status,	id_endereco)
VALUES	
	( "Arthur", "Silva", "11122233344", "1990-06-30	", "2010-05-22", "casa 29", "83999992568", "ativo",	4),
	( "Marcos", "Simão", "11122233355", "1965-02-01	", "2000-07-23", "casa29", "83999668877", "ativo",	4),
	( "Juliane", "Andrade", "11122233366", "1994-12-10", "2015-08-15", "numero 1965", "83986995544", "ativo",	2),
	( "Barbara", "Oliveira", "11122233377", "1992-12-30", "2015-05-20", "casa 19 quadra 3", "92966558877", "ativo",	7),
	( "Bruno", "Costa", "11122233388", "1980-07-30", "2000-12-25", "casa 88	", "92955887744", "	ativo",	8),
	( "Luciana", "Menezes", "11122233399", "1950-09-30", "1990-09-17", "casa 29", "87966887722	", "ativo",	1),
	( "Marina", "Mendes", "11122233410", "2000-05-25", "2020-07-25", "condominio joaquim melo", "83988775566", "ativo",	5),
	( "Fernando", "Silva", "11122233421", "1990-04-15", "2020-05-17", "casa 75", "81977558822", "inativo",	6),
	( "Flavio", "Andrade", "11122233432", "1989-07-30", "2010-08-02", "casa 89", "81966332255", "ativo",	10),
	( "Joaquim", "Costa", "11122233443", "1970-01-05", "1994-10-13", "casa 77", "81988445533", "ativo",	9);


insert into	agencia	( nome, complemento, id_endereco)
values	
	( "Agencia da Torre",	"numero 29"	,	1),
	( "Agencia Manaíra"	,	"numero 49"	,	2),
	( "Agência Manauara",	"numero 66"	,	3);
    
INSERT INTO	conta													
	( numero_conta,	digito,	data_abertura,	tipo_conta,	id_agencia,	id_cliente,	status)
VALUES	
	( 	234156, "	x" , "2010-05-22" , "conta corrente", 1, 1, "ativo"),
	( 	234567, "	1" , "2000-07-23" , "conta poupança", 1, 2, "ativo"),
	( 	127788, "	2" , "2015-08-15" , "conta salário", 1,	3, "ativo"),
	( 	335298, "	3" , "2015-05-20" , "conta universitária", 	2,	4, "ativo"),
	( 	145377, "	5" , "2000-12-25" , "conta universitária", 	2,	5, "ativo"),
	( 	987765, "	7" , "1990-09-17" , "conta universitária", 	2,	6, "ativo"),
	( 	435677, "	2" , "2020-07-25" , "conta salário", 3,	7, "ativo"),
	( 	223670, "	1" , "2021-05-17" , "conta salário", 3,	8, "inativo"),
	( 	998755, "	4" , "2010-08-02" , "conta poupança", 3, 9, "ativo"),
	( 	654848, "	6" , "1994-10-13" , "conta poupança", 3, 10, "ativo"),
	( 	345598, "	2" , "2000-10-13" , "conta corrente", 3, 10, "ativo"),
	( 	224376, "	3" , "2016-05-20" , "conta corrente", 2, 4, "ativo"),
	( 	123890, "	9" , "2001-12-25" , "conta corrente", 2, 5, "ativo"),
	( 	996534, "	x" , "2010-05-22" , "conta poupança", 1, 1, "inativo");

INSERT INTO		movimentacao											
	(	data_movimentacao,	valor,	saldo_inicio,	saldo_fim,	tipo_movimentacao,	id_conta)
VALUES	
	( "	2021-01-20", 9000,	0, 9000, "C", 2),
	( "	2021-01-22", 500, 4000, 3500, "D", 3),
	( "	2021-02-05", 400, 0, 400, "C", 4),
	( "	2021-02-20", 200, 200, 400,"C", 5),
	( "	2021-03-20", 1000, 0, 1000,"C", 6),
	( "	2021-03-30", 20, 100, 80, "D", 7),
	( "	2021-04-07", 900, 0, 900, "C", 9),
	( "	2021-05-15", 100, 0, 1000, "C", 9),
	( "	2021-05-17", 350, 0, 350, "C", 10),
	( "	2021-05-20", 600, 0, 600, "C", 11),
	( "	2021-06-20", 500, 0, 500, "C", 12),
	( "	2021-06-20", 2000, 0, 2000, "C", 13),
	( "	2021-07-20", 2000, 2000, 0, "D", 13),
	( "	2021-07-20", 8000, 9000, 1000, "D", 2),
	( "	2021-07-20", 300, 350, 50, "D", 10),
	( "	2021-07-20", 400, 0, 400, "C", 1),
	( "	2021-07-10", 200, 600, 400, "D", 11),
	( "	2021-07-15", 300, 400, 100, "D", 11);


