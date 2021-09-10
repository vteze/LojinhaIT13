// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:front_end/widgets/custom_app_bar.dart';
import 'package:front_end/widgets/grid_list_view.dart';
import 'package:front_end/DTOs/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var _products = List<Product>.empty(growable: true);

  // função async para fazer chamada ao backend
  Future<List<Product>> getProducts() async {
    // o local host do android e do pc são diferentes. Esse é o ip padrao do android emulator
    var url = Uri.parse('https://10.0.2.2:5001/produtos');
    var products = List<Product>.empty(growable: true);

    var response = await http.get(url);

    var productList = json.decode(response.body);

    for (Map<String, dynamic> product in productList) {
      products.add(Product.fromJson(product));
    }
    return products;
  }

  // essa função é chamada apenas na primeira criação do widget
  // para remontar o widget tem que fazer um reload completo(restart) e não o hot reload simples
  @override
  void initState() {
    super.initState();
    getProducts().then((var products) => setState(() {
          _products = products;
        }));
  }

  // função que monda o layout onde os produtos vão se posicionar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GridViewList(_products),
    );
  }
}
