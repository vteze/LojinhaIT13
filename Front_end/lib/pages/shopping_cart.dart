//import 'dart:html';
import 'package:front_end/DTOs/PedidoDTO.dart';
import 'package:front_end/stateModels/cartId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // Estados do widget
  var exceptionMessage;
  PedidoDTO carrinho = PedidoDTO();
  int? carrinhoId;

  // função que faz a requisição ao backend para trazer os itens do carrinho do cliente
  Future<PedidoDTO?> initialCart() async {
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/$carrinhoId',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      carrinho = PedidoDTO.fromJson(jsonDecode(response.body));
      return carrinho;
    } else {
      setState(() {
        exceptionMessage = response.body.toString();
      });
    }
  }

  // função para incrementar ou decrementar a quantidade do produto
  void incrementOrDecrement(int index, String route) async {
    // requisição ao backend para diminuir ou aumentar a quantidade do produto
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/$route/$carrinhoId?produtoId=${carrinho.itens[index]!.codigoProduto}',
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

  // função para remover o produto
  void removeProduct(index) async {
    var url = Uri.parse(
        "https://10.0.2.2:5001/Pedidos/carrinho/remove/$carrinhoId?produtoId=${carrinho.itens[index]!.codigoProduto}");

    var headerContent = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.delete(url, headers: headerContent);

    if (response.statusCode == 200) {
      setState(() {
        carrinho = PedidoDTO.fromJson(jsonDecode(response.body));
      });
    } else {
      setState(() {
        exceptionMessage = response.body.toString();
      });
    }
  }

  // requisiçao para fechar o pedido
  // obs: incompleto
  void closeCart() async {
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/carrinho/fecha/$carrinhoId',
    );
    var headerContent = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.post(url, headers: headerContent);

    if (response.statusCode == 200) {
      // novo estado vazio após fechar pedido
      setState(() {
        carrinho = PedidoDTO();
      });
      var pedidoFechado = PedidoDTO.fromJson(jsonDecode(response.body));
      var url = Uri.parse(
          'https://10.0.2.2:5001/clientes/${pedidoFechado.clienteId}');
      response = await http.get(url);
      var novoCarrinho = PedidoDTO.fromJson(jsonDecode(response.body));
      context.read<CartId>().alterValue(novoCarrinho.codigo!);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Pedido realizado com sucesso!',
          ),
          duration: Duration(milliseconds: 3000),
        ),
      );
    } else {
      setState(() {
        exceptionMessage = response.body.toString();
      });
      print(exceptionMessage);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ocorreu um erro ao realizar sua compra.',
          ),
          duration: Duration(milliseconds: 3000),
        ),
      );
    }
  }

  // popup que abre ao clicar no botão comprar
  AlertDialog? showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget confirmButton = TextButton(
      child: Text("Confirmar"),
      onPressed: () => closeCart(),
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aviso!"),
      content: Text("Deseja finalizar a compra?"),
      actions: <Widget>[
        cancelButton,
        confirmButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Função chamada toda vez que o widget é contruído.
  // Essa função ta chamando outra função que tá fazendo uma requisição para
  // o backend retornar os produtos do carrinho específico
  @override
  void initState() {
    super.initState();
    carrinhoId = context.read<CartId>().cartId;
    initialCart().then((cart) {
      if (cart != null) {
        setState(() {
          carrinho = cart;
        });
      }
    });
  }

  // Chama a função dispose toda vez que sai da tela do carrinho
  // fazendo o widget do carrinho "Desmontar"
  @override
  void dispose() {
    super.dispose();
    print('dispose');
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
      body: carrinho.itens.length == 0
          ? Center(
              child: Text(
                'Carrinho Vazio',
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.builder(
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
                              Text(
                                  carrinho.itens[index]!.quantidade.toString()),
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
                            child: Image.network(
                                carrinho.itens[index]!.urlImagem.toString()),
                          )
                        ],
                      ),
                      title: Text(
                        carrinho.itens[index]!.nomeProduto.toString(),
                      ),
                      subtitle: Text(
                        'R\$ ' +
                            carrinho.itens[index]!.precoUnitario.toString(),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeProduct(index),
                        icon: Icon(Icons.remove_shopping_cart_outlined),
                      ),
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
                  onPressed: carrinho.itens.length > 0
                      ? () => showAlertDialog(context)
                      : null,
                  child: Text(
                    "Comprar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        carrinho.itens.length > 0
                            ? Theme.of(context).accentColor
                            : Colors.grey),
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
