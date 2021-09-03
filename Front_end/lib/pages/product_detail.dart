import 'package:flutter/material.dart';
import 'package:front_end/DTOs/Product.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Container(
              child: Column(
                  // Lista de elementos que irão cobrir a tela em dereção de coluna.
                  // O layout foi dividido em 3 áreas principais: Imagem, Área de texto, Botão.
                  children: <Widget>[
                // Área da imagem
                Expanded(
                    flex: 2, // faz a imagem cobrir espaço a mais na coluna
                    child: Stack(children: <Widget>[
                      Hero(
                          tag: "Produto Teste",
                          child: Image.network(widget.product.urlImagem!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity)),
                      Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: IconButton(
                              icon: Icon(Icons.arrow_back,
                                  color: Theme.of(context).accentColor,
                                  size: 40.0),
                              onPressed: () => Navigator.of(context).pop())),
                    ])),
                // Área do texto
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Title
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(widget.product.nome!,
                                    style: TextStyle(fontSize: 20)),
                              ),
                              // Subtitle
                              Text('R\$ '+widget.product.precoUnitario!,
                                  style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500)),
                              // Divider
                              Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 16.0),
                                  height: 2.0,
                                  width: double.infinity,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(widget.product.descricao!),
                            ]))),
                // Área do botão
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)))),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "${widget.product.nome} foi adicionado ao carrinho"),
                        duration: Duration(milliseconds: 1000),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Adicionar ao carrinho",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ])),
        ));
  }
}
