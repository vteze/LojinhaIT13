import 'package:flutter/material.dart';
import 'package:front_end/DTOs/Product.dart';
import 'package:front_end/widgets/product_card.dart';

class GridViewList extends StatelessWidget {
  GridViewList(this._products, {Key? key}) : super(key: key);

  final List<Product> _products;

  List<Product> _productListBuilder(BuildContext context) {
    return _products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 1,
        children: _productListBuilder(context).map<Widget>((product) {
          return ProductCard(
            product: product,
          );
        }).toList(),
      ),
    );
  }
}
