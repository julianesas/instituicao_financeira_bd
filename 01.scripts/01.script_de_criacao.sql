CREATE TABLE `agencia` (
	`id_agencia` int NOT NULL AUTO_INCREMENT,
	`nome` varchar(100) NOT NULL,
	`complemento` varchar(100),
	`id_endereco` int NOT NULL,
	PRIMARY KEY (`id_agencia`)
);

CREATE TABLE `cliente` (
	`id_cliente` int NOT NULL AUTO_INCREMENT,
	`nome` varchar(100) NOT NULL,
	`sobrenome` varchar(200) NOT NULL,
	`cpf` char(11) NOT NULL,
	`data_nascimento` DATE NOT NULL,
	`data_cadastro` TIMESTAMP NOT NULL,
	`complemento_endereco` varchar(100) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`status` varchar(100) NOT NULL,
	`id_endereco` int NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `endereco` (
	`id_endereco` int NOT NULL AUTO_INCREMENT,
	`cep` char(15) NOT NULL,
	`logradouro` varchar(100) NOT NULL,
	`cidade` varchar(100) NOT NULL,
	`uf` varchar(15) NOT NULL,
	PRIMARY KEY (`id_endereco`)
);

CREATE TABLE `conta` (
	`id_conta` int NOT NULL AUTO_INCREMENT,
	`numero_conta` int NOT NULL,
	`digito` varchar(5) NOT NULL,
	`data_abertura` TIMESTAMP NOT NULL,
	`tipo_conta` varchar(100) NOT NULL,
	`id_agencia` int NOT NULL,
	`id_cliente` int NOT NULL,
	`status` varchar(100) NOT NULL,
	PRIMARY KEY (`id_conta`)
);

CREATE TABLE `movimentacao` (
	`id_movimentacao` int NOT NULL AUTO_INCREMENT,
	`data_movimentacao` TIMESTAMP NOT NULL,
	`valor` double NOT NULL,
	`saldo_inicio` double NOT NULL,
	`saldo_fim` double NOT NULL,
	`tipo_movimentacao` varchar(20) NOT NULL,
	`id_conta` int NOT NULL,
	PRIMARY KEY (`id_movimentacao`)
);

ALTER TABLE `agencia` ADD CONSTRAINT `agencia_fk0` FOREIGN KEY (`id_endereco`) REFERENCES `endereco`(`id_endereco`);

ALTER TABLE `cliente` ADD CONSTRAINT `cliente_fk0` FOREIGN KEY (`id_endereco`) REFERENCES `endereco`(`id_endereco`);

ALTER TABLE `conta` ADD CONSTRAINT `conta_fk0` FOREIGN KEY (`id_agencia`) REFERENCES `agencia`(`id_agencia`);

ALTER TABLE `conta` ADD CONSTRAINT `conta_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `movimentacao` ADD CONSTRAINT `movimentacao_fk0` FOREIGN KEY (`id_conta`) REFERENCES `conta`(`id_conta`);






