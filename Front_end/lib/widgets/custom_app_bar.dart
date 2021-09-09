import 'package:flutter/material.dart';
import 'package:front_end/pages/shopping_cart.dart';

typedef SearchCallback = Function(String);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final preferredSize = new Size.fromHeight(164.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 28, 0, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        "Lojinha",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(48.0),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShoppingCart()),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
