import 'package:flutter/material.dart';

class CartId with ChangeNotifier {
  int cartId = 0;

  void alterValue(int value) {
    cartId = value;
    notifyListeners();
  }
}
