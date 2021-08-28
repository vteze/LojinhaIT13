import 'package:flutter/material.dart';

// TODO: implementar a lista de carrinho
class ShoppingBasketPage extends StatefulWidget {
  ShoppingBasketPage({Key? key}) : super(key: key);

  @override
  _ShoppingBasketPageState createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {

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