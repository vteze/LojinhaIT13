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
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Caneta',1.50,'Caneta BIC Cristal Azul Esferográfica (1 un)','https://images.vexels.com/media/users/3/217134/isolated/preview/5b3bbaef8fa13aa1096d2a2c8ac67048-ilustracao-da-caneta-com-tampa.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Lápis',1.98,'Lápis BIC Grafite (1  un)','https://res.cloudinary.com/beleza-na-web/image/upload/w_1500,f_auto,fl_progressive,q_auto:eco,w_800/v1/imagens/product/88120/e4832d36-9327-4a6f-af74-75c8ad4802d1-88120-vult-rica-marre-preto-preto-lapis-de-olho-11g.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Caderno',17.90,'Caderno Tilibra 100 folhas (1 un)','http://www.fablablivresp.prefeitura.sp.gov.br/sites/default/files/unnamed.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Borracha',7.50,'Borracha Faber Castell (1 un)','https://w7.pngwing.com/pngs/130/626/png-transparent-red-product-font-design-eraser-rectangle-microsoft-azure-download-with-transparent-background.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Apontador',9.50,'Apontador Faber Castell (1 un)','https://images.tcdn.com.br/img/img_prod/866298/apontador_jumbo_cis_ideal_para_giz_e_lapis_jumbo_83_1_fcec333d0e11afbe926de0cda3563103.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Grampeador',49.98,'Grampeador Maped (1 un)','http://pngimg.com/uploads/stapler/stapler_PNG33.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Clipes',20.69,'Clipes Tilibra (120 un)','https://media.cotabest.com.br/media/sku/clips-galvanizados-no-2-prata-caixa-100-unidades-kaz-cx.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Prancheta',10.50,'Prancheta Waleu (1 un)','https://lidedepartamentos.com.br/media/catalog/product/cache/bb8c2dbc92a240249f8b9eb073a808b3/p/r/prancheta.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Mousepad',18.98,'Mousepad Multilaser (1 un)','https://zowie.benq.com/content/dam/game/en/product/mouse-pad/p-sr/gallery/p-sr-top.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Papel Ofício',27.50,'Papel ofício Seninha (100 folhas)','https://images.tcdn.com.br/img/img_prod/758054/papel_sulfite_a4_report_75gr_10_resmas_500_folhas_1133_3_7a2b098bae149fef6c37cee42cf6d280.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Canetas Coloridas',8.50,'Canetas Coloridas Fashion BIC 4 cores (Conjunto com 4 un)','https://images.tcdn.com.br/img/img_prod/687835/caneta_esferografica_colorida_bic_605_1_20190404174241.png');
INSERT INTO ITA13_lojinha.dbo.Produtos (Nome, Preco, Descricao, UrlImagem)
VALUES ('Canetinha Colorida',49.99,'Caneta Hidrográfica 10 Cores Super Soft Faber Castell Ponta Brush (Conjunto com 10 un)','https://static3.tcdn.com.br/img/img_prod/586385/canetinha_hidrocor_10_cores_super_soft_faber_castell_2979_1_20190806151911.png');


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

