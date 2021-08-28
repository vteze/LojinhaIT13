import 'package:flutter/material.dart';
import 'package:front_end/models/photo.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail( this.photo, {Key? key}) : super(key: key);

  final Photo photo;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          // Lista de elementos que irão cobrir a tela em dereção de coluna.
          // O layout foi dividido em 3 áreas principais: Imagem, Área de texto, Botão.
          children: <Widget>[
            // Área da imagem
            Expanded(
              flex: 2, // faz a imagem cobrir espaço a mais na coluna
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "Produto Teste",
                    child: Image.asset(
                      widget.photo.assetName,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.cyan,
                        size: 40.0
                      ),
                      onPressed: () => Navigator.of(context).pop()
                    )
                  ),
                ]
              )
            ),
            // área do texto
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        widget.photo.title,
                        style: TextStyle(fontSize: 20)
                      ),
                    ),
                    Text(
                      widget.photo.subtitle,
                      style: TextStyle(
                        color: Color(0xff8E8EF6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    // Divider
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        height: 2.0,
                        width: 221.0,
                        color: Color(0xffDEDEDE),
                      ),
                    ),
                    Text('Suposta descrição'),
                  ]
                )
              )
            ),
            // Área do botão
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.photo.title} has been added to your basket"),
                    duration: Duration(milliseconds: 1000), 
                  ),
                );
              },
              child: Center(
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}