CREATE DATABASE CIC;
USE CIC;

-- Tabela de bisturis
CREATE TABLE itens_bisturi (
    id INT PRIMARY KEY,
    nome VARCHAR(500) NOT NULL,
    tipo_lamina ENUM('10', '11', '12', '15', '20', '21', '22', '23') NOT NULL,
    tipo_cabo ENUM('3', '4') NOT NULL
);

-- Tabela de tesouras
CREATE TABLE itens_tesoura (
    id INT PRIMARY KEY,
    nome VARCHAR(500) NOT NULL,
    tipo ENUM('Mayo', 'Metzenbaum', 'Potts-Smith', 'Dissecção', 'Lister', 'Iris') NOT NULL
);

-- Tabela de pinças
CREATE TABLE pinca (
    id INT PRIMARY KEY,
    tipo_pinca VARCHAR(50) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    tipo ENUM('Adson', 'Brown-Adson', 'Sem dentes', 'Com dentes') NOT NULL,
    qtde INT NOT NULL
);

-- Tabela de afastadores\
CREATE TABLE afastador (
    id INT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
     tipo ENUM('Farabeuf', 'Finochietto', 'Gosset') NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    qtde INT NOT NULL
);

-- Tabela de ferramentas
CREATE TABLE ferramenta (
    id INT PRIMARY KEY,
    tipo_de_ferramenta VARCHAR(50) NOT NULL,
    pinca_id_fk INT NULL,
    tesoura_id_fk INT NULL,
    afastador_id_fk INT NULL,
    FOREIGN KEY (pinca_id_fk) REFERENCES pinca (id),
    FOREIGN KEY (tesoura_id_fk) REFERENCES itens_tesoura (id),
    FOREIGN KEY (afastador_id_fk) REFERENCES afastador (id)
);

-- Tabela de kits
CREATE TABLE kit (
    id INT PRIMARY KEY,
    nome_kit VARCHAR(50) NOT NULL,
    sala_cirurgia VARCHAR(100) NOT NULL,
    data_hora_envio DATETIME NOT NULL
);

-- Tabela de relação entre kits e ferramentas
CREATE TABLE ferramentas_kit (
	id_ferramentas_kit int primary key,
    id_kit INT NOT NULL,
    id_ferramentas INT NOT NULL,
    totalFerramentas INT NOT NULL,
    FOREIGN KEY (id_ferramentas) REFERENCES ferramenta (id),
    FOREIGN KEY (id_kit) REFERENCES kit (id)
);


-- Tabela de usuários
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    tipo_usuario ENUM('CME', 'Instrumentador') NOT NULL
);

select * from usuarios;

