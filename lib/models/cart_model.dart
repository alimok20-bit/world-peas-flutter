import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> product) {

  int index = _items.indexWhere(
    (item) => item['name'] == product['name'],
  );

  if (index != -1) {

    _items[index]['quantity']++;

  } else {

    _items.add({
      'name': product['name'],
      'price': product['price'],
      'quantity': 1,
    });

  }

  notifyListeners();
}

  void removeItem(Map<String, dynamic> product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
  double total = 0;

  for (var item in _items) {
    total += item['price'] * item['quantity'];
  }

  return total;
}
}