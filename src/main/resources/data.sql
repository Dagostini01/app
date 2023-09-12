--Inserir registros na tabela clientex
insert into clientex (id, email, nome) values (1, 'amatelaitis0@sogou.com', 'Abigael');
insert into clientex (id, email, nome) values (2, 'hmaciver1@parallels.com', 'Hall');
insert into clientex (id, email, nome) values (3, 'kmoisey2@tiny.cc', 'Kaitlyn');
insert into clientex (id, email, nome) values (4, 'jsawkin3@ftc.gov', 'Julianna');
insert into clientex (id, email, nome) values (5, 'bmerrywether4@kickstarter.com', 'Bel');
insert into clientex (id, email, nome) values (6, 'srengger5@woothemes.com', 'Sherie');
insert into clientex (id, email, nome) values (7, 'keltun6@hexun.com', 'Keelia');
insert into clientex (id, email, nome) values (8, 'fpowter7@dailymail.co.uk', 'Fawn');
insert into clientex (id, email, nome) values (9, 'amccroary8@omniture.com', 'Aurora');
insert into clientex (id, email, nome) values (10, 'amatovic9@youtu.be', 'Aili');

--Inserir registros na tabela produtox
insert into produtox (id, data, nome, cliente_id) values (1, '26/07/2008', 'ERP Plusoft', 1);
insert into produtox (id, data, nome, cliente_id) values (2, '10/11/2021', 'CRM Plusoft', 2);
insert into produtox (id, data, nome, cliente_id) values (3, '29/12/2000', 'SCM Plusoft', 3);
insert into produtox (id, data, nome, cliente_id) values (4, '17/10/1994', 'Sistema de controle de estoque', 4);
insert into produtox (id, data, nome, cliente_id) values (5, '09/06/2021', 'Sistema de gestão de vendas', 5);
insert into produtox (id, data, nome, cliente_id) values (6, '12/10/2004', 'Sistema de gestão de marketing', 6);
insert into produtox (id, data, nome, cliente_id) values (7, '21/04/2010', 'Sistema de gestão de recursos humanos', 7);
insert into produtox (id, data, nome, cliente_id) values (8, '03/11/2012', 'Sistema de gestão de projetos', 8);
insert into produtox (id, data, nome, cliente_id) values (9, '20/03/2019', 'Sistema de gestão de atendimento ao cliente', 9);
insert into produtox (id, data, nome, cliente_id) values (10, '29/11/1994', 'Sistema de gestão de logistica', 10);

-- Criação da tabela "clientex"
CREATE TABLE clientex (
    id NUMBER(10) PRIMARY KEY,
    email VARCHAR2(255),
    nome VARCHAR2(255)
);

-- Criação da tabela "produtox"
CREATE TABLE produtox (
    id NUMBER(10) PRIMARY KEY,
    data DATE,
    nome VARCHAR2(255),
    cliente_id NUMBER(10),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientex(id)
);