CREATE TABLE kit_status_cirurgico (
    id INT PRIMARY KEY, 
    id_kit INT NOT NULL, 
    id_ferramentas INT NOT NULL, 
    status ENUM('Confirmado recebimento', 'Faltando instrumentos', 'Encaminhado para o CME') NOT NULL,
    usuario_id INT NOT NULL, 
    data_hora_status DATETIME NOT NULL, 
    observacao TEXT, 
    FOREIGN KEY (id_kit) REFERENCES kit (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_ferramentas) REFERENCES ferramentas_kit (id_ferramentas) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE kit_status_CME (
    id INT PRIMARY KEY,
    id_kit INT NOT NULL,
    id_ferramentas INT NOT NULL,
    status ENUM('Recebimento confirmado', 'Faltando instrumentos') NOT NULL,
    usuario_id INT NOT NULL,
    data_hora_status DATETIME NOT NULL,
    observacao TEXT,
    FOREIGN KEY (id_kit) REFERENCES kit (id),
    FOREIGN KEY (id_ferramentas) REFERENCES ferramentas_kit (id_ferramentas),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
);


INSERT INTO itens_bisturi (id, nome, tipo_lamina, tipo_cabo) VALUES
(1, 'Bisturi Cirúrgico A', '10', '3'),
(2, 'Bisturi Cirúrgico B', '11', '3'),
(3, 'Bisturi Cirúrgico C', '12', '4'),
(4, 'Bisturi Cirúrgico D', '15', '3'),
(5, 'Bisturi Cirúrgico E', '20', '4'),
(6, 'Bisturi Cirúrgico F', '21', '3'),
(7, 'Bisturi Cirúrgico G', '22', '4'),
(8, 'Bisturi Cirúrgico H', '23', '3'),
(9, 'Bisturi Especializado I', '10', '4'),
(10, 'Bisturi Especializado J', '11', '3'),
(11, 'Bisturi Especializado K', '12', '4'),
(12, 'Bisturi Especializado L', '15', '3'),
(13, 'Bisturi Especializado M', '20', '4'),
(14, 'Bisturi Especializado N', '21', '3'),
(15, 'Bisturi Especializado O', '23', '4');

-------------------

INSERT INTO itens_tesoura (id, nome, tipo) VALUES
(1, 'Tesoura Cirúrgica A', 'Mayo'),
(2, 'Tesoura Cirúrgica B', 'Metzenbaum'),
(3, 'Tesoura Cirúrgica C', 'Potts-Smith'),
(4, 'Tesoura Cirúrgica D', 'Dissecção'),
(5, 'Tesoura Cirúrgica E', 'Lister'),
(6, 'Tesoura Cirúrgica F', 'Iris'),
(7, 'Tesoura Especializada G', 'Mayo'),
(8, 'Tesoura Especializada H', 'Metzenbaum'),
(9, 'Tesoura Especializada I', 'Potts-Smith'),
(10, 'Tesoura Especializada J', 'Dissecção'),
(11, 'Tesoura Especializada K', 'Lister'),
(12, 'Tesoura Especializada L', 'Iris'),
(13, 'Tesoura Profissional M', 'Mayo'),
(14, 'Tesoura Profissional N', 'Metzenbaum'),
(15, 'Tesoura Profissional O', 'Potts-Smith');

-----------------------------------------

INSERT INTO pinca (id, tipo_pinca, tamanho, tipo, qtde) VALUES
(1, 'Pinca Cirúrgica A', '10cm', 'Adson', 5),
(2, 'Pinca Cirúrgica B', '12cm', 'Brown-Adson', 3),
(3, 'Pinca Cirúrgica C', '15cm', 'Sem dentes', 8),
(4, 'Pinca Cirúrgica D', '8cm', 'Com dentes', 2),
(5, 'Pinca Cirúrgica E', '10cm', 'Adson', 6),
(6, 'Pinca Cirúrgica F', '14cm', 'Brown-Adson', 4),
(7, 'Pinca Cirúrgica G', '12cm', 'Sem dentes', 10),
(8, 'Pinca Cirúrgica H', '16cm', 'Com dentes', 1),
(9, 'Pinca Profissional I', '18cm', 'Adson', 7),
(10, 'Pinca Profissional J', '20cm', 'Brown-Adson', 9),
(11, 'Pinca Profissional K', '12cm', 'Sem dentes', 11),
(12, 'Pinca Profissional L', '14cm', 'Com dentes', 3),
(13, 'Pinca Especializada M', '16cm', 'Adson', 6),
(14, 'Pinca Especializada N', '18cm', 'Brown-Adson', 2),
(15, 'Pinca Especializada O', '20cm', 'Sem dentes', 4);

------------------------------

INSERT INTO afastador (id, modelo, tipo, tamanho, qtde) VALUES
(1, 'Afastador Cirúrgico A', 'Farabeuf', '10cm', 5),
(2, 'Afastador Cirúrgico B', 'Finochietto', '15cm', 3),
(3, 'Afastador Cirúrgico C', 'Gosset', '20cm', 8),
(4, 'Afastador Cirúrgico D', 'Farabeuf', '25cm', 2),
(5, 'Afastador Cirúrgico E', 'Finochietto', '30cm', 6),
(6, 'Afastador Cirúrgico F', 'Gosset', '12cm', 4),
(7, 'Afastador Especializado G', 'Farabeuf', '18cm', 7),
(8, 'Afastador Especializado H', 'Finochietto', '22cm', 1),
(9, 'Afastador Especializado I', 'Gosset', '14cm', 9),
(10, 'Afastador Profissional J', 'Farabeuf', '20cm', 3),
(11, 'Afastador Profissional K', 'Finochietto', '25cm', 10),
(12, 'Afastador Profissional L', 'Gosset', '30cm', 2),
(13, 'Afastador Profissional M', 'Farabeuf', '12cm', 6),
(14, 'Afastador Profissional N', 'Finochietto', '18cm', 4),
(15, 'Afastador Profissional O', 'Gosset', '22cm', 8);

------------------------------------

INSERT INTO ferramenta (id, tipo_de_ferramenta, pinca_id_fk, tesoura_id_fk, afastador_id_fk) VALUES
(1, 'Ferramenta Cirúrgica A', 1, 2, 3),
(2, 'Ferramenta Cirúrgica B', 2, 3, 4),
(3, 'Ferramenta Cirúrgica C', 3, 4, 5),
(4, 'Ferramenta Cirúrgica D', 4, 5, 6),
(5, 'Ferramenta Cirúrgica E', 5, 6, 7),
(6, 'Ferramenta Cirúrgica F', 6, 7, 8),
(7, 'Ferramenta Especializada G', 7, 8, 9),
(8, 'Ferramenta Especializada H', 8, 9, 10),
(9, 'Ferramenta Especializada I', 9, 10, 11),
(10, 'Ferramenta Profissional J', 10, 11, 12),
(11, 'Ferramenta Profissional K', 11, 12, 13),
(12, 'Ferramenta Profissional L', 12, 13, 14),
(13, 'Ferramenta Profissional M', 13, 14, 15),
(14, 'Ferramenta Avançada N', 14, 15, 1),
(15, 'Ferramenta Avançada O', 15, 1, 2);

------------------------------------

INSERT INTO kit (id, nome_kit, sala_cirurgia, data_hora_envio) VALUES
(1, 'Kit Cirúrgico A', 'Sala 1', '2024-11-24 08:30:00'),
(2, 'Kit Cirúrgico B', 'Sala 2', '2024-11-24 09:00:00'),
(3, 'Kit Cirúrgico C', 'Sala 3', '2024-11-24 09:30:00'),
(4, 'Kit Cirúrgico D', 'Sala 4', '2024-11-24 10:00:00'),
(5, 'Kit Cirúrgico E', 'Sala 5', '2024-11-24 10:30:00'),
(6, 'Kit Cirúrgico F', 'Sala 6', '2024-11-24 11:00:00'),
(7, 'Kit Especializado G', 'Sala 7', '2024-11-24 11:30:00'),
(8, 'Kit Especializado H', 'Sala 8', '2024-11-24 12:00:00'),
(9, 'Kit Profissional I', 'Sala 9', '2024-11-24 12:30:00'),
(10, 'Kit Profissional J', 'Sala 10', '2024-11-24 13:00:00'),
(11, 'Kit Profissional K', 'Sala 11', '2024-11-24 13:30:00'),
(12, 'Kit Profissional L', 'Sala 12', '2024-11-24 14:00:00'),
(13, 'Kit Avançado M', 'Sala 13', '2024-11-24 14:30:00'),
(14, 'Kit Avançado N', 'Sala 14', '2024-11-24 15:00:00'),
(15, 'Kit Avançado O', 'Sala 15', '2024-11-24 15:30:00');

---------------------------------------------------

INSERT INTO ferramentas_kit (id_ferramentas_kit, id_kit, id_ferramentas, totalFerramentas) VALUES
(1, 1, 1, 5),
(2, 2, 2, 3),
(3, 3, 3, 8),
(4, 4, 4, 2),
(5, 5, 5, 6),
(6, 6, 6, 4),
(7, 7, 7, 7),
(8, 8, 8, 1),
(9, 9, 9, 9),
(10, 10, 10, 3),
(11, 11, 11, 10),
(12, 12, 12, 2),
(13, 13, 13, 6),
(14, 14, 14, 4),
(15, 15, 15, 8);

----------------------------------

INSERT INTO usuarios (id, nome, cpf, senha, tipo_usuario) VALUES
(1, 'Carlos Silva', '123.456.789-01', 'senha123', 'CME'),
(2, 'Fernanda Oliveira', '987.654.321-00', 'senha456', 'Instrumentador'),
(3, 'Lucas Pereira', '111.222.333-44', 'senha789', 'CME'),
(4, 'Amanda Costa', '555.666.777-88', 'senha101', 'Instrumentador'),
(5, 'Roberto Almeida', '222.333.444-55', 'senha202', 'CME'),
(6, 'Juliana Martins', '444.555.666-77', 'senha303', 'Instrumentador'),
(7, 'Eduardo Souza', '666.777.888-99', 'senha404', 'CME'),
(8, 'Patrícia Lima', '333.444.555-66', 'senha505', 'Instrumentador'),
(9, 'Giovanna Rocha', '777.888.999-00', 'senha606', 'CME'),
(10, 'Rafael Santos', '888.999.000-11', 'senha707', 'Instrumentador'),
(11, 'Mariana Dias', '999.000.111-22', 'senha808', 'CME'),
(12, 'Gustavo Ferreira', '555.444.333-11', 'senha909', 'Instrumentador'),
(13, 'Camila Barbosa', '111.999.888-77', 'senha010', 'CME'),
(14, 'Thiago Oliveira', '444.333.222-66', 'senha111', 'Instrumentador'),
(15, 'Carla Mendes', '333.222.111-00', 'senha121', 'CME');

-------------------------------------------------------------

INSERT INTO kit_status_cirurgico (id, id_kit, id_ferramentas, status, usuario_id, data_hora_status, observacao) VALUES
(1, 1, 1, 'Confirmado recebimento', 1, '2024-11-24 08:30:00', 'Kit recebido e em bom estado.'),
(2, 2, 2, 'Faltando instrumentos', 2, '2024-11-24 09:00:00', 'Faltando uma tesoura do tipo Metzenbaum.'),
(3, 3, 3, 'Encaminhado para o CME', 3, '2024-11-24 09:30:00', 'Kit enviado para o Centro de Material Esterilizado.'),
(4, 4, 4, 'Confirmado recebimento', 4, '2024-11-24 10:00:00', 'Kit completo e pronto para uso.'),
(5, 5, 5, 'Faltando instrumentos', 5, '2024-11-24 10:30:00', 'Faltando um afastador do tipo Finochietto.'),
(6, 6, 6, 'Encaminhado para o CME', 6, '2024-11-24 11:00:00', 'Kit enviado para esterilização.'),
(7, 7, 7, 'Confirmado recebimento', 7, '2024-11-24 11:30:00', 'Kit completo, sem problemas.'),
(8, 8, 8, 'Faltando instrumentos', 8, '2024-11-24 12:00:00', 'Faltando uma pinça Adson.'),
(9, 9, 9, 'Encaminhado para o CME', 9, '2024-11-24 12:30:00', 'Kit enviado para a revisão final no CME.'),
(10, 10, 10, 'Confirmado recebimento', 10, '2024-11-24 13:00:00', 'Kit com todos os instrumentos necessários.'),
(11, 11, 11, 'Faltando instrumentos', 11, '2024-11-24 13:30:00', 'Faltando um bisturi tipo 10.'),
(12, 12, 12, 'Encaminhado para o CME', 12, '2024-11-24 14:00:00', 'Kit encaminhado para esterilização.'),
(13, 13, 13, 'Confirmado recebimento', 13, '2024-11-24 14:30:00', 'Kit verificado e pronto para uso.'),
(14, 14, 14, 'Faltando instrumentos', 14, '2024-11-24 15:00:00', 'Faltando uma tesoura do tipo Iris.'),
(15, 15, 15, 'Encaminhado para o CME', 15, '2024-11-24 15:30:00', 'Kit encaminhado para esterilização.');

------------------------------------------------------------

INSERT INTO kit_status_CME (id, id_kit, id_ferramentas, status, usuario_id, data_hora_status, observacao) VALUES
(1, 1, 1, 'Recebimento confirmado', 1, '2024-11-24 08:30:00', 'Kit recebido e em boas condições.'),
(2, 2, 2, 'Faltando instrumentos', 2, '2024-11-24 09:00:00', 'Faltando uma tesoura Metzenbaum.'),
(3, 3, 3, 'Recebimento confirmado', 3, '2024-11-24 09:30:00', 'Kit completo, pronto para uso.'),
(4, 4, 4, 'Faltando instrumentos', 4, '2024-11-24 10:00:00', 'Faltando um afastador Finochietto.'),
(5, 5, 5, 'Recebimento confirmado', 5, '2024-11-24 10:30:00', 'Kit verificado e em conformidade.'),
(6, 6, 6, 'Faltando instrumentos', 6, '2024-11-24 11:00:00', 'Faltando uma pinça Adson.'),
(7, 7, 7, 'Recebimento confirmado', 7, '2024-11-24 11:30:00', 'Kit em perfeitas condições.'),
(8, 8, 8, 'Faltando instrumentos', 8, '2024-11-24 12:00:00', 'Faltando um bisturi tipo 10.'),
(9, 9, 9, 'Recebimento confirmado', 9, '2024-11-24 12:30:00', 'Kit completo e pronto para a cirurgia.'),
(10, 10, 10, 'Faltando instrumentos', 10, '2024-11-24 13:00:00', 'Faltando uma tesoura Iris.'),
(11, 11, 11, 'Recebimento confirmado', 11, '2024-11-24 13:30:00', 'Kit completo e verificado.'),
(12, 12, 12, 'Faltando instrumentos', 12, '2024-11-24 14:00:00', 'Faltando uma pinça Brown-Adson.'),
(13, 13, 13, 'Recebimento confirmado', 13, '2024-11-24 14:30:00', 'Kit recebido e em excelente estado.'),
(14, 14, 14, 'Faltando instrumentos', 14, '2024-11-24 15:00:00', 'Faltando uma tesoura Potts-Smith.'),
(15, 15, 15, 'Recebimento confirmado', 15, '2024-11-24 15:30:00', 'Kit completo, pronto para uso.');