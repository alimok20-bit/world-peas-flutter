import 'package:flutter/material.dart';

import '../services/database_service.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  Future<void> loadCart() async {
    final loadedItems = await DatabaseService.instance.getCartItems();
    _items
      ..clear()
      ..addAll(
        loadedItems.map((item) {
          return {
            'name': item['productName'] as String,
            'price': item['price'] as int,
            'quantity': item['quantity'] as int,
          };
        }),
      );
    notifyListeners();
  }

  Future<void> addItem(Map<String, dynamic> product) async {
    await DatabaseService.instance.addOrUpdateCartItem(
      product['name'] as String,
      product['price'] as int,
    );

    int index = _items.indexWhere((item) => item['name'] == product['name']);

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

  Future<void> removeItem(Map<String, dynamic> product) async {
    await DatabaseService.instance.removeCartItem(product['name'] as String);
    _items.removeWhere((item) => item['name'] == product['name']);
    notifyListeners();
  }

  Future<void> clearCart() async {
    await DatabaseService.instance.clearCart();
    _items.clear();
    notifyListeners();
  }

  Future<void> updateQuantity(String name, int quantity) async {
    await DatabaseService.instance.updateCartQuantity(name, quantity);
    final index = _items.indexWhere((item) => item['name'] == name);
    if (index != -1) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index]['quantity'] = quantity;
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;

    for (var item in _items) {
      total += (item['price'] as int) * (item['quantity'] as int);
    }

    return total;
  }
}
