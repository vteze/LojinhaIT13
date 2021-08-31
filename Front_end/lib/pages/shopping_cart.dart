import 'package:flutter/material.dart';

// TODO: implementar a lista de carrinho
class ShoppingKart extends StatefulWidget {
  ShoppingKart({Key? key}) : super(key: key);

  @override
  _ShoppingKartState createState() => _ShoppingKartState();
}

class _ShoppingKartState extends State<ShoppingKart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Center(
          child: Text(
            "Olá"
          ),
        )
    );
  }
}