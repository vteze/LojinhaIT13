//import 'dart:html';
import 'package:front_end/models/photo.dart';
import 'package:front_end/models/product.dart';
import 'package:front_end/widgets/product_grid_list_cart.dart';
import 'package:front_end/utils/array_cart.dart' as itens;
import 'package:front_end/models/product.dart';
import 'package:flutter/material.dart';
import 'package:back_end/Controller/PedidosController.cs';



// TODO: implementar a lista de carrinho
class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}
//  List<Product> item(BuildContext context) {
//     return itens.list;
//   }

class _ShoppingCartState extends State<ShoppingCart> {
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
         itemBuilder: (BuildContext context, int index) 
         {  
           return Card(
             elevation: 5,
             margin: EdgeInsets.all(5),
            child: ListTile
            (
              contentPadding: EdgeInsets.only(left: 0, right: 20), //usado para tirar o padding de dentro do ListTile
              leading: Row( // row que contem (botao mais menos e quantidade) e imagem do item.
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(   //Row onde fica o botão de mais e menos e Quantidade
                  children: [
                    IconButton(onPressed: async () {
                      var url = Uri.parse(
                      'https://10.0.2.2:5001/carrinho/adiciona/$idPedido?produtoId=${product.codigo}',
                      );
                      var headerContent = <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      };
                      final response = await http.put(url, header: headerContent);
                      if (response.statusCode == 200)
                        
                    }, 
                    icon: Icon(Icons.remove)),
                    Text(itens.list[index].quantity.toString()),
                    IconButton(onPressed: () {

                    },
                     icon: Icon(Icons.add))
                  ],
                ),
                SizedBox( //Foi usado sizedBox Para regular o tamanho da imagem
                  width: 50,
                  height: 50,
                  child: Image.asset(itens.list[index].assetName),
                )
              ],
            ),
              title: Text(itens.list[index].title),
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
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 Future<String?> addToCart(Product product, int idPedido) async {
    var url = Uri.parse(
      'https://10.0.2.2:5001/Pedidos/adiciona/$idPedido?produtoId=${product.codigo}',
    );
    var headerContent = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(url, header: headerContent);
    if (response.statusCode == 200) {
      Pedido.fromJson(jsonDecode(response.body));
    } else {
      return response.body.toString();
    }
  } 