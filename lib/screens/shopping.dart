import 'package:flutter/material.dart';
class ShoppingCart extends ChangeNotifier{
  List<String> _shoppingCart=[
    "basketball",
    "weed",
    "Gwagon",
    "bmw",
    "toyota"
  ];
  int get count =>_shoppingCart.length;
  List<String> get cart=>_shoppingCart;
  void addItem(String item){
    _shoppingCart.add(item);
    notifyListeners();
  }
  void removeItem(String item){
    _shoppingCart.remove(item);
    notifyListeners();
  }
}