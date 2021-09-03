// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/material.dart';
// import 'package:front_end/models/product.dart';
// import 'package:front_end/widgets/product_card.dart';
// import 'package:front_end/utils/array_cart.dart' as products;

// class Listview  extends StatelessWidget {
//   const CartGridListView({
//     Key? key,
//   }) : super(key: key);

//   // Os widgets estão stateless, mas devem virar stateful caso precisem carregar os produtos do banco de dados
//   // final GridListDemoType type;

//   // Array estático de imagens apenas para teste visual

//   List<Product> _products(BuildContext context) {
//     return Product.list;
//   }

//   //Construção do layout do grid_list_view
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // WARNING: Talvez tenha que mudar o contrutor do gridView no futuro
//       body: 
//       GridView.count(
//         restorationId: 'grid_view_demo_grid_offset',
//         crossAxisCount: 1,
//         mainAxisSpacing: 8,
//         padding: const EdgeInsets.all(16),
//         childAspectRatio: 1,
//         children: _products(context).map<Widget>((products) {
//           Column(children: const <Widget>[
//           ]);
//         }).toList(),
//       ),
//     );
//   }
// }
