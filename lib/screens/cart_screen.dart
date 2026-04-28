import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
  TextButton(
    onPressed: () {
      Provider.of<CartModel>(context, listen: false).clearCart();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Корзина очищена")),
      );
    },
    child: const Text(
      "Очистить",
      style: TextStyle(color: Color.fromARGB(255, 138, 99, 99)),
    ),
  ),
],
        title: const Text("Корзина"),
      ),
      

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {

                final item = cart.items[index];

                return ListTile(
  title: Text(item['name']),
  subtitle: Text("Количество: ${item['quantity']}"),
  trailing: Text("${item['price'] * item['quantity']} ₸"),
);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Итого: ${cart.totalPrice} ₸",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
