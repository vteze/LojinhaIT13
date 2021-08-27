-- Popular tabelas
-- Tabela Clientes
INSERT INTO ITA13_lojinha.dbo.Clientes (Nome, Email)
VALUES ('Rogerio', 'rogerinhodoinga@gmail.com');
INSERT INTO ITA13_lojinha.dbo.Clientes (Nome, Email)
VALUES ('Cleber', 'clebinhodelas@gmail.com');
INSERT INTO ITA13_lojinha.dbo.Clientes (Nome, Email)
VALUES ('Silvio', 'quemquerdinheiro@gmail.com');
INSERT INTO ITA13_lojinha.dbo.Clientes (Nome, Email)
VALUES ('Euclides', 'euclidespastordeusemais@gmail.com');
INSERT INTO ITA13_lojinha.dbo.Clientes (Nome, Email)
VALUES ('Peixoto', 'peixotelas@gmail.com');

-- Tabela Produtos
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Rexona', 15.00);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Pedaço de Vidro', 150.00);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Goma de Mascar', 2.00);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Graveto', 1.00);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Lapiseira', 9.99);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Caneca', 49.90);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Garrafa', 4.54);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Caderno', 39.20);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Fone de ouvido Airpod', 929.50);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Rádio-relógio', 168.30);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Pato de borracha', 59.44);
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco)
VALUES ('Sabonete Phoebo', 2.45);

-- Tabela Pedidos
INSERT INTO ITA13_lojinha.dbo.Pedidos (ClienteId, DataEmissao)
VALUES (1, '2021-07-23');
INSERT INTO ITA13_lojinha.dbo.Pedidos (ClienteId, DataEmissao)
VALUES (2, '2021-08-01');


-- Tabela PedidoProduto
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (1, 1, 5, 15);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (1, 3, 2, 2);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (1, 4, 25, 1);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (1, 5, 1, 9.99);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (2, 6, 2, 49.90);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (2, 2, 1, 150);
INSERT INTO ITA13_lojinha.dbo.PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario)
VALUES (2, 8, 3, 39.20);

-- Tabela Carrinhos
INSERT INTO ITA13_lojinha.dbo.Carrinhos (ClienteId)
VALUES (3);

-- Tabela CarrinhoProduto
INSERT INTO ITA13_lojinha.dbo.CarrinhoProduto(CarrinhoId, ProdutoId, Quantidade)
VALUES (1, 9, 1);
INSERT INTO ITA13_lojinha.dbo.CarrinhoProduto(CarrinhoId, ProdutoId, Quantidade)
VALUES (1, 11, 5);
INSERT INTO ITA13_lojinha.dbo.CarrinhoProduto(CarrinhoId, ProdutoId, Quantidade)
VALUES (1, 12, 12);

