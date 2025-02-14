CREATE TABLE Cliente (
    ClienteID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Endereco TEXT NOT NULL,
    Telefone VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Pizza (
    PizzaID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    PrecoUnitario DECIMAL(10,2) NOT NULL CHECK (PrecoUnitario > 0)
);

CREATE TABLE Pedido (
    PedidoID SERIAL PRIMARY KEY,
    DataPedido DATE NOT NULL,
    HoraPedido TIME NOT NULL,
    ClienteID INT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID) ON DELETE CASCADE
);

CREATE TABLE ItemPedido (
    PedidoID INT NOT NULL,
    ItemID INT NOT NULL,
    PizzaID INT NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    PRIMARY KEY (PedidoID, ItemID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID) ON DELETE CASCADE,
    FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID) ON DELETE CASCADE
);

CREATE TABLE Entrega (
    EntregaID SERIAL PRIMARY KEY,
    PedidoID INT NOT NULL UNIQUE,
    Tipo VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Saida VARCHAR(30) NOT NULL,
    Chegada VARCHAR(30) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);

CREATE TABLE Pagamento (
    PagamentoID SERIAL PRIMARY KEY,
    DataPagamento TIMESTAMP NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    PedidoID INT NOT NULL,
    ClienteID INT NOT NULL,
    Total DECIMAL(10,2) NOT NULL CHECK (Total >= 0),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID) ON DELETE CASCADE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID) ON DELETE CASCADE
);

-- inserindo dados

-- tabela Cliente
INSERT INTO Cliente (Nome, Sobrenome, Endereco, Telefone, Email) VALUES
('Ana', 'Silva', 'Rua das Flores, 123', '11987654321', 'ana.silva@email.com'),
('Carlos', 'Oliveira', 'Av. Paulista, 456', '11976543210', 'carlos.oliveira@email.com'),
('Mariana', 'Souza', 'Rua do Sol, 789', '11965432109', 'mariana.souza@email.com'),
('José', 'Santos', 'Travessa Lua, 321', '11954321098', 'jose.santos@email.com'),
('Beatriz', 'Ferreira', 'Rua das Palmeiras, 101', '11943210987', 'beatriz.ferreira@email.com'),
('Lucas', 'Costa', 'Av. Atlântica, 202', '11932109876', 'lucas.costa@email.com'),
('Fernanda', 'Rodrigues', 'Rua da Praia, 303', '11921098765', 'fernanda.rodrigues@email.com'),
('Ricardo', 'Almeida', 'Alameda Rio, 404', '11910987654', 'ricardo.almeida@email.com'),
('Camila', 'Barbosa', 'Rua Verde, 505', '11909876543', 'camila.barbosa@email.com'),
('Pedro', 'Martins', 'Praça Azul, 606', '11998765432', 'pedro.martins@email.com'),
('Gabriela', 'Lima', 'Rua Central, 707', '11987654320', 'gabriela.lima@email.com'),
('André', 'Ribeiro', 'Av. das Águas, 808', '11976543219', 'andre.ribeiro@email.com'),
('Juliana', 'Gomes', 'Travessa Sul, 909', '11965432118', 'juliana.gomes@email.com'),
('Fábio', 'Pereira', 'Rua Norte, 111', '11954321017', 'fabio.pereira@email.com'),
('Tatiane', 'Mendes', 'Av. Estrela, 222', '11943210916', 'tatiane.mendes@email.com'),
('Rodrigo', 'Carvalho', 'Rua da Lua, 333', '11932109815', 'rodrigo.carvalho@email.com'),
('Patrícia', 'Dantas', 'Av. Primavera, 444', '11921098714', 'patricia.dantas@email.com'),
('Marcelo', 'Nascimento', 'Alameda Brisa, 555', '11910987613', 'marcelo.nascimento@email.com'),
('Bianca', 'Moraes', 'Rua do Lago, 666', '11909876512', 'bianca.moraes@email.com'),
('Daniel', 'Vieira', 'Av. Beira-Mar, 777', '11908765411', 'daniel.vieira@email.com');

--tabela pzza
INSERT INTO Pizza (Nome, Descricao, PrecoUnitario) VALUES
('Margherita', 'Molho de tomate, mussarela e manjericão', 39.90),
('Pepperoni', 'Molho de tomate, mussarela e pepperoni', 44.90),
('Frango com Catupiry', 'Molho de tomate, frango desfiado e catupiry', 46.90),
('Quatro Queijos', 'Mussarela, parmesão, provolone e gorgonzola', 49.90),
('Calabresa', 'Molho de tomate, mussarela, calabresa e cebola', 42.90),
('Portuguesa', 'Presunto, mussarela, ovos, cebola, azeitonas e ervilhas', 45.90),
('Vegetariana', 'Molho de tomate, mussarela, champignon, pimentão e azeitonas', 41.90),
('Bacon Lovers', 'Molho de tomate, mussarela e bacon crocante', 47.90),
('Moda da Casa', 'Molho especial, mussarela, presunto, palmito e ervilhas', 50.90),
('Carne Seca', 'Molho de tomate, carne seca desfiada e requeijão', 48.90),
('Chocolate', 'Chocolate ao leite, granulado e leite condensado', 35.90),
('Romeu e Julieta', 'Goiabada e queijo minas', 37.90),
('Alho e Óleo', 'Molho de tomate, mussarela, alho frito e orégano', 39.90),
('Mexicana', 'Molho picante, carne moída, cebola roxa e pimenta jalapeño', 51.90),
('Camarão', 'Molho de tomate, camarão, catupiry e ervas finas', 56.90);

