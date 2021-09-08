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
  // Estados da aplicação
  int pedidoId = 3;
  var exceptionMessage;

  late PedidoDTO? carrinho;

  // função que faz a requisição ao backend
  void initialCart() async {
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/$pedidoId',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      carrinho = PedidoDTO.fromJson(jsonDecode(response.body));
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
    //TODO: trocar a lógica de como pupolar o carrinho
    // Do jeito atual o carrinho não que a ser populado antes do código carregar
    // por causa das ações assíncronas. obs: o initstate não pode usar async
    initialCart();
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
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: itens.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(5),
            child: ListTile(
              contentPadding: EdgeInsets.only(
                  left: 0,
                  right: 20), //usado para tirar o padding de dentro do ListTile
              leading: Row(
                // row que contem (botao mais menos e quantidade) e imagem do item.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    //Row onde fica o botão de mais e menos e Quantidade
                    children: [
                      IconButton(
                          onPressed: () async {
                            // requisição ao backend para diminuir a quantidade do produto
                            var url = Uri.parse(
                              'https://10.0.2.2:5001/Pedidos/carrinho/diminui/$pedidoId?produtoId=${itens.list[index].code}',
                            );

                            var headerContent = <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            };

                            final response =
                                await http.put(url, headers: headerContent);

                            if (response.statusCode == 200) {
                              PedidoDTO.fromJson(jsonDecode(response.body));
                              print('Success');
                            } else {
                              setState(() {
                                exceptionMessage = response.body.toString();
                              });
                              print(exceptionMessage);
                            }
                          },
                          icon: Icon(Icons.remove)),
                      Text(carrinho!.itens![index]!.quantidade.toString()),
                      IconButton(
                          onPressed: () async {
                            // requisição ao backend para aumentar a quantidade do produto
                            var url = Uri.parse(
                              'https://10.0.2.2:5001/Pedidos/carrinho/adiciona/$pedidoId?produtoId=${itens.list[index].code}',
                            );

                            var headerContent = <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            };

                            final response =
                                await http.put(url, headers: headerContent);

                            if (response.statusCode == 200) {
                              PedidoDTO.fromJson(jsonDecode(response.body));
                              print('Success');
                            } else {
                              setState(() {
                                exceptionMessage = response.body.toString();
                              });
                              print(exceptionMessage);
                            }
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  SizedBox(
                    //Foi usado sizedBox Para regular o tamanho da imagem
                    width: 50,
                    height: 50,
                    child: Image.asset(itens.list[index].image),
                  )
                ],
              ),
              title: Text(itens.list[index].name),
              subtitle: Text(itens.list[index].price.toString()),
              trailing: Icon(Icons.remove_shopping_cart_outlined),
            ),
          );
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
                    "R\$ 25,00",
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
