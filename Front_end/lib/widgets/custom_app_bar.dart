import 'package:flutter/material.dart';
import 'package:front_end/pages/shopping_basket_page.dart';

typedef SearchCallback = Function(String);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final preferredSize = new Size.fromHeight(164.0);
  final SearchCallback onTextChanged;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CustomAppBar(this.onTextChanged, this.scaffoldKey);

  var primaryColor = const Color(0xFF151026);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: Theme.of(context).primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
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
                        "Discover",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(48.0),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShoppingBasketPage())),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(
                  left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
              child: TextField(
                onChanged: (text) => onTextChanged(text),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 12.0),
                    child: Icon(Icons.search),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "What are you looking for?",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(width: 10.0, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
