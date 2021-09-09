//import 'dart:html';
import 'package:front_end/DTOs/PedidoDTO.dart';
import 'package:front_end/utils/array_cart.dart' as itens;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // Estados do widget
  int pedidoId = 2;
  var exceptionMessage;
  PedidoDTO carrinho = PedidoDTO();

  // função que faz a requisição ao backend para trazer os itens do carrinho do cliente
  Future<PedidoDTO?> initialCart() async {
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/$pedidoId',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      carrinho = PedidoDTO.fromJson(jsonDecode(response.body));
      return carrinho;
    } else {
      setState(() {
        exceptionMessage = response.body.toString();
      });
      print(exceptionMessage);
    }
  }

  void incrementOrDecrement(int index, String route) async {
    // requisição ao backend para diminuir ou aumentar a quantidade do produto
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/$route/$pedidoId?produtoId=${carrinho.itens[index]!.codigoProduto}',
    );

    var headerContent = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.put(url, headers: headerContent);

    if (response.statusCode == 200) {
      setState(() {
        carrinho = PedidoDTO.fromJson(jsonDecode(response.body));
      });
    } else {
      setState(() {
        exceptionMessage = response.body.toString();
      });
      print(exceptionMessage);
    }
  }

  // Função chamada toda vez que o widget é contruído.
  // Essa função ta chamando outra função que tá fazendo uma requisição para
  // o backend retornar os produtos do carrinho específico
  @override
  void initState() {
    super.initState();
    initialCart().then((cart) {
      setState(() {
        carrinho = cart!;
      });
    });
  }

  // Chama a função dispose toda vez que sai da tela do carrinho
  // fazendo o widget do carrinho "Desmontar"
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text(
          "Carrinho",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: carrinho.itens.length,
        itemBuilder: (BuildContext context, int index) {
          if (carrinho.itens[index] == null) {
            return Text('');
          } else {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(5),
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  left: 0,
                  right: 20,
                ), //usado para tirar o padding de dentro do ListTile
                leading: Row(
                  // row que contem (botao mais menos e quantidade) e imagem do item.
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      //Row onde fica o botão de mais e menos e Quantidade
                      children: [
                        IconButton(
                          onPressed: () =>
                              incrementOrDecrement(index, 'diminui'),
                          icon: Icon(Icons.remove),
                        ),
                        Text(carrinho.itens[index]!.quantidade.toString()),
                        IconButton(
                          onPressed: () =>
                              incrementOrDecrement(index, 'adiciona'),
                          icon: Icon(Icons.add),
                        )
                      ],
                    ),
                    SizedBox(
                      //Foi usado sizedBox Para regular o tamanho da imagem
                      width: 50,
                      height: 50,
                      // o banco de dados tá retornando null para imagem e descrição
                      // por isso fiz estático
                      child: Image.asset('images/2.jpg'),
                    )
                  ],
                ),
                title: Text(
                  carrinho.itens[index]!.nomeProduto.toString(),
                ),
                subtitle: Text(
                  carrinho.itens[index]!.precoUnitario.toString(),
                ),
                trailing: Icon(Icons.remove_shopping_cart_outlined),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor total',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5.7),
                  Text(
                    "R\$ ${carrinho.valorTotal == null ? "0.00" : carrinho.valorTotal}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Comprar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
