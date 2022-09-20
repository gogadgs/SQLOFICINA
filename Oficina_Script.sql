CREATE DATABASE OFICINA;
USE OFICINA;

-- drop database oficina;
-- seção de criação de tabelas --  
CREATE TABLE  CADASTRO_CNPJ(
idCNPJ int auto_increment not null primary key,
Razão_Social varchar(30)



);

CREATE TABLE cadastro_CPF(
idCPF int auto_increment not null primary key,
Nome varchar(40),
sobrenome varchar (20)


);

CREATE TABLE cadastro_veiculos(
idVeiculos int auto_increment primary key not null,
Nome varchar(20),
chassi char(17),
peso FLOAT,
quantos_passageiros int,
constraint veiculos_chassi unique(chassi)


);

CREATE TABLE PEÇAS(
idPeça int auto_increment not null,
idFornecedor int,
primary key(idPeça,idFornecedor),
Nome varchar(20),
marca varchar(25),
valor float,
constraint fornecedor_peça foreign key(idFornecedor) references Fornecedor(idFornecedor)




);

Create table Fornecedor(
idFornecedor int primary key auto_increment not null,
Nome varchar(20)



);

Create table mecanicos_licenciados(
 idMecanico int auto_increment primary key not null,
 Nome varchar(55),
 especialidade varchar(255),
 data_de_admissao date,
 status enum("regular","não apto","afastado inss") default "regular"
 
 
 

);

create table mao_de_obra(
idmao_de_obra int auto_increment not null,
idMecanico int not null,
valor float,
inicio date,
fim date,
primary key(idmao_de_obra,idMecanico),
constraint maodeobra_mecanico foreign key(idMecanico) references mecanicos_licenciados(idMecanico)

);


-- seção de tabelas de relacionamentos para centralizar informações para  tabelas de preços de pessoa fisica e juridica  -- 

create table conserto(
idconserto int auto_increment not null,
idmao_de_obra int  not null,
primary key(idconserto,idmao_de_obra),
constraint conserto_maodeobra foreign key(idmao_de_obra) references mao_de_obra(idmao_de_obra)





);

create table revisão(
idrevisao int auto_increment not null,
idmao_de_obra int  not null,
primary key(idrevisao,idmao_de_obra),
constraint revisao_maodeobra foreign key(idmao_de_obra) references mao_de_obra(idmao_de_obra)




);

show tables;
-- seção das tabelas finais com o proposito de oferecer servicos -- 


create table TabelaPreço_CPF(
idTabelaCPF int auto_increment not null,
idCPF int  not null,
idPeça int not null,
idconserto int not null,
idrevisao int  not null,
primary key(idTabelaCPF,idCPF,idconserto,idrevisao),
constraint tabela_idCPF foreign key(idCPF) references CADASTRO_CPF(idCPF),
constraint tabela_conserto foreign key(idconserto) references conserto(idconserto),
constraint tabela_peça foreign key(idPeça) references Peças(idPeça)





);

create table TabelaPreço_CNPJ(
idTabelaCNPJ int auto_increment not null,
idCNPJ int  not null,
idconserto int  not null,
idrevisao int not null,
idPeça int  not null,
primary key(idTabelaCNPJ,idCNPJ,idconserto,idrevisao,idPeça),
constraint tabela_idCNPJ foreign key(idCNPJ) references CADASTRO_CNPJ(idCNPJ),
constraint tabela_conserto1 foreign key(idconserto) references conserto(idconserto),
constraint tabela_revisao1 foreign key(idrevisao) references revisão(idrevisao),
constraint tabela_peça1 foreign key(idPeça) references Peças(idPeça)




)


-- seção de logica de estrutura de banco de dados para persistir e associar informações a serem correlacionadas -- 


select * from cadastro_cnpj;

select * from cadastro_CPF WHERE "DOUGLAS";


select * from cadastro_CPF  ORDER BY NOME;
select * from cadastro_CPF  ORDER BY NOME ASC;
select * from cadastro_CPF  ORDER BY NOME DESC;


SELECT * FROM  TabelaPreço_CPF WHERE  cadastro_veiculos = "RENANULT" GROUP BY PASSAGEIROS HAVING 4 ORDER BY NOME;




