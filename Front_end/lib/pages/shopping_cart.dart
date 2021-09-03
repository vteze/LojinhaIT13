//import 'dart:html';
import 'package:front_end/models/product.dart';
import 'package:front_end/widgets/product_grid_list_cart.dart';
import 'package:front_end/utils/array_cart.dart';
import 'package:front_end/models/product.dart';
import 'package:flutter/material.dart';

// ## ESTE É O QUE ESTÁVAMOS TENTANDO DO LISTVIEW
// class ListViewHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const ListTile(
//                 leading: Icon(Icons.album),
//                 title: Text('The Enchanted Nightingale'),
//                 subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     child: const Text('BUY TICKETS'),
//                     onPressed: () {/* ... */},
//                   ),
//                   const SizedBox(width: 8),
//                   TextButton(
//                     child: const Text('LISTEN'),
//                     onPressed: () {/* ... */},
//                   ),
//                   const SizedBox(width: 8),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Card(
//             child: ListTile(
//                 title: Text("Anchor"),
//                 subtitle: Text("Lower the anchor."),
//                 leading: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//                 trailing: Icon(Icons.star))),
//         Card(
//             child: ListTile(
//           title: Text("Alarm"),
//           subtitle: Text("This is the time."),
//           leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//           //trailing: Icon(Icons.star)
//         )),
//         Card(
//             child: ListTile(
//           title: Text("Ballot"),
//           subtitle: Text("Cast your vote."),
//           leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//           // trailing: Icon(Icons.star)
//         ))
//       ],
//     );
//   }
// }

// TODO: implementar a lista de carrinho
class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

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
      body:  // CHAMA AQUI O LIST VIEW ->   ListViewHome() 
      //  
      ,
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