--tabela pedido
INSERT INTO Pedido (DataPedido, HoraPedido, ClienteID) VALUES
('2024-02-01', '12:30:00', 1),
('2024-02-01', '13:15:00', 2),
('2024-02-01', '14:00:00', 3),
('2024-02-02', '18:45:00', 4),
('2024-02-02', '19:10:00', 5),
('2024-02-02', '20:30:00', 6),
('2024-02-03', '11:20:00', 7),
('2024-02-03', '12:00:00', 8),
('2024-02-03', '12:45:00', 9),
('2024-02-04', '17:30:00', 10),
('2024-02-04', '18:00:00', 11),
('2024-02-04', '18:30:00', 12),
('2024-02-05', '19:45:00', 13),
('2024-02-05', '20:10:00', 14),
('2024-02-05', '20:45:00', 15),
('2024-02-06', '13:15:00', 16),
('2024-02-06', '14:30:00', 17),
('2024-02-06', '15:00:00', 18),
('2024-02-07', '16:45:00', 19),
('2024-02-07', '17:20:00', 20);

-- tabela ItemPedido
INSERT INTO ItemPedido (PedidoID, ItemID, PizzaID, Quantidade) VALUES
(1, 1, 1, 2),
(1, 2, 3, 1),
(2, 3, 2, 1),
(2, 4, 5, 2),
(3, 5, 4, 3),
(3, 6, 6, 1),
(4, 7, 7, 2),
(4, 8, 8, 1),
(5, 9, 9, 2),
(5, 10, 10, 1),
(6, 11, 11, 1),
(6, 12, 12, 2),
(7, 13, 13, 3),
(7, 14, 14, 1),
(8, 15, 15, 2),
(8, 16, 1, 1),
(9, 17, 2, 3),
(9, 18, 3, 1),
(10, 19, 4, 2),
(10, 20, 5, 1);

-- tabela Entrega
INSERT INTO Entrega (PedidoID, Tipo, Status, Saida, Chegada) VALUES
(1, 'Motoboy', 'Entregue', '13:00:00', '13:30:00'),
(2, 'Motoboy', 'Entregue', '13:30:00', '14:00:00'),
(3, 'Motoboy', 'Entregue', '14:30:00', '15:00:00'),
(4, 'Motoboy', 'Entregue', '19:00:00', '19:45:00'),
(5, 'Motoboy', 'Entregue', '19:30:00', '20:10:00'),
(6, 'Motoboy', 'Entregue', '20:45:00', '21:15:00'),
(7, 'Motoboy', 'Entregue', '11:45:00', '12:15:00'),
(8, 'Motoboy', 'Entregue', '12:10:00', '12:40:00'),
(9, 'Motoboy', 'Entregue', '13:00:00', '13:30:00'),
(10, 'Motoboy', 'Entregue', '17:50:00', '18:20:00'),
(11, 'Motoboy', 'Entregue', '18:15:00', '18:45:00'),
(12, 'Motoboy', 'Entregue', '18:40:00', '19:10:00'),
(13, 'Motoboy', 'Entregue', '20:00:00', '20:30:00'),
(14, 'Motoboy', 'Entregue', '20:20:00', '20:50:00'),
(15, 'Motoboy', 'Entregue', '21:00:00', '21:30:00'),
(16, 'Motoboy', 'Entregue', '13:30:00', '14:00:00'),
(17, 'Motoboy', 'Entregue', '15:00:00', '15:30:00'),
(18, 'Motoboy', 'Entregue', '16:00:00', '16:30:00'),
(19, 'Motoboy', 'Entregue', '17:00:00', '17:30:00'),
(20, 'Motoboy', 'Entregue', '17:45:00', '18:15:00');

-- tabela Pagamento
INSERT INTO Pagamento (DataPagamento, Tipo, PedidoID, ClienteID, Total) VALUES
('2024-02-01', 'Cartão de Crédito', 1, 1, 79.80),
('2024-02-01', 'Pix', 2, 2, 87.80),
('2024-02-01', 'Dinheiro', 3, 3, 149.70),
('2024-02-02', 'Cartão de Débito', 4, 4, 95.80),
('2024-02-02', 'Cartão de Crédito', 5, 5, 88.80),
('2024-02-02', 'Pix', 6, 6, 93.80),
('2024-02-03', 'Dinheiro', 7, 7, 125.70),
('2024-02-03', 'Cartão de Crédito', 8, 8, 92.80),
('2024-02-03', 'Pix', 9, 9, 139.70),
('2024-02-04', 'Cartão de Débito', 10, 10, 81.80),
('2024-02-04', 'Cartão de Crédito', 11, 11, 92.90),
('2024-02-04', 'Pix', 12, 12, 85.90),
('2024-02-05', 'Dinheiro', 13, 13, 102.90),
('2024-02-05', 'Cartão de Crédito', 14, 14, 95.80),
('2024-02-05', 'Pix', 15, 15, 113.90),
('2024-02-06', 'Cartão de Débito', 16, 16, 72.90),
('2024-02-06', 'Cartão de Crédito', 17, 17, 85.90),
('2024-02-06', 'Pix', 18, 18, 97.80),
('2024-02-07', 'Dinheiro', 19, 19, 99.90),
('2024-02-07', 'Cartão de Crédito', 20, 20, 102.80);